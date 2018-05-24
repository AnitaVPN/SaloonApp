//
//  StaffManagerHomePageVC.m
//  SaloonApp
//
//  Created by Apple on 14/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "StaffManagerHomePageVC.h"
#import "cell_staff_clientList.h"
#import "staff_checkOutVC.h"

@interface StaffManagerHomePageVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation StaffManagerHomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpTableView
{
    
    _tblClients.delegate = self;
    _tblClients.dataSource = self;
    [_tblClients registerNib:[UINib nibWithNibName:@"cell_staff_clientList" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
//    _vwMain.layer.borderColor = [UIColor lightTextColor].CGColor;
//    _vwMain.layer.borderWidth = 2;
//    _vwMain.clipsToBounds = true;
    
    
    self.vwMain.layer.shadowOffset = CGSizeMake(1, 0);
    self.vwMain.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.vwMain.layer.shadowRadius = 5;
    self.vwMain.layer.shadowOpacity = .8;
    self.vwMain.clipsToBounds = false;
}

#pragma mark- Tableview Delegate methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
    //return arrCustomers.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell_staff_clientList *cell;
    cell = (cell_staff_clientList *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    staff_checkOutVC *vc =   [[staff_checkOutVC alloc]initWithNibName:@"staff_checkOutVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:true];
}

@end
