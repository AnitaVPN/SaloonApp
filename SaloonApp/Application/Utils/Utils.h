//
//  Utils.h
//  NarolaGroups
//
//  Created by Apple on 17/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Utils : UIViewController

+ (instancetype)sharedInstance;

-(UITextField *)setupTextFeild :(UITextField *)txtFeild :(UIColor *)txtTextColor :(BOOL)isLeftView :(UIImage*)image :(NSString *)placeHolderText;

-(void)HideNavigationBar;
-(void)showNavigatioBar;
-(void)showAlert :(NSString *)strMsg : (UIViewController *)vc;
@end
