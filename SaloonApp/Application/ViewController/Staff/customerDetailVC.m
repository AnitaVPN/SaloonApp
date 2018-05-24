//
//  customerDetailVC.m
//  SaloonApp
//
//  Created by Apple on 09/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "customerDetailVC.h"
#import "cell_customerDetail.h"
#import "ProductServiceVC.h"
#import "customerHistoryVC.h"

@interface customerDetailVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrCustomers;
    NSMutableArray *arrCustomersDB;
    NSMutableDictionary *dictSelectedProduct;
    NSMutableDictionary *dict ;
    NSMutableDictionary *hideShow;
    NSMutableArray *arrKEYS;
}

@end

@implementation customerDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    hideShow = [[NSMutableDictionary alloc]init];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    
    arrKEYS = [[NSMutableArray alloc]initWithObjects:@"Products",@"Services",@"Gifts",@"History", nil];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    dict = [[NSMutableDictionary alloc]init];
    NSMutableArray *arrProducts = [[NSMutableArray alloc]initWithObjects:@"Product 1",@"Product 2",@"Product 3",@"Product 4", nil];
    NSMutableArray *arrServices = [[NSMutableArray alloc]initWithObjects:@"Service 1",@"Service 1", nil];
    NSMutableArray *arrGifts = [[NSMutableArray alloc]initWithObjects:@"Gift 1",@"Gift 2", nil];
    NSMutableArray *arrHistory = [[NSMutableArray alloc]init];
    
    [dict setObject:arrProducts forKey:@"Products"];
    [dict setObject:arrServices forKey:@"Services"];
    [dict setObject:arrGifts forKey:@"Gifts"];
    [dict setObject:arrHistory forKey:@"History"];
    
    
    for (int i =0; i < dict.count; i++) {
        [hideShow setObject:[NSNumber numberWithInt:1] forKey:dict.allKeys[i]];
    }
    
    
    dictSelectedProduct = [[NSMutableDictionary alloc]init];
    [dictSelectedProduct setObject:arrProducts forKey:@"arrProducts"];
    [dictSelectedProduct setObject:arrProducts forKey:@"arrServices"];
    

    
   

    
    //Add NavigationBar on main view
//    navBar.items = @[navTitle];


    [self setUpTableView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self setupTip];
    
    UIButton * tempButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [tempButton setTitle:@"Done" forState:UIControlStateNormal];
    [tempButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tempButton addTarget:self action:@selector(btnDoneClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithCustomView:tempButton];
    
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -16;
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:negativeSpacer,doneButton, nil] animated:YES];

}

-(void)setUpTableView
{
//    arrCustomers = [[NSMutableArray alloc]init];
//    arrCustomersDB = [[NSMutableArray alloc]init];
    
    _tblCustomerDetails.delegate = self;
    _tblCustomerDetails.dataSource = self;
    [_tblCustomerDetails registerNib:[UINib nibWithNibName:@"cell_customerDetail" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}

-(void)setupTip
{
   _vwTip.layer.shadowRadius  = 1.5f;
    _vwTip.layer.shadowColor   = [UIColor lightGrayColor].CGColor;
    _vwTip.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
    _vwTip.layer.shadowOpacity = 0.9f;
    _vwTip.layer.masksToBounds = NO;
    
    UIEdgeInsets shadowInsets     = UIEdgeInsetsMake(0, 0, -1.5f, 0);
    UIBezierPath *shadowPath      = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(_vwTip.bounds, shadowInsets)];
    _vwTip.layer.shadowPath    = shadowPath.CGPath;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [round setBackgroundColor:[UIColor clearColor]];
    return round;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *mainView  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    [mainView setBackgroundColor:[UIColor clearColor]];
    
    UIView *viewHeader = [[UIView alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 20, 40)];
    
    UIView *round = [[UIView alloc ] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 5)];
    [round setBackgroundColor:_tblCustomerDetails.backgroundColor];
    
    [viewHeader setBackgroundColor:[UIColor redColor]];
    
    
//    CGSize stringBoundingBox = [@"Test Products" sizeWithFont:[UIFont fontWithName:@"Helvetica" size:17]];

    UIFont *font = [UIFont fontWithName:@"Helvetica" size:17];
    NSDictionary *userAttributes = @{NSFontAttributeName: font,
                                     NSForegroundColorAttributeName: [UIColor blackColor]};
    
    
    
    const CGSize textSize = [[arrKEYS objectAtIndex:section] sizeWithAttributes: userAttributes];

    
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(8, 0, textSize.width , 40)];
    lbl.font = font;
//    [lbl setText:dictSelectedProduct.allKeys[section]];
    [lbl setText:[arrKEYS objectAtIndex:section]];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(lbl.frame.size.width + lbl.frame.origin.x + 10, ((viewHeader.frame.size.height )/2 - 12.5), 25, 25)];
    
    btn.tag = section;
    [btn addTarget:self action:@selector(openServiceProductPage:) forControlEvents:UIControlEventTouchUpInside];
    
//    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn setBackgroundImage:[UIImage imageNamed:@"icon_add"] forState:UIControlStateNormal];
    
    UIButton *btnArrow = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 8, 25, 25)];
//    [btnArrow setBackgroundColor:[UIColor whiteColor]];
    [btnArrow setBackgroundImage:[UIImage imageNamed:@"d_arrow"] forState:UIControlStateNormal];
    
    btnArrow.tag = section;
    [btnArrow addTarget:self action:@selector(hideShowSections:) forControlEvents:UIControlEventTouchUpInside];
    

     UILabel *lblAmount = [[UILabel alloc]initWithFrame:CGRectMake(btnArrow.frame.origin.x - 50, 0, 60, 40)];
    [lblAmount setTextColor:[UIColor whiteColor]];
    [lblAmount setText:@"400$"];
    
    
    
    lbl.textColor = [UIColor whiteColor];
    
    
    if(section == 3)
    {
        [viewHeader addSubview:lbl];
        [viewHeader addSubview:btn];
        btn.hidden = true;
//        lbl.text = @"History";
        [viewHeader addSubview:btnArrow];

    }
    else
    {
        [viewHeader addSubview:lbl];
        [viewHeader addSubview:btn];
        [viewHeader addSubview:btnArrow];
        [viewHeader addSubview:lblAmount];
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
    
    NSMutableArray *arr = [dict objectForKey:[arrKEYS objectAtIndex:indexPath.section]];
    
    
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
    
    [self.navigationController pushViewController:vc animated:true];
}

- (IBAction)closeTipView:(id)sender {
    
    _vwTip.hidden = true;
    _btnCloseTip.hidden = true;
    
    [UIView animateWithDuration:0.5f animations:^{
        _tblCustomerDetails.frame = CGRectMake(0, _vwTip.frame.origin.y, _tblCustomerDetails.frame.size.width, _tblCustomerDetails.frame.size.height + _vwTip.frame.size.height);
    }];
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

    
    [_tblCustomerDetails reloadData];
}
- (IBAction)btnSendFeedback:(id)sender {
    
    //API will be cal here
    [self.navigationController popViewControllerAnimated:true];

}

- (IBAction)btnCloseFeedbackPopupClickEvent:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)btnDoneClickEvent:(id)sender {
    
    _vwFeedback.backgroundColor = TRANSPARENT_COLOR;
    _vwFeedbackPopUp.layer.cornerRadius = 5;
    _vwFeedbackPopUp.clipsToBounds = true;
    _vwFeedback.hidden = false;

}


@end


