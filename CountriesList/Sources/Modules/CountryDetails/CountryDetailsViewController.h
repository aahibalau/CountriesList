//
//  CountryDetailsViewController.h
//  CountriesList
//
//  Created by Andrei Ahibalau on 11/05/2023.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CountryDetailsViewModel;

@interface CountryDetailsViewController : UIViewController

- (instancetype)initWithViewModel:(CountryDetailsViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
