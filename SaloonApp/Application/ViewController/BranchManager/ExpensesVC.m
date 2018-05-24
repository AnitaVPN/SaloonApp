//
//  ExpensesVC.m
//  SaloonApp
//
//  Created by VPN on 23/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "ExpensesVC.h"
#import "cell_branch_expenses.h"
#import "BM_addExpenseVC.h"

@interface ExpensesVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ExpensesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupTableView
{
    
    _tblExpenses.delegate = self;
    _tblExpenses.dataSource = self;
    
    [_tblExpenses registerNib:[UINib nibWithNibName:@"cell_branch_expenses" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    _tblExpenses.tableHeaderView =_tblHeaderView;
    
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
    return 10;;
    //return arrCustomers.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell_branch_expenses *cell;
    cell = (cell_branch_expenses *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
//    cell.lblPrice.hidden = false;
//    cell.btnArrow.hidden = false;
//
//    cell.lblName.text = [arrReports objectAtIndex:indexPath.row];
    
    //    cell.backgroundColor = [UIColor whiteColor];
//    cell.vwMain.layer.shadowOffset = CGSizeMake(1, 0);
//    cell.vwMain.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
//    cell.vwMain.layer.shadowRadius = 5;
//    cell.vwMain.layer.shadowOpacity = .8;
//    cell.vwMain.clipsToBounds = false;
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60       ;
}
- (IBAction)btnBackClickEvent:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)addExpenseActionEvent:(id)sender {

    BM_addExpenseVC *vc = [[BM_addExpenseVC alloc] initWithNibName:@"BM_addExpenseVC" bundle:nil];
    
    [self.navigationController pushViewController:vc animated:true];
    
}


@end
