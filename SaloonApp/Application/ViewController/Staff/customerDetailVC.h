//
//  customerDetailVC.h
//  SaloonApp
//
//  Created by Apple on 09/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customerDetailVC : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tblCustomerDetails;
@property (weak, nonatomic) IBOutlet UIView *vwUser;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UISwitch *btnSwitch;
@property (weak, nonatomic) IBOutlet UILabel *lblAssistMe;
@property (weak, nonatomic) IBOutlet UIView *vwTip;
@property (weak, nonatomic) IBOutlet UILabel *lblTip;
- (IBAction)closeTipView:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnCloseTip;
@property (weak, nonatomic) IBOutlet UIView *vwFeedback;
@property (weak, nonatomic) IBOutlet UIView *vwFeedbackPopUp;
@property (weak, nonatomic) IBOutlet UIButton *btnCloseFeedbackPopUp;
@property (weak, nonatomic) IBOutlet UIButton *btnSendFeedback;
- (IBAction)btnSendFeedback:(id)sender;
- (IBAction)btnCloseFeedbackPopupClickEvent:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *txtFeedback;
@end
