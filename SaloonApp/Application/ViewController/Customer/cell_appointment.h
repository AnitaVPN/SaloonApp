//
//  cell_appointment.h
//  SaloonApp
//
//  Created by Apple on 09/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cell_appointment : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgService;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIView *vw_checkmark;
@property (weak, nonatomic) IBOutlet UIView *vwMain;

@end
