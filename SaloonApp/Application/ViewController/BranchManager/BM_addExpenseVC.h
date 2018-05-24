//
//  BM_addExpenseVC.h
//  SaloonApp
//
//  Created by VPN on 24/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BM_addExpenseVC : UIViewController
@property (weak, nonatomic) IBOutlet UIView *vwMain;
@property (weak, nonatomic) IBOutlet UITextField *txtExpenseName;
@property (weak, nonatomic) IBOutlet UITextField *txtExpenseAmount;
@property (weak, nonatomic) IBOutlet UITextView *txtExpenseNote;
@property (weak, nonatomic) IBOutlet UIButton *btnAddExpense;
- (IBAction)btnAddExpenseActionEvent:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *vwTop;

@end
