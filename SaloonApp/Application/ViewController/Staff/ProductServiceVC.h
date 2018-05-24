//
//  ProductServiceVC.h
//  SaloonApp
//
//  Created by Apple on 15/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductServiceVC : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *clsProdSrvc;
@property (weak, nonatomic) NSMutableDictionary *dictSelection;
@property BOOL isProdListing;

@end
