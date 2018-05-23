//
//  cell_prodServ.m
//  SaloonApp
//
//  Created by Apple on 15/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "cell_prodServ.h"

@implementation cell_prodServ

- (void)awakeFromNib {
    [super awakeFromNib];


    self.vwPrice.layer.shadowOffset = CGSizeMake(1, 0);
     self.vwPrice.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
     self.vwPrice.layer.shadowRadius = 3;
     self.vwPrice.layer.shadowOpacity = .5;
    
     self.vwPrice.clipsToBounds = false;


}

@end
