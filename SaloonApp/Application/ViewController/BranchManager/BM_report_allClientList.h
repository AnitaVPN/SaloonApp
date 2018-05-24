//
//  BM_report_allClientList.h
//  SaloonApp
//
//  Created by VPN on 22/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BM_report_allClientList : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tblClients;
@property (weak, nonatomic) IBOutlet UIView *tblHeaderVw;
@property (weak, nonatomic) IBOutlet UIView *vwMain;
@property (weak, nonatomic) IBOutlet UILabel *lblTotal;
@property (weak, nonatomic) IBOutlet UIView *vwBottom;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalCredit;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalCash;
@end
