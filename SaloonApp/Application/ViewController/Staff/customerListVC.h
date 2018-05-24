//
//  customerListVC.h
//  SaloonApp
//
//  Created by Apple on 09/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customerListVC : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tblCustomerList;

@property (weak, nonatomic) IBOutlet UIView *vwButtons;
@property (weak, nonatomic) IBOutlet UIButton *btnActiveCustomer;
@property (weak, nonatomic) IBOutlet UIButton *btnAllCustomer;
- (IBAction)btnAllCustomerClickEvent:(id)sender;
- (IBAction)btnActiveCustomerClickEvent:(id)sender;

@end
