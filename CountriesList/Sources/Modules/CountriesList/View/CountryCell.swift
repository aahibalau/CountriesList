//
//  CountryCell.swift
//  CountriesList
//
//  Created by Andrei Ahibalau on 10/05/2023.
//

import UIKit

class CountryCell: UITableViewCell {
  var flagView: UIView?
  @IBOutlet weak var flagLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var continentLabel: UILabel!
  
  override func prepareForReuse() {
    flagView?.removeFromSuperview()
    flagView = nil
    continentLabel.text = nil
  }
  
  func configure(with country: Country) {
    nameLabel.text = country.name
    continentLabel.text = country.continent
    flagLabel.text = country.flag
    flagLabel.isHidden = country.flag == nil
  }
}
