//
//  HSTabBarViewController.m
//  CityInfoApp
//
//  Created by Anthony Roldan on 7/13/14.
//  Copyright (c) 2014 HubSpot. All rights reserved.
//

#import "HSTabBarViewController.h"
#import <HSSimpleWeatherApp.h>
#import <HSCityFactsApp.h>

@interface HSTabBarViewController ()

@end

@implementation HSTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)shouldPushViewController:(UIViewController *)controller {
    [((UINavigationController *) self.selectedViewController) pushViewController:controller animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
