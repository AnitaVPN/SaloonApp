//
//  customerHistoryVC.h
//  SaloonApp
//
//  Created by Apple on 14/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customerHistoryVC : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tblHistory;
@property (weak, nonatomic) IBOutlet UIView *vwClient;
@property (weak, nonatomic) IBOutlet UILabel *lblClientName;
@property (weak, nonatomic) IBOutlet UILabel *lblVisitCount;

@end
