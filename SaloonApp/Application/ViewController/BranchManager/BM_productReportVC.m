//
//  BM_productReportVC.m
//  SaloonApp
//
//  Created by VPN on 24/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "BM_productReportVC.h"

@interface BM_productReportVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrProducts;
}
@end

@implementation BM_productReportVC

- (void)viewDidLoad {
    [super viewDidLoad];
    arrProducts = [[NSMutableArray alloc]init];
    [arrProducts addObject:@"FacePowder"];
    [arrProducts addObject:@"Skin Moisturizer"];
    [arrProducts addObject:@"Wax"];
    [arrProducts addObject:@"Scrub"];
    [arrProducts addObject:@"Bleach"];
    [arrProducts addObject:@"Cleansing Milk"];

    [self setupTableView];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupTableView
{
    
    _tblProductList.delegate = self;
    _tblProductList.dataSource = self;
    
    [_tblProductList registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
//    [_tblProductList registerNib:[UINib nibWithNibName:@"cell_staff_tip" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    
    //    [_tblReports registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.vwMain.layer.shadowOffset = CGSizeMake(1, 0);
    self.vwMain.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.vwMain.layer.shadowRadius = 5;
    self.vwMain.layer.shadowOpacity = .8;
    self.vwMain.clipsToBounds = false;
    
    
    self.vwProd.layer.shadowOffset = CGSizeMake(1, 0);
    self.vwProd.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.vwProd.layer.shadowRadius = 5;
    self.vwProd.layer.shadowOpacity = .8;
    self.vwProd.clipsToBounds = false;
    
    
    
    self.vwSubProduct.layer.cornerRadius = 5;
//    self.vwSubProduct.clipsToBounds = true;
    self.vwSubProduct.layer.shadowOffset = CGSizeMake(1, 0);
    self.vwSubProduct.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.vwSubProduct.layer.shadowRadius = 5;
    self.vwSubProduct.layer.shadowOpacity = .8;
    self.vwSubProduct.clipsToBounds = false;
    
    self.tblProductList.tableFooterView = [UIView new];
    
    _tblProductList.superview.layer.borderWidth = 1.5;
    _tblProductList.superview.layer.borderColor = [UIColor darkGrayColor].CGColor;
    

}


#pragma mark- Tableview Delegate methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrProducts.count;;
    //return arrCustomers.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [arrProducts objectAtIndex:indexPath.row];
    
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:24];
    
    
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60       ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = [arrProducts objectAtIndex:indexPath.row];
    _lblProductName.text = str;
    
    UITableViewCell *cell = [_tblProductList cellForRowAtIndexPath:indexPath];
    cell.frame = CGRectMake(0, 2, cell.frame.size.width, cell.frame.size.height - 4);
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor darkGrayColor];
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_tblProductList cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.backgroundColor = [UIColor clearColor];

}

- (IBAction)btnBackClickEvent:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
}


@end
