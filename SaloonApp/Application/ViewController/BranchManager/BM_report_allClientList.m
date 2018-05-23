//
//  BM_report_allClientList.m
//  SaloonApp
//
//  Created by VPN on 22/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "BM_report_allClientList.h"
#import "cell_report_clients.h"

@interface BM_report_allClientList ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BM_report_allClientList

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
    [_tblClients registerNib:[UINib nibWithNibName:@"cell_report_clients" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    _tblClients.tableHeaderView = _tblHeaderVw;
    
    _tblClients.layer.borderWidth = 1.5;
    _tblClients.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    _tblClients.frame = CGRectMake(_tblClients.frame.origin.x, _tblClients.frame.origin.y, _tblClients.frame.size.width, (60 * 5) + _tblHeaderVw.frame.size.height + 10);
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
    cell_report_clients *cell;
    cell = (cell_report_clients *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60       ;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
