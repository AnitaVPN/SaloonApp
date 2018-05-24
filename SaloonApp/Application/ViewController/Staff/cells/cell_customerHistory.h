//
//  cell_customerHistory.h
//  SaloonApp
//
//  Created by Apple on 14/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cell_customerHistory : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblServices;
@property (weak, nonatomic) IBOutlet UILabel *lblProducts;
@property (weak, nonatomic) IBOutlet UILabel *lblAssistPersonName;
@property (weak, nonatomic) IBOutlet UILabel *lblPaymentType;
@property (weak, nonatomic) IBOutlet UILabel *lblAmount;


@property (weak, nonatomic) IBOutlet UIView *vwServices;
@property (weak, nonatomic) IBOutlet UIView *vwProducts;

@property (weak, nonatomic) IBOutlet UIView *vwAssistance;
@property (weak, nonatomic) IBOutlet UIView *vwAmount;
@property (weak, nonatomic) IBOutlet UIView *vwMain;



@end
