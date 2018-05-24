//
//  Utils.m
//  NarolaGroups
//
//  Created by Apple on 17/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "Utils.h"

#ifdef UI_USER_INTERFACE_IDIOM()
#define IS_IPAD() (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#else
#define IS_IPAD() (false)
#endif

@interface Utils ()

@end

@implementation Utils

+ (instancetype)sharedInstance
{
    static Utils *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Utils alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (BOOL)validatePhoneNumberWithString:(NSString *)string {
    if (nil == string || ([string length] < 2 ) )
        return NO;
    
    NSError *error;
    NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypePhoneNumber error:&error];
    NSArray *matches = [detector matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    for (NSTextCheckingResult *match in matches) {
        if ([match resultType] == NSTextCheckingTypePhoneNumber) {
            NSString *phoneNumber = [match phoneNumber];
            if ([string isEqualToString:phoneNumber]) {
                return YES;
            }
        }
    }
    
    return NO;
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITextField *)setupTextFeild :(UITextField *)txtFeild :(UIColor *)txtTextColor :(BOOL)isLeftView :(UIImage*)image :(NSString *)placeHolderText
{
    
    CGFloat viewSize,fontSize,padding;
    if (IsPhone) {
        viewSize = 40;
        fontSize =  15;
        padding = 12;
    }
    else
    {
        viewSize = 100;
        fontSize =  22;
        padding = 50;
    }
    
    if(image == nil)
    {
        UIView  * vw = [[UIView alloc]init];;
        vw.frame = CGRectMake(5, 0.0, viewSize, txtFeild.frame.size.height);
        vw.contentMode = UIViewContentModeCenter;
        vw.backgroundColor = [UIColor clearColor];
        txtFeild.leftView = vw;
        txtFeild.leftViewMode = UITextFieldViewModeAlways;
    }
    else
    {
       
//        iconEmail.backgroundColor = [UIColor redColor];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(padding, 0, viewSize, txtFeild.frame.size.height)];
        view.backgroundColor = [UIColor clearColor];
        
        UIImageView  * iconEmail = [[UIImageView alloc] initWithImage:image];
        iconEmail.frame = CGRectMake((view.frame.size.width/2) - (iconEmail.image.size.width/2) , (view.frame.size.height/2) - (iconEmail.image.size.height/2), iconEmail.image.size.width, iconEmail.image.size.height);
        iconEmail.contentMode = UIViewContentModeCenter;
        
        
        [view addSubview:iconEmail];
        txtFeild.leftView = view;
        txtFeild.leftViewMode = UITextFieldViewModeAlways;
    }
    
    
    
    UIColor *color = txtTextColor;
    //    txtFeild.layer.borderColor = color.CGColor;
    //    txtFeild.layer.borderWidth = 2;
    txtFeild.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeHolderText attributes:@{NSForegroundColorAttributeName: [UIColor grayColor], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Medium" size:fontSize]}];
    
    txtFeild.layer.cornerRadius = 8;
    //txtFeild.layer.borderWidth = .5;
    
    return txtFeild;
}

-(void)HideNavigationBar{
    self.navigationController.navigationBarHidden = true;
   self.navigationController.navigationBar.hidden = true;
}
-(void)showNavigatioBar
{
    self.navigationController.navigationBarHidden = false;
self.navigationController.navigationBar.hidden = false;
}

-(void)showAlert :(NSString *)strMsg : (UIViewController *)vc
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:AppName
                        message:strMsg
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    //We add buttons to the alert controller by creating UIAlertActions:
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil]; //You can use a block here to handle a press on this button
    [alertController addAction:actionOk];
    [vc presentViewController:alertController animated:YES completion:nil];
}

@end
