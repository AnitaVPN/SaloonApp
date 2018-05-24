//
//  AppointmentVC.m
//  SaloonApp
//
//  Created by Apple on 09/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "AppointmentVC.h"
#import "cell_appointment.h"
#import "GallaryVC.h"
#import <QuartzCore/QuartzCore.h>

@interface AppointmentVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrServices;
    NSMutableArray *arrProducts;
    NSMutableDictionary *dictSelection;
    
}
@end

@implementation AppointmentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.hidden = true;
    self.navigationController.navigationBarHidden = true;
    self.navigationController.navigationBar.hidden = true;
    
    arrServices = [[NSMutableArray alloc]init];
    arrProducts = [[NSMutableArray alloc]init];
    dictSelection = [[NSMutableDictionary alloc]init];
    
    _clsProductService.tag = 2;

    [arrServices addObject:@"Facial"];
    [arrServices addObject:@"Hair Cutting"];
    [arrServices addObject:@"Hair Style"];
    [arrServices addObject:@"Thai SPA"];
    [arrServices addObject:@"Eye-Bros"];
    [arrServices addObject:@"Manicure"];
    
    [arrProducts removeAllObjects];
    [arrProducts addObject:@"Product 1"];
    [arrProducts addObject:@"Product 2"];
    [arrProducts addObject:@"Product 3"];
    [arrProducts addObject:@"Product 4"];
    [arrProducts addObject:@"Product 5"];
    [arrProducts addObject:@"Product 6"];
    

    
    _vwProdServ.layer.borderWidth = 2;
    _vwProdServ.layer.borderColor = [UIColor grayColor].CGColor;
    
    _clsProductService.layer.borderWidth = 2;
    _clsProductService.layer.borderColor = [UIColor grayColor].CGColor;
    
    
    
//    _btnProduct.layer.cornerRadius = 4;
//    _btnProduct.clipsToBounds = true;
//
//    _btnService.layer.cornerRadius = 4;
//    _btnService.clipsToBounds = true;
    
    [dictSelection setObject:[NSMutableArray new] forKey:@"arrServices"];
    [dictSelection setObject:[NSMutableArray new] forKey:@"arrProducts"];
    
   

}

-(void)viewWillAppear:(BOOL)animated
{
    _lblCount.layer.cornerRadius = _lblCount.frame.size.width/2;
    _lblCount.clipsToBounds = true;
    _lblCount.layer.borderColor = [UIColor redColor].CGColor;
    _lblCount.layer.borderWidth = 1;
    [self updateCount:0];
    
    
    _clsProductService.delegate = self;
    _clsProductService.dataSource = self;
    [_clsProductService registerNib:[UINib nibWithNibName:@"cell_appointment" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    

    _vwResult.backgroundColor = [UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:0.7];
    _tblResult.layer.cornerRadius = 8;
    _tblResult.clipsToBounds = true;
    
    
    
    self.clsProductService.backgroundColor = [UIColor whiteColor];
    self.clsProductService.layer.shadowOffset = CGSizeMake(1, 0);
    self.clsProductService.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.clsProductService.layer.shadowRadius = 5;
    self.clsProductService.layer.shadowOpacity = .8;
    self.clsProductService.clipsToBounds = false;
    
    
}

-(void)addFooterView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , 50)];
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 300, 50)];
    [lbl setText:@"Total Price"];
    lbl.textColor = [UIColor whiteColor];
    
    UILabel *lblTotal = [[UILabel alloc]initWithFrame:CGRectMake(_tblResult.frame.size.width - 100, 0, 200, 50)];
    [lblTotal setText:@"$200"];
    lblTotal.textColor = [UIColor whiteColor];
    
    [view setBackgroundColor:_appTitle.backgroundColor];
    [view addSubview:lbl];
    [view addSubview:lblTotal];
    
    [_tblResult setTableFooterView:view];
}

-(void)updateCount :(int)count
{
   
    
    NSMutableArray *arrSer = [dictSelection objectForKey:@"arrServices"];
    
    NSMutableArray *arrProd = [dictSelection objectForKey:@"arrProducts"];
    
    if(arrSer.count != 0 || arrProd.count != 0)
    {
        count = arrSer.count + arrProd.count;

    }
    
    [_lblCount setText:[NSString stringWithFormat:@"%d",count]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if(collectionView.tag == 1)
        return arrServices.count;
    else
        return arrProducts.count;
    
    return 6;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (UICollectionViewCell  *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    cell_appointment *cell = (cell_appointment *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSMutableArray *arr;
    NSMutableArray *dictSelected;
    if(collectionView.tag == 1)
    {
        arr = arrProducts;
        dictSelected = [dictSelection valueForKey:@"arrProducts"];
    }
    else
    {
        arr = arrServices;
        dictSelected = [dictSelection valueForKey:@"arrServices"];

    }
    

    
    if(_clsProductService.tag == 1)
    {    cell.imgService.image = [UIImage imageNamed:[NSString stringWithFormat:@"P%ld",(long)indexPath.row]];
    }
    else
    {    cell.imgService.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",indexPath.row + 1]];
    }
    
    if([dictSelected containsObject:[arr objectAtIndex:indexPath.row]])
        cell.vw_checkmark.hidden = false;
    else
        cell.vw_checkmark.hidden = true;

    cell.lblTitle.text = [arr objectAtIndex:indexPath.row];
    

    cell.vwMain.layer.shadowOffset = CGSizeMake(1, 0);
    cell.vwMain.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    cell.vwMain.layer.shadowRadius = 5;
    cell.vwMain.layer.shadowOpacity = .8;
    cell.vwMain.clipsToBounds = false;
    
    
    
//    float shadowSize = 5.0f;
//    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:CGRectMake(cell.vwMain.frame.origin.x - shadowSize / 2,cell.vwMain.frame.origin.y - shadowSize / 2,cell.vwMain.frame.size.width + shadowSize,cell.vwMain.frame.size.height + shadowSize)];
//
//    cell.layer.masksToBounds = NO;
//    cell.layer.shadowColor = [UIColor lightGrayColor].CGColor;
//    cell.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
//    cell.layer.shadowOpacity = 0.8f;
//    cell.layer.shadowPath = shadowPath.CGPath;
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake((_clsProductService.frame.size.width - 120) /4, (_clsProductService.frame.size.width - 120) /4);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    cell_appointment *cell = (cell_appointment *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.vw_checkmark.hidden = false;
    
    NSMutableArray *arrBeignUsed;
    NSMutableArray *arr;
    if(collectionView.tag == 1)
    {
        arr = [dictSelection objectForKey:@"arrProducts"];
        arrBeignUsed = arrProducts;
    }
    else
    {
        arr = [dictSelection objectForKey:@"arrServices"];
        arrBeignUsed = arrServices;

    }
    
    
    if(arr.count == 0)
    {
      
        if(collectionView.tag == 2)
        {
            [arr addObject:[arrServices objectAtIndex:indexPath.row]];
            [dictSelection setObject:arr forKey:@"arrServices"];

            
        }
        else
        {
            [arr addObject:[arrProducts objectAtIndex:indexPath.row]];
            [dictSelection setObject:arr forKey:@"arrProducts"];
        }
    }
    else
    {
        NSMutableArray *arr;
        
        if(collectionView.tag == 2)
        {
            arr = [dictSelection valueForKey:@"arrServices"];
        }
        else
        {
             arr = [dictSelection valueForKey:@"arrProducts"];
        }
        
        if(arr.count > 0)
        {
            if(![arr containsObject:[arrBeignUsed objectAtIndex:indexPath.row]])
            {
                
                if(collectionView.tag == 2)
                {
                    [arr addObject:[arrServices objectAtIndex:indexPath.row]];
                    [dictSelection setObject:arr forKey:@"arrServices"];
                }
                else
                {
                    [arr addObject:[arrProducts objectAtIndex:indexPath.row]];
                    [dictSelection setObject:arr forKey:@"arrProducts"];
                }
               
            }
            else
            {
                
                if([arr containsObject:[arrBeignUsed objectAtIndex:indexPath.row]])
                {
                    [arr removeObject:[arrBeignUsed objectAtIndex:indexPath.row]];
//                    int = [arrBeignUsed int]
                }
                
                if(collectionView.tag == 2)
                {
                    
                    [dictSelection setObject:arr forKey:@"arrServices"];
                }
                else
                {
                    
                    [dictSelection setObject:arr forKey:@"arrProducts"];
                }

            }
        }
    }
    
    
    [_clsProductService reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]]];
    NSLog(@"dictSelection %@",dictSelection);
    
    
    [self updateCount:0];
    
}


#pragma mark- TableView Delegate methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        NSMutableArray *arr =  [dictSelection objectForKey:@"arrProducts"];
        return arr.count;
    }
    else
    {
        NSMutableArray *arr =  [dictSelection objectForKey:@"arrServices"];
        return arr.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    NSMutableArray *arr;
    if(indexPath.section == 0)
    {
       arr =  [dictSelection objectForKey:@"arrProducts"];
    }
    else
    {
        arr =  [dictSelection objectForKey:@"arrServices"];
    }
    
  
    cell.textLabel.text = [arr objectAtIndex:indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 0, [UIScreen mainScreen].bounds.size.width - 40, 50)];
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, view.frame.size.width - 20, 50)];
    
    if (section == 0) {
        [lbl setText:@"Products"];
    }
    if (section == 1) {
        [lbl setText:@"Services"];
    }
    
    lbl.textColor = [UIColor whiteColor];
    
    [view setBackgroundColor:_appTitle.backgroundColor];
    [view addSubview:lbl];
    
    return view;
}

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 0, [UIScreen mainScreen].bounds.size.width - 40, 50)];
//
//    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 300, 50)];
//    [lbl setText:@"Total Price"];
//    lbl.textColor = [UIColor whiteColor];
//
//    UILabel *lblTotal = [[UILabel alloc]initWithFrame:CGRectMake(view.frame.size.width - 300, 0, 200, 50)];
//    [lblTotal setText:@"$200"];
//    lblTotal.textColor = [UIColor whiteColor];
//
//    [view setBackgroundColor:[UIColor redColor]];
//    [view addSubview:lbl];
//    [view addSubview:lblTotal];
//
//    return view;
//}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
       
        NSMutableArray *arr;
        if(indexPath.section == 0)
        {
            arr =  [dictSelection objectForKey:@"arrProducts"];
            [arr removeObjectAtIndex:indexPath.row];
            [dictSelection setObject:arr forKey:@"arrProducts"];
        }
        else
        {
            arr =  [dictSelection objectForKey:@"arrServices"];
            [arr removeObjectAtIndex:indexPath.row];
            [dictSelection setObject:arr forKey:@"arrServices"];


        }
        
        [self updateCount:0];
        [tableView reloadData]; // tell table to refresh now
    }
}

#pragma mark- Button Click Events
- (IBAction)btnProductClickEvent:(id)sender {
    
    //_btnFilter.hidden = false;

    [_btnProduct setBackgroundColor:[UIColor redColor]];
    [_btnProduct setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [_btnService setBackgroundColor:[UIColor whiteColor]];
    [_btnService setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    
   
    _clsProductService.tag = 1;
    [_clsProductService reloadData];
    
}

- (IBAction)btnServiceClickEvent:(id)sender {
    
    
    
    [_btnProduct setBackgroundColor:[UIColor whiteColor]];
    [_btnProduct setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [_btnService setBackgroundColor:[UIColor redColor]];
    [_btnService setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    

    _clsProductService.tag = 2;
    [_clsProductService reloadData];

}


- (IBAction)ShowResultView:(id)sender {
    
   
    
    
//    [self.tblResult registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
//    _tblResult.delegate = self;
//    _tblResult.dataSource = self;
//    [_tblResult reloadData];
//    _vwResult.hidden = false;
//
//    _tblResult.frame = CGRectMake((_vwResult.frame.size.width/2) - (_tblResult.frame.size.width/2), _vwProdServ.frame.size.height + _vwProdServ.frame.origin.y + 25, _tblResult.frame.size.width, 100 + (50 * [_lblCount.text intValue] + 40));
//
////    _tblResult.center = _tblResult.superview.center;
//    _closeResultView.frame = CGRectMake((_tblResult.frame.size.width + _tblResult.frame.origin.x) - 16, _tblResult.frame.origin.y - 16, 40, 40);
//
//    [self addFooterView];
}


-(void)viewWillLayoutSubviews
{
    _tblResult.frame = CGRectMake((_vwResult.frame.size.width/2) - (_tblResult.frame.size.width/2), _vwProdServ.frame.size.height + _vwProdServ.frame.origin.y + 25, _tblResult.frame.size.width, 100 + (50 * [_lblCount.text intValue] + 40));
    
    //    _tblResult.center = _tblResult.superview.center;
    _closeResultView.frame = CGRectMake((_tblResult.frame.size.width + _tblResult.frame.origin.x) - 16, _tblResult.frame.origin.y - 16, 40, 40);
    
}

- (IBAction)closeResultView:(id)sender {
    _vwResult.hidden = true;

}
- (IBAction)btnDoneButtonClickEvent:(id)sender {
//    [[Utils sharedInstance]showAlert:@"Thank you for your time. Please wait here we will call you shortly." : self];

    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:AppName
                                                                             message:@"Thank you for your time. Please wait in our saloon for while, we will call you shortly :)"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    //We add buttons to the alert controller by creating UIAlertActions:
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                          [AppDeleObj setupRootHomeVC];
                                                     }]; //You can use a block here to handle a press on this button
    [alertController addAction:actionOk];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
//    [self.navigationController popToRootViewControllerAnimated:true];
  
    
    
}

- (IBAction)btnGiftCardClickEvent:(id)sender {
}

@end
