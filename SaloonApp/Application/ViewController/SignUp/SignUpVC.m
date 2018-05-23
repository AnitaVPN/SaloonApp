//
//  SignUpVC.m
//  SaloonApp
//
//  Created by Apple on 09/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "SignUpVC.h"
#import "customerListVC.h"
#import "AppointmentVC.h"
#import "StaffManagerHomePageVC.h"
//#import "B"

@interface SignUpVC ()
{
}

@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - custom Methods
-(void)setup
{
    
    if(AppDeleObj.userType == 1)
    {
        _vwPOSLogin.hidden= true;
        _vwExixstingUser.hidden = true;

        
        [[Utils sharedInstance] setupTextFeild:_txtName :APP_BUTTONS_COLOR :YES :[UIImage imageNamed:@"icon_user"] :@"Please enter username"];
        
        [[Utils sharedInstance] setupTextFeild:_txtEmail :APP_BUTTONS_COLOR :YES :[UIImage imageNamed:@"icon_email"] :@"Please enter email address"];
        
        [[Utils sharedInstance] setupTextFeild:_txtMobileNumber :APP_BUTTONS_COLOR :YES :[UIImage imageNamed:@"icon_phone"] :@"Please enter phone number"];
        
        _btnRegister.layer.cornerRadius = 6;
        _btnRegister.clipsToBounds = true;
        
    }
    else if(AppDeleObj.userType == 3)
    {
        _vwExixstingUser.hidden = false;
        _vwLogin.hidden = true;
        _vwPOSLogin.hidden = true;
        
        [[Utils sharedInstance] setupTextFeild:_txtExixstingUser_mobiileNumber :APP_BUTTONS_COLOR :YES :[UIImage imageNamed:@"icon_phone"] :@"Please enter Mobile Number"];

        
    }
    else
    {
        _vwPOSLogin.hidden= false;
        _vwLogin.hidden = true;
        _vwExixstingUser.hidden = true;

        
        [[Utils sharedInstance] setupTextFeild:_txt_pos_email_address :APP_BUTTONS_COLOR :YES :[UIImage imageNamed:@"icon_user"] :@"Please employee username"];
        
        [[Utils sharedInstance] setupTextFeild:_txt_pos_password :APP_BUTTONS_COLOR :YES :[UIImage imageNamed:@"icon_password"] :@"Please enter password"];
        

        _btnPOSLogin.layer.cornerRadius = 6;
        _btnPOSLogin.clipsToBounds = true;
        

    }
}

#pragma mark- Button Click Methods

- (IBAction)btnRegClickEvent:(id)sender {
    
    if (IsPhone) {
        [[Utils sharedInstance] showAlert:@"IPAD Supported" : self];
        
    }
    else
    {
        
        
        AppointmentVC *vc = [[AppointmentVC alloc]initWithNibName:IsPhone?@"AppointmentVC":@"AppointmentVC_IPAD" bundle:nil];
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        
        [AppDeleObj.window setRootViewController:nav];
        [AppDeleObj.window makeKeyAndVisible];
    }
    
}
- (IBAction)btnPOSLoginClickEvent:(id)sender {
    
    self.navigationController.navigationBar.hidden = true;
    self.navigationController.navigationBarHidden = true;
    self.navigationController.navigationBar.hidden = true;
    
    if(IsPhone)
    {
        customerListVC *vc = [[customerListVC alloc]initWithNibName:@"customerListVC" bundle:nil];
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        
        [AppDeleObj.window setRootViewController:nav];
        [AppDeleObj.window makeKeyAndVisible];
        
    }
    else
    {
        StaffManagerHomePageVC *vc = [[StaffManagerHomePageVC alloc]initWithNibName:@"StaffManagerHomePageVC" bundle:nil];
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        
        [AppDeleObj.window setRootViewController:nav];
        [AppDeleObj.window makeKeyAndVisible];
    }
    
}

- (IBAction)btnBackClickEvent:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark- API MEthods
-(void)calAPIForLogin
{
    NSMutableDictionary *dictParam = [[NSMutableDictionary alloc]init];
    
   if(AppDeleObj.userType == 1)
   {
       [dictParam setValue:_txtName.text forKey:@"name"];
       [dictParam setValue:_txtEmail.text forKey:@"email_address"];
       [dictParam setValue:_txtMobileNumber.text forKey:@"mobileNumber"];

   }
    else
   {
       [dictParam setValue:_txt_pos_email_address.text forKey:@"email_address"];
       [dictParam setValue:_txt_pos_password.text forKey:@"password"];
   }
    
    [[ServerAPI shareInstance]invokeHTTPRequestPOST:@"url" paramDict:dictParam isTokeApply:true strToken:@"" withSucessBlock:^(id result) {
        NSLog(@"Sucess :- %@",result);
    } withFailureBlock:^(NSError *error) {
        NSLog(@"Error :- %@",error.localizedDescription);
    }];
    
    
    
    
    
    
}

- (IBAction)btnExistingUserTap:(id)sender {
    
    [self btnRegClickEvent:nil];
}
@end
