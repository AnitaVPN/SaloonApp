//
//  TabbarVC.m
//  SaloonApp
//
//  Created by VPN on 23/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "TabbarVC.h"

@interface TabbarVC ()

@end
//const CGFloat kBarHeight = 80;

@implementation TabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //create a custom view for the tab bar
    CGRect frame = CGRectMake(0.0, 0.0, self.view.bounds.size.width, 80);
    UIView *v = [[UIView alloc] initWithFrame:frame];
    [v setBackgroundColor:[UIColor redColor]];
//    [v setAlpha:0.5];
//    [[self tabBar] addSubview:v];
    
    //set the tab bar title appearance for normal state
//    [[UITabBarItem appearance]
//     setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor whiteColor],
//                              UITextAttributeFont:[UIFont boldSystemFontOfSize:16.0f]}
//     forState:UIControlStateNormal];
//
//    //set the tab bar title appearance for selected state
//    [[UITabBarItem appearance]
//     setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor blueColor],
//                               UITextAttributeFont:[UIFont boldSystemFontOfSize:16.0f]}
//     forState:UIControlStateHighlighted];
    
    
//    self..
    
    [[UITabBar appearance] setItemWidth:SCREEN_WIDTH/5];

    [[UITabBar appearance] setItemWidth:204.0];

    
    [self.tabBar setBackgroundColor:[UIColor redColor]];
    [self.tabBar setTintColor:[UIColor whiteColor]];
    [self.tabBar setBarTintColor:[UIColor redColor]];
    [self.tabBar setTintColor:[UIColor whiteColor]];
    [self.tabBar setSelectedImageTintColor:[UIColor redColor]];

    if (@available(iOS 10.0, *)) {
        self.tabBar.unselectedItemTintColor = [UIColor whiteColor];
    } else {
        // Fallback on earlier versions
    }

    [[UITabBar appearance] setSelectionIndicatorImage:[self createImage:[UIColor colorWithRed:242.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1.0]]];

    

    
    
    
    
//    [[UITabBar appearance] setTintColor:[UIColor redColor]];
//
//    // Add this code to change StateNormal text Color,
//    [UITabBarItem.appearance setTitleTextAttributes:
//     @{NSForegroundColorAttributeName : [UIColor greenColor]}
//                                           forState:UIControlStateNormal];
//
//    // then if StateSelected should be different, you should add this code
//    [UITabBarItem.appearance setTitleTextAttributes:
//     @{NSForegroundColorAttributeName : [UIColor purpleColor]}
//                                           forState:UIControlStateSelected];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImage *)createImage: (UIColor *)color
{
    CGSize size = CGSizeMake(SCREEN_WIDTH/5, 80);
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    [color setFill];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)viewWillLayoutSubviews {
    
    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
    tabFrame.size.height = 80;
//    tabFrame.size.width = 216;
    tabFrame.origin.y = self.view.frame.size.height - 80;
    self.tabBar.frame = tabFrame;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
