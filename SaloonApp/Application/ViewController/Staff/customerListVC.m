//
//  customerListVC.m
//  SaloonApp
//
//  Created by Apple on 09/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "customerListVC.h"
#import "cell_customerlist.h"
#import "customerDetailVC.h"

@interface customerListVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrCustomers;
    NSMutableArray *arrCustomersDB;
}
@end

@implementation customerListVC

- (void)viewDidLoad {
    [super viewDidLoad];
  //  self.title = AppName;
    
    
    UIImageView *navImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_white"]];
    navImageView.frame = CGRectMake(0, 0, (SCREEN_WIDTH/2), 20);
    navImageView.contentMode = UIViewContentModeScaleAspectFit;
    UIView *titleView = [[UIView alloc] initWithFrame:navImageView.frame];
    navImageView.center = titleView.center;
    [titleView addSubview:navImageView];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
//    self.navigationController.navigationBar.translucent = false;
    self.navigationItem.titleView = titleView;
    
    [self setUpTableView];
    // Do any additional setup after loading the view from its nib.
}

-(void)setUpTableView
{
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    _vwButtons.layer.borderColor = [UIColor grayColor].CGColor;
    _vwButtons.layer.borderWidth = 1.5;
    
    [_btnAllCustomer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btnAllCustomer setBackgroundColor:[UIColor redColor]];
    
    
    arrCustomers = [[NSMutableArray alloc]init];
    arrCustomersDB = [[NSMutableArray alloc]init];
    
    _tblCustomerList.delegate = self;
    _tblCustomerList.dataSource = self;
    [_tblCustomerList registerNib:[UINib nibWithNibName:@"cell_customerlist" bundle:nil] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- Tableview Delegate methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
    //return arrCustomers.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell_customerlist *cell;
    cell = (cell_customerlist *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    

    cell.vwMain.layer.shadowRadius  = 1.5f;
    cell.vwMain.layer.shadowColor   = [UIColor lightGrayColor].CGColor;
    cell.vwMain.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
    cell.vwMain.layer.shadowOpacity = 0.9f;
    cell.vwMain.layer.masksToBounds = NO;
    
    UIEdgeInsets shadowInsets     = UIEdgeInsetsMake(0, 0, -1.5f, 0);
    UIBezierPath *shadowPath      = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(cell.vwMain.bounds, shadowInsets)];
    cell.vwMain.layer.shadowPath    = shadowPath.CGPath;

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"did select call");
    
    customerDetailVC *vc = [[customerDetailVC alloc]initWithNibName:@"customerDetailVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:true];
    
}
- (IBAction)btnAllCustomerClickEvent:(id)sender {
   
    [_btnAllCustomer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btnAllCustomer setBackgroundColor:[UIColor redColor]];
    
    [_btnActiveCustomer setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_btnActiveCustomer setBackgroundColor:[UIColor whiteColor]];
    
}

- (IBAction)btnActiveCustomerClickEvent:(id)sender {
    
    
    [_btnActiveCustomer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btnActiveCustomer setBackgroundColor:[UIColor redColor]];
    
    [_btnAllCustomer setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_btnAllCustomer setBackgroundColor:[UIColor whiteColor]];
   
}
@end
