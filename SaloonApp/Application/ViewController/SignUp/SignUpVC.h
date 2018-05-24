//
//  SignUpVC.h
//  SaloonApp
//
//  Created by Apple on 09/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpVC : UIViewController

//@property (strong,nonatomic) 

@property (weak, nonatomic) IBOutlet UIView *vwLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtMobileNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UIButton *btnRegister;

@property (weak, nonatomic) IBOutlet UIView *vwPOSLogin;


- (IBAction)btnRegClickEvent:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *vwTop;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (weak, nonatomic) IBOutlet UIButton *btnBack;


@property (weak, nonatomic) IBOutlet UIView *vwExixstingUser;

@property BOOL isFromBranchManager;
@property (weak, nonatomic) IBOutlet UITextField *txt_pos_email_address;
@property (weak, nonatomic) IBOutlet UITextField *txt_pos_password;
@property (weak, nonatomic) IBOutlet UIButton *btnPOSLogin;
- (IBAction)btnPOSLoginClickEvent:(id)sender;
- (IBAction)btnBackClickEvent:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnExixstingUserClickEvent;
- (IBAction)btnExistingUserTap:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtExixstingUser_mobiileNumber;
@property (weak, nonatomic) IBOutlet UIImageView *appLogo;
@property (weak, nonatomic) IBOutlet UIView *vwTop1;

@end
