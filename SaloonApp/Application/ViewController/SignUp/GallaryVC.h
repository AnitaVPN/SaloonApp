//
//  GallaryVC.h
//  SaloonApp
//
//  Created by Apple on 12/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GallaryVC : UIViewController
@property (weak, nonatomic) IBOutlet UIView *vwMain;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *vwTransparent;
@property (weak, nonatomic) IBOutlet UIButton *btnAppointment;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnStaffLogin;

- (IBAction)btnStaffLoginClickEvent:(id)sender;


-(IBAction)btnBookApointmentClickEvent:(id)sender;
- (IBAction)btnPOSLoginClickEvent:(id)sender;

@end
