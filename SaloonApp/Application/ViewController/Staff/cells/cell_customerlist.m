//
//  cell_customerlist.m
//  SaloonApp
//
//  Created by Apple on 14/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "cell_customerlist.h"

@implementation cell_customerlist

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.lblStatus.layer.cornerRadius = 5;
    self.lblStatus.clipsToBounds = true;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
