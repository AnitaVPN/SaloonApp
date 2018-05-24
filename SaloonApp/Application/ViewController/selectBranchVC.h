//
//  selectBranchVC.h
//  SaloonApp
//
//  Created by VPN on 24/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface selectBranchVC : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnselectbranch;
@property (weak, nonatomic) IBOutlet UITableView *tblBranch;
@property (weak, nonatomic) IBOutlet UIButton *btnDone;
- (IBAction)btnDoneButtonClickEvent:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *vwMain;

@end
