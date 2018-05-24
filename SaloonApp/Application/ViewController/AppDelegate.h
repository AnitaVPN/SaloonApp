//
//  AppDelegate.h
//  SaloonApp
//
//  Created by Apple on 04/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppointmentVC.h"
#import "BM_ClientHistoryVC.h"
#import "TabbarVC.h"
#import "BM_staffListingVC.h"
#import "BM_staffListingVC.h"


//API_AVAILABLE(ios(10.0))
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property  int userType;
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
//@property (readonly, strong) UITabBarController *tabBarController;
- (void)saveContext;
-(void)setupRootVC;
-(void)setupTabbar;
-(void)setupRootHomeVC;

@property (strong, nonatomic) TabbarVC *tabBarController;

@end

