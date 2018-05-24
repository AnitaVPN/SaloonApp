//
//  cell_staff_tip.h
//  SaloonApp
//
//  Created by VPN on 24/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cell_staff_tip : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblStaffName;
@property (weak, nonatomic) IBOutlet UILabel *transactionID;
@property (weak, nonatomic) IBOutlet UILabel *paidDate;
@property (weak, nonatomic) IBOutlet UILabel *amount;
@property (weak, nonatomic) IBOutlet UIButton *btnPay;

@end
