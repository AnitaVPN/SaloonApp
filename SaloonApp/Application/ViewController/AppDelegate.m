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


const CGFloat kBarHeight = 80;

@interface AppDelegate ()
{
    UITabBarController *tabbar;
}
@end

@implementation AppDelegate
@synthesize tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self setupRootVC];
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
    
    
//    [self setupTabBar];
    
    BM_report_allClientList *vc = [[BM_report_allClientList alloc]initWithNibName:IsPhone?@"BM_report_allClientList":@"BM_report_allClientList" bundle:nil];
    UINavigationController *root = [[UINavigationController alloc]initWithRootViewController:vc];
    root.navigationBarHidden = true;
    root.navigationBar.hidden = true;
    self.window.rootViewController = root;
    [self.window makeKeyAndVisible];
    
}

-(void)setupTabBar
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    StaffManagerHomePageVC * firstTab= [[StaffManagerHomePageVC alloc] initWithNibName:@"StaffManagerHomePageVC" bundle:nil];
    UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:firstTab];
    
    StaffManagerHomePageVC *sehirRehberi = [[StaffManagerHomePageVC alloc] initWithNibName:@"StaffManagerHomePageVC" bundle:nil];
    UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:sehirRehberi];
    
    StaffManagerHomePageVC *duyuru = [[StaffManagerHomePageVC alloc] initWithNibName:@"StaffManagerHomePageVC" bundle:nil];
    UINavigationController *navigationController3 = [[UINavigationController alloc] initWithRootViewController:duyuru];
    
    StaffManagerHomePageVC *sikayet = [[StaffManagerHomePageVC alloc] initWithNibName:@"StaffManagerHomePageVC" bundle:nil];
    UINavigationController *navigationController4 = [[UINavigationController alloc] initWithRootViewController:sikayet];
    
    StaffManagerHomePageVC *diger = [[StaffManagerHomePageVC alloc] initWithNibName:@"StaffManagerHomePageVC" bundle:nil];
    UINavigationController *navigationController5 = [[UINavigationController alloc] initWithRootViewController:diger];
    
    
    tabBarController = [[UITabBarController alloc] init];
    
    
//    tabBarController.tabBar.he
    
    tabBarController.tabBar.backgroundColor = [UIColor redColor];
    
    tabBarController.viewControllers = @[navigationController1,navigationController2,navigationController3,navigationController4,navigationController5];
    

   
//    tabBarController?.tabBar.frame.size.height

    
    [self.window setRootViewController:tabBarController];
    [self.window makeKeyAndVisible];
}



@end
