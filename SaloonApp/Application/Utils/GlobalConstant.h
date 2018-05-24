//
//  GlobalConstant.h
//  NarolaGroups
//
//  Created by Apple on 17/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"



@interface GlobalConstant : NSObject
extern NSString *const FileExtension;

typedef enum
{
    Customer = 1,
    Staff,
    BranchManager,
} userType;

//WebService
#define SERVER_URL @"";
#define subDomainURL @""
#define loginURL @"";
#define SignUpURL @"";
#define ForgotPasswordURL @"";
#define changePasswordURL @"";

//APP SETTINGS
#define APP_BACKGROUND_IMAGE @"" 
#define AppName @"New York Thread"
#define APP_COLOR @"";
#define APP_BACKGROUND_COLOR [UIColor redColor];
#define APP_LABEL_COLOR @""
#define APP_STATUSBAR_COLOR @""
#define APP_NAVIGATIONBAR_COLOR @""
#define APP_SPLASH_SCREEN @""


#define isBranchSelected  @"isBranchSelected"

#define AppDeleObj ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define APP_BUTTONS_COLOR [UIColor colorWithRed:225.0/255.0 green:0.0/255.0 blue:21.0/255.0 alpha:1.0]

#define TRANSPARENT_COLOR [UIColor colorWithRed:169.0/255.0 green:169.0/255.0 blue:169.0/255.0 alpha:0.75];


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define isUserLogin @"isUserLogin"
#define statusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height);

#define IsPhone ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)


@end
