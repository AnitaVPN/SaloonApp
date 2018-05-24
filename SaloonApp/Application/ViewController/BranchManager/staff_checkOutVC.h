//
//  staff_checkOutVC.h
//  SaloonApp
//
//  Created by VPN on 21/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface staff_checkOutVC : UIViewController
@property (weak, nonatomic) IBOutlet UIView *vwTop;
@property (weak, nonatomic) IBOutlet UIView *vwMain;
@property (weak, nonatomic) IBOutlet UIView *vwTableView;
@property (weak, nonatomic) IBOutlet UIView *vwRightTop;
@property (weak, nonatomic) IBOutlet UIView *vwRightBottom;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalAmount;
@property (weak, nonatomic) IBOutlet UIButton *btnCash;
@property (weak, nonatomic) IBOutlet UIButton *btnCreditCard;
@property (weak, nonatomic) IBOutlet UIButton *btnRedeemGift;
@property (weak, nonatomic) IBOutlet UIView *vwUserInfo;
@property (weak, nonatomic) IBOutlet UIView *vwTotal;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblUserPhoneNumber;
@property (weak, nonatomic) IBOutlet UIView *vwBestOffer;
@property (weak, nonatomic) IBOutlet UITableView *tblOrders;
@property (weak, nonatomic) IBOutlet UIView *vwTotalAmnt;
@property (strong, nonatomic) IBOutlet UIView *vwTip;

@property (weak, nonatomic) IBOutlet UITextField *txtTipAmnt;
@property (weak, nonatomic) IBOutlet UIButton *btnSkip;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
- (IBAction)btnSkip:(id)sender;
- (IBAction)btnAdd:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnInvoice;
@property (weak, nonatomic) IBOutlet UIButton *btnPayment;
- (IBAction)btnInvoiceClickEvent:(id)sender;
- (IBAction)btnPaymentClickEvent:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *vwTipPopUp;



@end
