//
//  BM_staffListingVC.m
//  SaloonApp
//
//  Created by VPN on 23/05/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "BM_staffListingVC.h"
#import "SBStackedBarChart.h"


@interface BM_staffListingVC ()
{
    NSMutableDictionary *dict;
    NSMutableArray *arr ;
}

@end

@implementation BM_staffListingVC

- (void)viewDidLoad {
    
    dict = [[NSMutableDictionary alloc]init];
    
    
    
    
   arr = [[NSMutableArray alloc]init];

    [dict setObject:arr forKey:@"staff1"];
    [dict setObject:arr forKey:@"staff2"];
    [dict setObject:arr forKey:@"staff3"];
    [dict setObject:arr forKey:@"staff4"];
    [dict setObject:arr forKey:@"staff5"];

    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self addBar:dict];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)addXValues
{
    
}

-(void)addBar :(NSMutableDictionary*)dict
{
    for (int i=1; i<dict.count + 1; i++) {
        
        SBBarChart *vertical;
        UILabel *lblUserName;
        CGFloat x;
        if(i != 0)
        {
            if(i == 1)
            {
                vertical = [[SBBarChart alloc] initWithFrame:CGRectMake( i * (_vwY.frame.origin.x + 100), _vwY.frame.origin.y - 290, 80, 400)];
                
                x = vertical.frame.origin.x;
                
                 lblUserName = [[UILabel alloc]initWithFrame:CGRectMake( i * (_vwY.frame.origin.x + 70), _vwY.frame.origin.y + 130, 180, 40)];
                
                   lblUserName.text = @"Staff Username";
                
            }
            else
            {
                
                vertical = [[SBBarChart alloc] initWithFrame:CGRectMake(  (x + 150), _vwY.frame.origin.y - 290, 80, 400)];
                
                lblUserName = [[UILabel alloc]initWithFrame:CGRectMake( x + 130, _vwY.frame.origin.y + 130, 180, 40)];
                
                //            lblUserName.backgroundColor = [UIColor redColor];
                lblUserName.text = @"Staff Username";
                x = vertical.frame.origin.x;

            }
          
           

        }
        else
        {
//            vertical = [[SBBarChart alloc] initWithFrame:CGRectMake( (i * _vwY.frame.origin.x) + 40 , _vwY.frame.origin.y - 200, 50, 200)];
        }
        
        
        [vertical setHorizontal:NO];
        [vertical setSegments:[self addSegments:nil]];
        [self.view addSubview:vertical];
        [self.view addSubview:lblUserName];

    }
    
    
}


-(NSMutableArray *)addSegments :(NSMutableDictionary *)dict
{
    
    NSMutableArray *segments = [[NSMutableArray alloc]init];
    
    for (int i = 0; i <= 2; i++) {
        
        // Value randomly generated for demo
        
//        CGFloat abc;
//        if(i == 0)
//        {
//            abc
//        }
//        else if(i == 1)
//        {}
//        else
//        {}
        
        SBBarSegment *segment = [SBBarSegment barComponentWithValue:(arc4random() % 10) + 1];
        
        switch (i) {
            case 0:
                segment.color = [UIColor redColor];   // Segment color
                break;
            case 1:
                segment.color = [UIColor whiteColor];
                break;
            case 2:
                segment.color = [UIColor darkGrayColor];
                break;
           
        }
        
        [segments addObject:segment];
        
    }
    return segments;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnBackClickEvent:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}
@end
