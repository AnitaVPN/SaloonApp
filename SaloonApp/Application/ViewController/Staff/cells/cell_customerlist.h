//
//  cell_customerlist.h
//  SaloonApp
//
//  Created by Apple on 14/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cell_customerlist : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblServices;
@property (weak, nonatomic) IBOutlet UILabel *lblAssistance;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UIButton *lblStatus;
@property (weak, nonatomic) IBOutlet UIView *vwMain;

@end
