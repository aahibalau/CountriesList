//
//  CountryDetailsViewController.m
//  CountriesList
//
//  Created by Andrei Ahibalau on 11/05/2023.
//

#import "CountryDetailsViewController.h"
#import "CountriesList-Swift.h"

@interface CountryDetailsViewController ()

@property (nonatomic, strong) CountryDetailsViewModel *viewModel;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UIStackView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *flagLabel;
@property (weak, nonatomic) IBOutlet UILabel *capitalLabel;
@property (weak, nonatomic) IBOutlet UILabel *continentLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@property (weak, nonatomic) IBOutlet UILabel *languagesLabel;

@end

@implementation CountryDetailsViewController

- (instancetype)initWithViewModel:(CountryDetailsViewModel *)viewModel {
  if (self = [super initWithNibName:nil bundle:nil]) {
    self.viewModel = viewModel;
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    [self.spinner setTranslatesAutoresizingMaskIntoConstraints:NO];
    return self;
  }
  return nil;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.contentView setAlpha:0];
  
  [self showSpinner];
  __weak CountryDetailsViewController *weakSelf = self;
  [self.viewModel loadDataWith:^(CountryDetails *details) {
    [weakSelf hideSpinner];
    [weakSelf updateViewWithDetails:details];
  } failure:^(NSError *error) {
    [weakSelf hideSpinner];
    [weakSelf showError];
  }];
}

//MARK: - Data Updates

- (void)updateViewWithDetails:(CountryDetails *)details {
  self.navigationItem.title = details.name;
  [self.flagLabel setText:details.flag];
  if (details.capital) {
    [self.capitalLabel setText:[NSString stringWithFormat:@"The capital of the country is %@", details.capital]];
  } else {
    [self.capitalLabel setText:@"No capital"];
  }
  [self.continentLabel setText:[NSString stringWithFormat:@"Continent name is %@", details.continent]];
  if (details.currency) {
    [self.currencyLabel setText:[NSString stringWithFormat:@"Official currency is %@", details.currency]];
  } else {
    [self.currencyLabel setText:@"Country hasn't official currenct"];
  }
  if (details.languages.count) {
    [self.languagesLabel setText:[NSString stringWithFormat:@"Official languages: %@", details.languagesString]];
  } else {
    [self.languagesLabel setText:@"Country hasn't official languages"];
  }
  
  [UIView animateWithDuration:0.15 animations:^{
    [self.contentView setAlpha:1];
  }];
  
}

- (void)showError {
  UIAlertController *alert = [UIAlertController new];
  alert.title = @"Error";
  alert.message = @"Something went wrong";
  __weak CountryDetailsViewController *weakSelf = self;
  UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
    [weakSelf.navigationController popViewControllerAnimated:YES];
  }];
  [alert addAction:action];
  [self presentViewController:alert animated:YES completion:nil];
}

//MARK: - Spinner

- (void)showSpinner {
  [self.view addSubview:self.spinner];
  [[self.view.centerXAnchor constraintEqualToAnchor:self.spinner.centerXAnchor] setActive:YES];
  [[self.view.centerYAnchor constraintEqualToAnchor:self.spinner.centerYAnchor] setActive:YES];
  [self.spinner startAnimating];
}

- (void)hideSpinner {
  [self.spinner stopAnimating];
  [self.spinner removeFromSuperview];
}

@end
