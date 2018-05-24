//
//  BM_addExpenseVC.m
//  SaloonApp
//
//  Created by VPN on 24/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "BM_addExpenseVC.h"

@interface BM_addExpenseVC ()

@end

@implementation BM_addExpenseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupView
{
    self.txtExpenseName.layer.shadowOffset = CGSizeMake(1, 0);
    self.txtExpenseName.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.txtExpenseName.layer.shadowRadius = 5;
    self.txtExpenseName.layer.shadowOpacity = .8;
    self.txtExpenseName.clipsToBounds = false;
    
    self.txtExpenseAmount.layer.shadowOffset = CGSizeMake(1, 0);
    self.txtExpenseAmount.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.txtExpenseAmount.layer.shadowRadius = 5;
    self.txtExpenseAmount.layer.shadowOpacity = .8;
    self.txtExpenseAmount.clipsToBounds = false;
    
    self.txtExpenseNote.layer.shadowOffset = CGSizeMake(1, 0);
    self.txtExpenseNote.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.txtExpenseNote.layer.shadowRadius = 5;
    self.txtExpenseNote.layer.shadowOpacity = .8;
    self.txtExpenseNote.clipsToBounds = false;
    
    
    self.vwMain.layer.shadowOffset = CGSizeMake(1, 0);
    self.vwMain.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.vwMain.layer.shadowRadius = 5;
    self.vwMain.layer.shadowOpacity = .8;
    self.vwMain.clipsToBounds = false;
}

- (IBAction)btnAddExpenseActionEvent:(id)sender {
}
- (IBAction)backClickEvent:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}


@end
