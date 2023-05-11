//
//  CountriesListViewController.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 10/05/2023.
//

import UIKit
import Combine

class CountriesListViewController: UIViewController {
  let tableView: UITableView
  let dataSource: UITableViewDiffableDataSource<Int, Country>
  let viewModel: CountriesListViewModel
  let spinner = UIActivityIndicatorView(style: .large)
  private var bag: Set<AnyCancellable> = []
  
  init(viewModel: CountriesListViewModel) {
    self.viewModel = viewModel
    let tableView = UITableView(frame: .zero)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(CountryCell.nib, forCellReuseIdentifier: CountryCell.reuseId)
    self.tableView = tableView
    self.dataSource = UITableViewDiffableDataSource<Int, Country>(tableView: tableView) { tableView, indexPath, country in
      guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.reuseId, for: indexPath) as? CountryCell else { return nil }
      cell.configure(with: country)
      return cell
    }
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Countries"
    tableView.delegate = self
    view.addSubview(tableView)
    view.topAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
    view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor).isActive = true
    view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor).isActive = true
    view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
    
    showSpinner()
    viewModel.loadData()
      .sink { [weak self] completion in
        self?.hideSpinner()
      } receiveValue: { [weak self] countries in
        self?.updateSnapshot(with: countries)
        self?.hideSpinner()
      }
      .store(in: &bag)
  }
  
  private func updateSnapshot(with countries: [Country]) {
    var snapshot = dataSource.snapshot()
    snapshot.deleteAllItems()
    snapshot.appendSections([0])
    snapshot.appendItems(countries)
    
    dataSource.apply(snapshot, animatingDifferences: false)
  }
  
  private func showSpinner() {
    view.addSubview(spinner)
    spinner.translatesAutoresizingMaskIntoConstraints = false
    view.centerXAnchor.constraint(equalTo: spinner.centerXAnchor).isActive = true
    view.centerYAnchor.constraint(equalTo: spinner.centerYAnchor).isActive = true
    spinner.startAnimating()
  }
  
  private func hideSpinner() {
    spinner.stopAnimating()
    spinner.removeFromSuperview()
  }
}

extension CountriesListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let item = dataSource.snapshot().itemIdentifiers(inSection: indexPath.section)[indexPath.row]
    viewModel.countrySelected(with: item.id)
  }
}
