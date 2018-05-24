//
//  BM_ReportListing.m
//  SaloonApp
//
//  Created by VPN on 22/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "BM_ReportListing.h"
#import "cell_staff_reports.h"
#import "BM_report_allClientList.h"
#import "BM_CashManagementVC.h"
#import "BM_staffListingVC.h"
#import "BM_productReportVC.h"

@interface BM_ReportListing ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrReports;
}
@end

@implementation BM_ReportListing

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrReports = [[NSMutableArray alloc]initWithObjects:@"Clients",@"Staff Members",@"Orders",@"Stocks",@"Cash Management", nil];
    
    [self setupTableView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupTableView
{
    
    _tblReports.delegate = self;
    _tblReports.dataSource = self;
    
    [_tblReports registerNib:[UINib nibWithNibName:@"cell_staff_reports" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
//    [_tblReports registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
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
    return arrReports.count;;
    //return arrCustomers.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell_staff_reports *cell;
    cell = (cell_staff_reports *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
 
    cell.lblName.text = [arrReports objectAtIndex:indexPath.row];
    
//    cell.backgroundColor = [UIColor whiteColor];
    cell.vwMain.layer.shadowOffset = CGSizeMake(1, 0);
    cell.vwMain.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    cell.vwMain.layer.shadowRadius = 5;
    cell.vwMain.layer.shadowOpacity = .8;
    cell.vwMain.clipsToBounds = false;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100       ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0 )
    {
        BM_report_allClientList *vc = [[BM_report_allClientList alloc]initWithNibName:@"BM_report_allClientList" bundle:nil];
        
        [self.navigationController pushViewController:vc animated:self];
    }
    if(indexPath.row == 1)
    {
        
        BM_staffListingVC *vc = [[BM_staffListingVC alloc]initWithNibName:@"BM_staffListingVC" bundle:nil];
        
        [self.navigationController pushViewController:vc animated:self];
    }
    
    if(indexPath.row == 3)
    {
        
        BM_productReportVC *vc = [[BM_productReportVC alloc]initWithNibName:@"BM_productReportVC" bundle:nil];
        
        [self.navigationController pushViewController:vc animated:self];
    }
    if(indexPath.row == 4 )
    {
        BM_CashManagementVC *vc = [[BM_CashManagementVC alloc]initWithNibName:@"BM_CashManagementVC" bundle:nil];
        [self.navigationController pushViewController:vc animated:self];
    }
}

@end
