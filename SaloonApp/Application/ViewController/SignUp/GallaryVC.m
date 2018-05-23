//
//  GallaryVC.m
//  SaloonApp
//
//  Created by Apple on 12/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "GallaryVC.h"
#import "GlobalConstant.h"
#import "SignUpVC.h"
#import "UIImageView+WebCache.h"

@interface GallaryVC ()<UIScrollViewDelegate>
{
    NSMutableArray *arrURLs;
}
@end

@implementation GallaryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    
    arrURLs = [[NSMutableArray alloc]init];
    [arrURLs addObject:@"http://www.nycthread.com/wp-content/uploads/2015/05/DSC7470_fhdr.jpg"];
    [arrURLs addObject:@"http://www.nycthread.com/wp-content/uploads/2015/05/DSC7494_fhdr.jpg"];
    [arrURLs addObject:@"http://www.nycthread.com/wp-content/uploads/2015/05/DSC7483_fhdr.jpg"];
    [arrURLs addObject:@"http://www.nycthread.com/wp-content/uploads/2015/05/DSC7458_fhdr.jpg"];
    [arrURLs addObject:@"http://www.nycthread.com/wp-content/uploads/2015/05/DSC7447_fhdr.jpg"];
    [arrURLs addObject:@"http://www.nycthread.com/wp-content/uploads/2015/05/DSC7447_fhdr.jpg"];

    
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    _btnLogin.layer.cornerRadius = SCREEN_WIDTH *.4/10;
    _btnLogin.clipsToBounds = true;
    
    _btnAppointment.layer.cornerRadius = SCREEN_WIDTH *.4/10;
    _btnAppointment.clipsToBounds = true;
    
    self.navigationController.navigationBar.hidden = true;
    self.navigationController.navigationBarHidden = true;
    self.navigationController.navigationBar.hidden = true;
    
    [self setUpGallary];
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];

}


-(void)setUpGallary
{
    _vwTransparent.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.65];
    
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * arrURLs.count, SCREEN_HEIGHT - 100);
    
    
    for (int i = 0; i < arrURLs.count; i++) {
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, _scrollView.frame.size.height)];

        //img.contentMode = UIViewContentModeScaleAspectFill;

        [img sd_setImageWithURL:[NSURL URLWithString:[arrURLs objectAtIndex:i]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
            img.image = image;
            [_scrollView addSubview:img];
            
        }];
        
        
    }
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];

    _scrollView.pagingEnabled = true;
}

- (void)scrollingTimer {
  
    CGFloat contentOffset = _scrollView.contentOffset.x;
    // calculate next page to display
    int nextPage = (int)(contentOffset/SCREEN_WIDTH) + 1 ;
    // if page is not 10, display it
    
    if(nextPage > arrURLs.count)
        nextPage = 0;
    
    if( nextPage!=arrURLs.count )  {
        [_scrollView scrollRectToVisible:CGRectMake(nextPage*SCREEN_WIDTH, 0, SCREEN_WIDTH, _scrollView.frame.size.height) animated:YES];
        
        
      //  NSLog(@"%f",nextPage*SCREEN_WIDTH);

        
        //pgCtr.currentPage=nextPage;
        // else start sliding form 1 :)
    } else {
        [_scrollView scrollRectToVisible:CGRectMake(0, 0, SCREEN_WIDTH, _scrollView.frame.size.height) animated:YES];
      //  pgCtr.currentPage=0;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnStaffLoginClickEvent:(id)sender {
    AppDeleObj.userType = 2;
    [self doNavigation];
}

- (IBAction)btnBookApointmentClickEvent:(id)sender {
    AppDeleObj.userType = 1;
    [self doNavigation];
}

-(void)doNavigation
{
    SignUpVC *vc = [[SignUpVC alloc]initWithNibName:IsPhone?@"SignUpVC":@"SignUpVC_IPAD" bundle:nil];
    
    self.navigationController.navigationBar.hidden = false;
    self.navigationController.navigationBarHidden = false;
    self.navigationController.navigationBar.hidden = false;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)btnPOSLoginClickEvent:(id)sender {
    
    
    if(IsPhone)
    {
         AppDeleObj.userType = 2;
    }
    else
    {
         AppDeleObj.userType = 3;
    }
    
   
    [self doNavigation];
}


@end
