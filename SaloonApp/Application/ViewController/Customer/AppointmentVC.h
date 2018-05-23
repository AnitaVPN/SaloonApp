//
//  AppointmentVC.h
//  SaloonApp
//
//  Created by Apple on 09/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppointmentVC : UIViewController
@property (weak, nonatomic) IBOutlet UIView *vwTop;
@property (weak, nonatomic) IBOutlet UILabel *appTitle;
@property (weak, nonatomic) IBOutlet UIView *vwMain;
@property (weak, nonatomic) IBOutlet UICollectionView *clsProductService;
@property (weak, nonatomic) IBOutlet UIView *vwProdServ;
@property (weak, nonatomic) IBOutlet UIButton *btnProduct;
@property (weak, nonatomic) IBOutlet UIButton *btnService;
- (IBAction)btnProductClickEvent:(id)sender;
- (IBAction)btnServiceClickEvent:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnCart;
@property (weak, nonatomic) IBOutlet UILabel *lblCount;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *btnCartDisplay;
@property (weak, nonatomic) IBOutlet UITableView *tblResult;
- (IBAction)ShowResultView:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *vwResult;
@property (weak, nonatomic) IBOutlet UIButton *closeResultView;
- (IBAction)closeResultView:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnFilter;

@end
