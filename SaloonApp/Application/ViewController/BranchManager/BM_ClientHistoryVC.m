//
//  BM_ClientHistoryVC.m
//  SaloonApp
//
//  Created by VPN on 22/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "BM_ClientHistoryVC.h"
#import "cell_staff_clientHistory.h"

@interface BM_ClientHistoryVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BM_ClientHistoryVC

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
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
   
    
    
    _tblClients.delegate = self;
    _tblClients.dataSource = self;
    [_tblClients registerNib:[UINib nibWithNibName:@"cell_staff_clientHistory" bundle:nil] forCellReuseIdentifier:@"cell_client"];
    
    
    _tblClients.tableHeaderView = _tblHeaderView;
    
    _tblClients.layer.borderWidth = 1.5;
    _tblClients.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    
   
}


-(void)viewWillAppear:(BOOL)animated
{
     _tblClients.frame = CGRectMake(_tblClients.frame.origin.x, _tblClients.frame.origin.y, _tblClients.frame.size.width, (60 * 5) + _tblHeaderView.frame.size.height + 10);
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
    cell_staff_clientHistory *cell;
    cell = (cell_staff_clientHistory *)[tableView dequeueReusableCellWithIdentifier:@"cell_client" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60       ;
}


@end
