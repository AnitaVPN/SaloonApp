//
//  ProductServiceVC.m
//  SaloonApp
//
//  Created by Apple on 15/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "ProductServiceVC.h"
#import "cell_appointment.h"
#import "cell_prodServ.h"

@interface ProductServiceVC ()
{
    NSMutableArray *arrServices;
    NSMutableArray *arrProducts;
}


@end

@implementation ProductServiceVC
@synthesize dictSelection,isProdListing;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollection];
    
    if(isProdListing)
        self.title = @"Products";
    else
        self.title = @"Services";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
   
}

-(void)setupCollection
{
    [_clsProdSrvc registerNib:[UINib nibWithNibName:@"cell_prodServ" bundle:nil] forCellWithReuseIdentifier:@"cell"];

    _clsProdSrvc.delegate = self;
    _clsProdSrvc.dataSource = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSMutableDictionary *arr;
    if(isProdListing)
    {
        arr = [dictSelection valueForKey:@"arrProducts"];
        
    }
    else
    {
        arr = [dictSelection valueForKey:@"arrServices"];
        
    }
    return arr.count;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (UICollectionViewCell  *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    cell_prodServ *cell = (cell_prodServ *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSMutableArray *arr;
    NSMutableArray *dictSelected;
    
    
    if(isProdListing)
    {
        arr = [dictSelection valueForKey:@"arrProducts"];

    }
    else
    {
        arr = [dictSelection valueForKey:@"arrServices"];

    }
    
        
    if(isProdListing)
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
    
    
    
//    float shadowSize = 5.0f;
//    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:CGRectMake(cell.vwMain.frame.origin.x - shadowSize / 2,cell.vwMain.frame.origin.y - shadowSize / 2,cell.vwMain.frame.size.width + shadowSize,cell.vwMain.frame.size.height + shadowSize)];
//
//    cell.layer.masksToBounds = NO;
//    cell.layer.shadowColor = [UIColor lightGrayColor].CGColor;
//    cell.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
//    cell.layer.shadowOpacity = 0.05f;
//    cell.layer.shadowPath = shadowPath.CGPath;
    
    
//    cell.vwMain.layer.shadowRadius  = 1.5f;
//    cell.vwMain.layer.shadowColor   = [UIColor lightGrayColor].CGColor;
//    cell.vwMain.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
//    cell.vwMain.layer.shadowOpacity = 0.9f;
//    cell.vwMain.layer.masksToBounds = NO;
//
//    UIEdgeInsets shadowInsets     = UIEdgeInsetsMake(0, 0, -1.5f, 0);
//    UIBezierPath *shadowPath      = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(cell.vwMain.bounds, shadowInsets)];
//    cell.vwMain.layer.shadowPath    = shadowPath.CGPath;
//
    
    
    
    
    
    cell.layer.shadowOffset = CGSizeMake(1, 0);
    cell.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    cell.layer.shadowRadius = 5;
    cell.layer.shadowOpacity = .8;
    
    cell.clipsToBounds = false;
    
    
    
    cell.layer.masksToBounds = false;
//    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30)/2, ([UIScreen mainScreen].bounds.size.width - 30)/2);
}

//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    //    cell_appointment *cell = (cell_appointment *)[collectionView cellForItemAtIndexPath:indexPath];
//    //    cell.vw_checkmark.hidden = false;
//
//    NSMutableArray *arrBeignUsed;
//    NSMutableDictionary *arr;
//    if(!isProdListing)
//    {
//        arr = [dictSelection objectForKey:@"arrProducts"];
//        arrBeignUsed = arrProducts;
//    }
//    else
//    {
//        arr = [dictSelection objectForKey:@"arrServices"];
//        arrBeignUsed = arrServices;
//
//    }
//
//
//    if(arr.count == 0)
//    {
//
//        if(!isProdListing)
//        {
//            [arr.allKeys addObject:[arrServices objectAtIndex:indexPath.row]];
//            [dictSelection setObject:arr forKey:@"arrServices"];
//
//
//        }
//        else
//        {
//            [arr addObject:[arrProducts objectAtIndex:indexPath.row]];
//            [dictSelection setObject:arr forKey:@"arrProducts"];
//        }
//    }
//    else
//    {
//        NSMutableArray *arr;
//
//        if(!isProdListing)
//        {
//            arr = [dictSelection valueForKey:@"arrServices"];
//        }
//        else
//        {
//            arr = [dictSelection valueForKey:@"arrProducts"];
//        }
//
//        if(arr.count > 0)
//        {
//            if(![arr containsObject:[arrBeignUsed objectAtIndex:indexPath.row]])
//            {
//
//                if(!isProdListing)
//                {
//                    [arr addObject:[arrServices objectAtIndex:indexPath.row]];
//                    [dictSelection setObject:arr forKey:@"arrServices"];
//                }
//                else
//                {
//                    [arr addObject:[arrProducts objectAtIndex:indexPath.row]];
//                    [dictSelection setObject:arr forKey:@"arrProducts"];
//                }
//
//            }
//            else
//            {
//
//                if([arr containsObject:[arrBeignUsed objectAtIndex:indexPath.row]])
//                {
//                    [arr removeObject:[arrBeignUsed objectAtIndex:indexPath.row]];
//                    //                    int = [arrBeignUsed int]
//                }
//
//                if(!isProdListing)
//                {
//
//                    [dictSelection setObject:arr forKey:@"arrServices"];
//                }
//                else
//                {
//
//                    [dictSelection setObject:arr forKey:@"arrProducts"];
//                }
//
//            }
//        }
//    }
//
//
//    [_clsProdSrvc reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]]];
//    NSLog(@"dictSelection %@",dictSelection);
//
//
//}

@end
