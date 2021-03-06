//
//  BM_AccountVC.m
//  SaloonApp
//
//  Created by VPN on 22/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "BM_AccountVC.h"
#import "cell_staff_reports.h"

@interface BM_AccountVC () <UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrReports;
}
@end

@implementation BM_AccountVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrReports = [[NSMutableArray alloc]initWithObjects:@"Total Earning",@"Total Customer",@"Total Product Selling", nil];
    
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
    
    
    cell.lblPrice.hidden = false;
    cell.btnArrow.hidden = false;
    
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
- (IBAction)btnBackClickEvent:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
}

@end
