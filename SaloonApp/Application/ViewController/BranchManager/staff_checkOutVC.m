//
//  staff_checkOutVC.m
//  SaloonApp
//
//  Created by VPN on 21/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "staff_checkOutVC.h"
#import "cell_customerDetail.h"
#import "ProductServiceVC.h"
#import "customerHistoryVC.h"

@interface staff_checkOutVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableDictionary *dict,*hideShow;
    NSMutableArray *arrKEYS;
    NSMutableDictionary *dictSelectedProduct;
}
@end

@implementation staff_checkOutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTableView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = false;
    
    self.navigationController.navigationBar.hidden = true;
    
    self.navigationController.navigationBarHidden = true;

}

-(void)setUpTableView
{
    
    _tblOrders.delegate = self;
    _tblOrders.dataSource = self;
    [_tblOrders registerNib:[UINib nibWithNibName:@"cell_customerDetail" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    _tblOrders.tableHeaderView = _vwUserInfo;
    _tblOrders.tableFooterView = _vwTotal;

    
    hideShow = [[NSMutableDictionary alloc]init];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    arrKEYS = [[NSMutableArray alloc]initWithObjects:@"Products",@"Services",@"Gifts", nil];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    dict = [[NSMutableDictionary alloc]init];
    NSMutableArray *arrProducts = [[NSMutableArray alloc]initWithObjects:@"Product 1",@"Product 2",@"Product 3",@"Product 4", nil];
    NSMutableArray *arrServices = [[NSMutableArray alloc]initWithObjects:@"Service 1",@"Service 1", nil];
    NSMutableArray *arrGifts = [[NSMutableArray alloc]initWithObjects:@"Gift 1",@"Gift 2", nil];
    NSMutableArray *arrHistory = [[NSMutableArray alloc]init];
    
    [dict setObject:arrProducts forKey:@"Products"];
    [dict setObject:arrServices forKey:@"Services"];
    [dict setObject:arrGifts forKey:@"Gifts"];
   // [dict setObject:arrHistory forKey:@"History"];
    
    
    for (int i =0; i < dict.count; i++) {
        [hideShow setObject:[NSNumber numberWithInt:1] forKey:dict.allKeys[i]];
    }
    
    dictSelectedProduct = [[NSMutableDictionary alloc]init];
    [dictSelectedProduct setObject:arrProducts forKey:@"arrProducts"];
    [dictSelectedProduct setObject:arrProducts forKey:@"arrServices"];
    
    [self setupViews];
    
}

-(void)setupViews
{
    self.vwBestOffer.layer.shadowOffset = CGSizeMake(1, 0);
    self.vwBestOffer.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    self.vwBestOffer.layer.shadowRadius = 5;
    self.vwBestOffer.layer.shadowOpacity = .8;
    self.vwBestOffer.clipsToBounds = false;
    
    
    self.vwTotalAmnt.layer.shadowOffset = CGSizeMake(1, 0);
    self.vwTotalAmnt.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    self.vwTotalAmnt.layer.shadowRadius = 5;
    self.vwTotalAmnt.layer.shadowOpacity = .8;
    self.vwTotalAmnt.clipsToBounds = false;
    
    self.vwMain.layer.shadowOffset = CGSizeMake(1, 0);
    self.vwMain.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    self.vwMain.layer.shadowRadius = 5;
    self.vwMain.layer.shadowOpacity = .8;
    self.vwMain.clipsToBounds = false;
    
    
    [_vwTip setBackgroundColor:[UIColor colorWithRed:169.0/255.0 green:169.0/255.0 blue:169.0/255.0 alpha:0.7]];

    
    
    
    _vwTotal.layer.borderWidth = 1;
    _vwTotal.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _vwTotal.clipsToBounds = true;
    
    
    _vwRightBottom.layer.borderWidth = 1;
    _vwRightBottom.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _vwRightBottom.clipsToBounds = true;
    
    _vwTableView.layer.borderWidth = 1;
    _vwTableView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _vwTableView.clipsToBounds = true;
    
}
#pragma mark- Tableview Delegate methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dict.count;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    int isShow = [[hideShow valueForKey:[arrKEYS objectAtIndex:section]] intValue];
    
    if(isShow == 0)
    {return 0;}
    
    
    
    NSMutableArray *arr = [dict valueForKey:[arrKEYS objectAtIndex:section]];
    return arr.count;
    
    //    return arrCustomers.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 10;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    
    UIView *round = [[UIView alloc ] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    round.layer.borderColor = [UIColor grayColor].CGColor;
    round.layer.borderWidth = .5;
    [round setBackgroundColor:[UIColor clearColor]];
    return round;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *mainView  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    [mainView setBackgroundColor:[UIColor clearColor]];
    
    UIView *viewHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , 40)];
    
    UIView *round = [[UIView alloc ] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 5)];
    [round setBackgroundColor:_tblOrders.backgroundColor];
    
    [viewHeader setBackgroundColor:[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0]];
    
    
    //    CGSize stringBoundingBox = [@"Test Products" sizeWithFont:[UIFont fontWithName:@"Helvetica" size:17]];
    
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:17];
    NSDictionary *userAttributes = @{NSFontAttributeName: font,
                                     NSForegroundColorAttributeName: [UIColor blackColor]};
    
    
    
    const CGSize textSize = [[arrKEYS objectAtIndex:section] sizeWithAttributes: userAttributes];
    
    
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(16, 0, textSize.width , 40)];
    lbl.font = font;
    //    [lbl setText:dictSelectedProduct.allKeys[section]];
    [lbl setText:[arrKEYS objectAtIndex:section]];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(lbl.frame.size.width + lbl.frame.origin.x + 10, ((viewHeader.frame.size.height )/2 - 12.5), 25, 25)];
    
    btn.tag = section;
    [btn addTarget:self action:@selector(openServiceProductPage:) forControlEvents:UIControlEventTouchUpInside];
    
    //    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn setBackgroundImage:[UIImage imageNamed:@"icon_plus_gray"] forState:UIControlStateNormal];
    
    
    
    
    lbl.textColor = [UIColor blackColor];
    
    
    if(section == 3)
    {
        [viewHeader addSubview:lbl];
        [viewHeader addSubview:btn];
        btn.hidden = true;
        //        lbl.text = @"History";
        
    }
    else
    {
        [viewHeader addSubview:lbl];
        [viewHeader addSubview:btn];
    }
   
    //
    
    [viewHeader addSubview:round];
    [mainView addSubview:viewHeader];
    
    return mainView;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell_customerDetail *cell;
    if(cell == nil)
    {
        cell = (cell_customerDetail *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    }
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *arr = [dict objectForKey:[arrKEYS objectAtIndex:indexPath.section]];
    
//    cell.vwMain.frame = CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height);
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"did select call");
}

-(IBAction)openServiceProductPage:(UIButton *)sender
{
    
    NSMutableDictionary *dict;
    ProductServiceVC *vc = [[ProductServiceVC alloc]initWithNibName:@"ProductServiceVC" bundle:nil];
    
    vc.dictSelection = dictSelectedProduct;
    if(sender.tag == 0)
    {
        vc.isProdListing = true;
    }
    else
    {
        vc.isProdListing = false;
        
    }
    
    self.navigationController.navigationBarHidden = false;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:true];
}


-(IBAction)hideShowSections :(UIButton *)sender
{
    
    if(sender.tag == 3)
    {
        customerHistoryVC *vc = [[customerHistoryVC alloc]initWithNibName:@"customerHistoryVC" bundle:nil];
        [self.navigationController pushViewController:vc animated:true];
        return;
    }
    
    NSString *key = [arrKEYS objectAtIndex:sender.tag];
    int isShow = [[hideShow objectForKey:key] intValue];
    
    if(isShow == 0)
        [hideShow setValue:[NSNumber numberWithInt:1] forKey:key];
    else
        [hideShow setValue:[NSNumber numberWithInt:0] forKey:key];
    
    
    [_tblOrders reloadData];
}

- (IBAction)btnSkip:(id)sender {
    
    [_vwTip setHidden:true];
}


- (IBAction)btnAdd:(id)sender {
    [_vwTip setHidden:true];

}
- (IBAction)btnInvoiceClickEvent:(id)sender {
    
    [self ShowTipView];


    
}

- (IBAction)btnPaymentClickEvent:(id)sender {
}

-(void)ShowTipView
{
//    _vwTip.backgroundColor = [UIColor whiteColor];
    
    _vwTip.hidden = false;
    
    self.txtTipAmnt.backgroundColor = [UIColor whiteColor];
    self.txtTipAmnt.layer.shadowOffset = CGSizeMake(1, 0);
    self.txtTipAmnt.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    self.txtTipAmnt.layer.shadowRadius = 5;
    self.txtTipAmnt.layer.shadowOpacity = .8;
    self.txtTipAmnt.clipsToBounds = false;
    
    _vwTipPopUp.layer.cornerRadius = 5;
    _vwTipPopUp.clipsToBounds = true;
    
    _vwTipPopUp.center = self.vwTip.center;
  
    
    
    
//    [self.navigationController prese]
    
}
- (IBAction)btnBackClickEvent:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
}

@end
