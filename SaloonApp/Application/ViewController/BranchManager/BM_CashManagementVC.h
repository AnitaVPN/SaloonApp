//
//  BM_CashManagementVC.h
//  SaloonApp
//
//  Created by VPN on 22/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BM_CashManagementVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtTotalAmont;
@property (weak, nonatomic) IBOutlet UITextField *txtBasicCashAmnt;
@property (weak, nonatomic) IBOutlet UITextField *selectDateTime;
@property (weak, nonatomic) IBOutlet UITextField *txtUniqueID;
@property (weak, nonatomic) IBOutlet UITextView *txtNote;
@property (weak, nonatomic) IBOutlet UIButton *btnSafe;
@property (weak, nonatomic) IBOutlet UIButton *btnBank;
- (IBAction)btnAddAmountToSafeClickEvent:(id)sender;
- (IBAction)btnAddAmountToBANKClickEvent:(id)sender;

@end
