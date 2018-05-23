//
//  cell_prodServ.h
//  SaloonApp
//
//  Created by Apple on 15/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cell_prodServ : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *vwPrice;


@property (weak, nonatomic) IBOutlet UIImageView *imgService;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnPrice;
@property (weak, nonatomic) IBOutlet UIButton *btnCart;
@property (weak, nonatomic) IBOutlet UIView *vwMain;
@property (weak, nonatomic) IBOutlet UIView *vw_checkmark;
@end
