//
//  selectBranchVC.m
//  SaloonApp
//
//  Created by VPN on 24/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "selectBranchVC.h"

@interface selectBranchVC () <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrBranches;
}
@end

@implementation selectBranchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    arrBranches = [[NSMutableArray alloc]init];
    [arrBranches addObject:@"Branch1"];
    [arrBranches addObject:@"Branch2"];
    [arrBranches addObject:@"Branch3"];
    [arrBranches addObject:@"Branch4"];
    [arrBranches addObject:@"Branch5"];
    [arrBranches addObject:@"Branch6"];
    
    [self setupTableView];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupTableView
{
    
    _tblBranch.delegate = self;
    _tblBranch.dataSource = self;
    [_tblBranch registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _tblBranch.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    
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
    return arrBranches.count;;
    //return arrCustomers.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [arrBranches objectAtIndex:indexPath.row];
    
    
    if(IsPhone)
    {
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:14];

    }
    else
    {
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:24];

    }
    
    
    
    cell.textLabel.textColor = [UIColor darkGrayColor];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60       ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = [arrBranches objectAtIndex:indexPath.row];
    
//    UITableViewCell *cell = [_tblBranch cellForRowAtIndexPath:indexPath];
//    cell.frame = CGRectMake(0, 2, cell.frame.size.width, cell.frame.size.height - 4);
//    cell.textLabel.textColor = [UIColor whiteColor];
//    cell.backgroundColor = [UIColor darkGrayColor];
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [_tblBranch cellForRowAtIndexPath:indexPath];
//    cell.textLabel.textColor = [UIColor darkGrayColor];
//    cell.backgroundColor = [UIColor clearColor];
    
}

- (IBAction)btnBackClickEvent:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
}


- (IBAction)btnSelectBranch:(id)sender {
}


- (IBAction)btnDoneButtonClickEvent:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:isBranchSelected];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [AppDeleObj setupRootHomeVC];
}
@end
