//
//  ExpensesVC.h
//  SaloonApp
//
//  Created by VPN on 23/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpensesVC : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tblExpenses;
@property (weak, nonatomic) IBOutlet UIView *tblHeaderView;
@property (weak, nonatomic) IBOutlet UIView *vwMain;

@end
