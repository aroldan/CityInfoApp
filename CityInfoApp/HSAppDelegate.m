//
//  HSAppDelegate.m
//  CityInfoApp
//
//  Created by Anthony Roldan on 7/13/14.
//  Copyright (c) 2014 HubSpot. All rights reserved.
//

#import "HSAppDelegate.h"
#import "HSTabBarViewController.h"
#import <HSSimpleWeatherApp.h>
#import <HSCityFactsApp.h>
#import <HSRoute.h>
#import <JLRoutes.h>

@implementation HSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSArray *apps = @[[HSCityFactsApp class], [HSSimpleWeatherApp class]];
    HSTabBarViewController *baseTabController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    
    NSMutableArray *baseVCs = [[NSMutableArray alloc] init];
    // iterate through apps, add to navigation controller
    [apps enumerateObjectsUsingBlock:^(id<HSBaseApp> app, NSUInteger idx, BOOL *stop) {
        [baseVCs addObject:[app baseNavigationController]];
        
        [[app routesToRegister] enumerateObjectsUsingBlock:^(HSRoute *route, NSUInteger idx, BOOL *stop) {
            NSLog(@"Registering route %@ in app %@", route.url, [app appIdentifierString]);
            [JLRoutes addRoute:route.url handler:^BOOL(NSDictionary *parameters) {
                route.action(baseTabController, route.url, parameters);
                return YES;
            }];
        }];
    }];
    
    baseTabController.viewControllers = [baseVCs copy];
    [self.window setRootViewController:baseTabController];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
