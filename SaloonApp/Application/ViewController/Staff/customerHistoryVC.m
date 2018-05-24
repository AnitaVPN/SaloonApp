//
//  customerHistoryVC.m
//  SaloonApp
//
//  Created by Apple on 14/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "customerHistoryVC.h"
#import "cell_customerHistory.h"

@interface customerHistoryVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation customerHistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    self.title = @"CLIENT HISTORY";
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpTableView
{
    
    _tblHistory.delegate = self;
    _tblHistory.dataSource = self;
    [_tblHistory registerNib:[UINib nibWithNibName:@"cell_customerHistory" bundle:nil] forCellReuseIdentifier:@"cell"];
}

#pragma mark- Tableview Delegate methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
    //return arrCustomers.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell_customerHistory *cell;
    cell = (cell_customerHistory *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
    cell.vwMain.layer.shadowOffset = CGSizeMake(1, 0);
    cell.vwMain.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    cell.vwMain.layer.shadowRadius = 5;
    cell.vwMain.layer.shadowOpacity = .8;
    cell.vwMain.clipsToBounds = false;
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.vwMain.layer.masksToBounds = false;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    [view setBackgroundColor:[UIColor clearColor]];
    UILabel *lblDate = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    lblDate.text = @"24-10-2018";
    lblDate.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:14];
    lblDate.textAlignment = NSTextAlignmentCenter;
    [lblDate setTextColor:[UIColor whiteColor]];
    [lblDate setBackgroundColor:[UIColor redColor]];
    [lblDate setCenter:view.center];
    [view addSubview:lblDate];
    return view;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

@end
