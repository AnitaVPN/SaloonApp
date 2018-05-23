//
//  cell_staff_reports.h
//  SaloonApp
//
//  Created by VPN on 22/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cell_staff_reports : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *vwMain;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;

@property (weak, nonatomic) IBOutlet UIButton *btnArrow;

@end
