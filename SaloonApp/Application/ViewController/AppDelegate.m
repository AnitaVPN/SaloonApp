        //
//  AppDelegate.m
//  SaloonApp
//
//  Created by Apple on 04/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "AppDelegate.h"
#import "SignUpVC.h"
#import "GallaryVC.h"
#import "StaffManagerHomePageVC.h"
#import "staff_checkOutVC.h"
#import "BM_ReportListing.h"
#import "BM_AccountVC.h"
#import "BM_CashManagementVC.h"
#import "BM_report_allClientList.h"
#import "TabbarVC.h"
#import "BM_MainAccountVC.h"
#import "selectBranchVC.h"
//#import "Sign"


const CGFloat kBarHeight = 80;

@interface AppDelegate ()
{
    UITabBarController *tabbar;
}
@end

@implementation AppDelegate
@synthesize tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//    [self setupRootVC];
    
    
    
    BOOL isBranchSel = [[NSUserDefaults standardUserDefaults] valueForKey:isBranchSelected];
    
    if(isBranchSel == nil || isBranchSel == false)
    {
        selectBranchVC *vc = [[selectBranchVC alloc]initWithNibName:IsPhone?@"selectBranchVC":@"selectBranchVC" bundle:nil];
        UINavigationController *root = [[UINavigationController alloc]initWithRootViewController:vc];
        root.navigationBarHidden = true;
        root.navigationBar.hidden = true;
        self.window.rootViewController = root;
        [self.window makeKeyAndVisible];
        
    }
    else
    {
        [self setupRootHomeVC];

    }
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"SaloonApp"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

-(void)setupRootVC
{
    
    SignUpVC *vc = [[SignUpVC alloc]initWithNibName:IsPhone?@"SignUpVC":@"SignUpVC_IPAD" bundle:nil];
    UINavigationController *root = [[UINavigationController alloc]initWithRootViewController:vc];
    root.navigationBarHidden = true;
    root.navigationBar.hidden = true;
    self.window.rootViewController = root;
    [self.window makeKeyAndVisible];
    
}

-(void)setupRootHomeVC
{
    
    GallaryVC *vc = [[GallaryVC alloc]initWithNibName:IsPhone?@"GallaryVC":@"GallaryVC_IPAD" bundle:nil];
    UINavigationController *root = [[UINavigationController alloc]initWithRootViewController:vc];
    root.navigationBarHidden = true;
    root.navigationBar.hidden = true;
    self.window.rootViewController = root;
    [self.window makeKeyAndVisible];
    
}

-(void)setupTabbar
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //create the view controller for the first tab
    SignUpVC *vc1 = [[SignUpVC alloc] initWithNibName:@"SignUpVC_IPAD" bundle:nil];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    self.userType = 1;
    vc1.isFromBranchManager = YES;
    nav1.navigationBarHidden = true;
    nav1.tabBarItem.title = @"Add Client";
    nav1.tabBarItem.image = [UIImage imageNamed:@"tab_addcustomer_white"];
    
    
    BM_ReportListing *vc2 = [[BM_ReportListing alloc] initWithNibName:@"BM_ReportListing" bundle:nil];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    nav2.tabBarItem.title = @"Reports";
    nav2.navigationBarHidden = true;
    nav2.tabBarItem.image = [UIImage imageNamed:@"tab_reports_white"];
    
    StaffManagerHomePageVC *vc3 = [[StaffManagerHomePageVC alloc] initWithNibName:@"StaffManagerHomePageVC" bundle:nil];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    nav3.tabBarItem.title = @"Clients";
    nav3.navigationBarHidden = true;
    nav3.tabBarItem.image = [UIImage imageNamed:@"tab_clients_white"];
    
    
    BM_staffListingVC *vc4 = [[BM_staffListingVC alloc] initWithNibName:@"BM_staffListingVC" bundle:nil];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    nav4.tabBarItem.title = @"Staff";
    nav4.navigationBarHidden = true;
    nav4.tabBarItem.image = [UIImage imageNamed:@"tab_staff_white"];
    
    
    
    BM_MainAccountVC *vc5 = [[BM_MainAccountVC alloc] initWithNibName:@"BM_MainAccountVC" bundle:nil];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:vc5];
    nav5.tabBarItem.title = @"Account";
    nav5.tabBarItem.image = [UIImage imageNamed:@"tab_account_white"];
    
    nav5.navigationBarHidden = true;
    //    nav5.tabBarItem
    
    
    [[self.tabBarController navigationController] setNavigationBarHidden:YES animated:YES];
    
    
    //create the view controller for the second tab
    
    [[UITabBar appearance] setItemWidth:SCREEN_WIDTH/5];
    
    [[UITabBar appearance] setItemWidth:204.0];
    
    //create an array of all view controllers that will represent the tab at the bottom
    NSArray *myViewControllers = [[NSArray alloc] initWithObjects:nav1,nav2,nav3,nav4,nav5, nil];
    
    
    self.tabBarController.tabBar.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    //initialize the tab bar controller
    self.tabBarController = [[TabbarVC alloc] init];

    
    //set the view controllers for the tab bar controller
    [self.tabBarController setViewControllers:myViewControllers];
    
    self.tabBarController.navigationController.navigationBarHidden = true;
    self.tabBarController.navigationController.navigationBar.hidden = true;
    
    
    
    self.window.rootViewController = self.tabBarController;
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}



@end
