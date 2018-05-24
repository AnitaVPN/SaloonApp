//
//  BM_staff_tipManagement.m
//  SaloonApp
//
//  Created by VPN on 24/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "BM_staff_tipManagement.h"
#import "cell_staff_tip.h"

@interface BM_staff_tipManagement ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation BM_staff_tipManagement

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
      [self setupTableView];
}

-(void)setupTableView
{
    
    _tblTip.delegate = self;
    _tblTip.dataSource = self;
    
    [_tblTip registerNib:[UINib nibWithNibName:@"cell_staff_tip" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    _tblTip.tableHeaderView = _tblHeaderVw;
    
    
    //    [_tblReports registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.vwMain.layer.shadowOffset = CGSizeMake(1, 0);
    self.vwMain.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.vwMain.layer.shadowRadius = 5;
    self.vwMain.layer.shadowOpacity = .8;
    self.vwMain.clipsToBounds = false;
    
    
    
    _tblTip.frame = CGRectMake(_tblTip.frame.origin.x, _tblTip.frame.origin.y, _tblTip.frame.size.width, (60 * 5) + _tblHeaderVw.frame.size.height);
    
    _tblTip.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _tblTip.layer.borderWidth = 2;
}


#pragma mark- Tableview Delegate methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;;
    //return arrCustomers.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell_staff_tip *cell;
    cell = (cell_staff_tip *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.btnPay.layer.shadowOffset = CGSizeMake(1, 0);
    cell.btnPay.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    cell.btnPay.layer.shadowRadius = 5;
    cell.btnPay.layer.shadowOpacity = .8;
    cell.btnPay.clipsToBounds = false;
    
    
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


@end
