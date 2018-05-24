//
//  BM_productReportVC.h
//  SaloonApp
//
//  Created by VPN on 24/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BM_productReportVC : UIViewController
@property (weak, nonatomic) IBOutlet UIView *vwFilter;
@property (weak, nonatomic) IBOutlet UIView *vwTop;
@property (weak, nonatomic) IBOutlet UIView *vwMain;
@property (weak, nonatomic) IBOutlet UITableView *tblProductList;
@property (weak, nonatomic) IBOutlet UIView *vwProductDetails;
@property (weak, nonatomic) IBOutlet UILabel *lblProductName;
@property (weak, nonatomic) IBOutlet UILabel *lblProductCode;
@property (weak, nonatomic) IBOutlet UILabel *lblProductStock;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalProductPurchased;
@property (weak, nonatomic) IBOutlet UILabel *lblAvailableStock;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UIView *vwProd;
@property (weak, nonatomic) IBOutlet UIView *vwProductName;
@property (weak, nonatomic) IBOutlet UIView *vwSubProduct;

@end
