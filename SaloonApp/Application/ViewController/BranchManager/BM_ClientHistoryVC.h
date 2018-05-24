//
//  BM_ClientHistoryVC.h
//  SaloonApp
//
//  Created by VPN on 22/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BM_ClientHistoryVC : UIViewController
@property (weak, nonatomic) IBOutlet UIView *vwMain;
@property (weak, nonatomic) IBOutlet UIView *vwUserDetails;
@property (weak, nonatomic) IBOutlet UIView *vwTableView;
@property (weak, nonatomic) IBOutlet UILabel *lblClientName;
@property (weak, nonatomic) IBOutlet UILabel *lblVisitCount;
@property (weak, nonatomic) IBOutlet UIView *tblHeaderView;
@property (weak, nonatomic) IBOutlet UITableView *tblClients;

@end
