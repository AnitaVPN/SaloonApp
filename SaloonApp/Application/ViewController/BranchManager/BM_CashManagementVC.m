//
//  BM_CashManagementVC.m
//  SaloonApp
//
//  Created by VPN on 22/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "BM_CashManagementVC.h"

@interface BM_CashManagementVC ()

@end

@implementation BM_CashManagementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _btnSafe.layer.borderColor = [UIColor grayColor].CGColor;
    _btnSafe.layer.borderWidth = 1.5;
    
    _txtNote.layer.borderColor = [UIColor grayColor].CGColor;
    _txtNote.layer.borderWidth = 1.5;
    
    [self setupView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupView
{
    
    self.vwMain.layer.shadowOffset = CGSizeMake(1, 0);
    self.vwMain.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.vwMain.layer.shadowRadius = 5;
    self.vwMain.layer.shadowOpacity = .8;
    self.vwMain.clipsToBounds = false;
    
    
    self.txtUniqueID.layer.shadowOffset = CGSizeMake(1, 0);
    self.txtUniqueID.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.txtUniqueID.layer.shadowRadius = 5;
    self.txtUniqueID.layer.shadowOpacity = .8;
    self.txtUniqueID.clipsToBounds = false;
    
    self.txtNote.layer.shadowOffset = CGSizeMake(1, 0);
    self.txtNote.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.txtNote.layer.shadowRadius = 5;
    self.txtNote.layer.shadowOpacity = .8;
    self.txtNote.clipsToBounds = false;
    
    self.txtBasicCashAmnt.layer.shadowOffset = CGSizeMake(1, 0);
    self.txtBasicCashAmnt.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.txtBasicCashAmnt.layer.shadowRadius = 5;
    self.txtBasicCashAmnt.layer.shadowOpacity = .8;
    self.txtBasicCashAmnt.clipsToBounds = false;
    
    self.txtTotalAmont.layer.shadowOffset = CGSizeMake(1, 0);
    self.txtTotalAmont.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.txtTotalAmont.layer.shadowRadius = 5;
    self.txtTotalAmont.layer.shadowOpacity = .8;
    self.txtTotalAmont.clipsToBounds = false;
    
    self.selectDateTime.layer.shadowOffset = CGSizeMake(1, 0);
    self.selectDateTime.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.selectDateTime.layer.shadowRadius = 5;
    self.selectDateTime.layer.shadowOpacity = .8;
    self.selectDateTime.clipsToBounds = false;
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnAddAmountToSafeClickEvent:(id)sender {
}
- (IBAction)btnBackButtonClickEvent:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
}



- (IBAction)btnAddAmountToBANKClickEvent:(id)sender {
}
@end
