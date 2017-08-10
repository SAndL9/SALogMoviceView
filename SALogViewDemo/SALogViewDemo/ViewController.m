//
//  ViewController.m
//  SALogViewDemo
//
//  Created by 李磊 on 24/7/17.
//  Copyright © 2017年 李磊. All rights reserved.
//

#import "ViewController.h"
#import "SALogMoviceView.h"


@interface ViewController ()

/**  */
@property (nonatomic, strong) SALogMoviceView *logMoviceView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
   
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupMoviceView];
    [self setupLoginView];
}



- (void)setupMoviceView{
    self.logMoviceView = [[SALogMoviceView alloc]init];
    self.logMoviceView.frame = [UIScreen mainScreen].bounds;
    
//    [self.view addSubview:self.logMoviceView];
    
    [self.view insertSubview:self.logMoviceView atIndex:0];
    
    self.logMoviceView.movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"视频（750X1334）" ofType:@"mp4"]];
//    self.logMoviceView.movieURL = [NSURL URLWithString:@"http://192.168.1.161/The New Look of OS X Yosemite.mp4"];
}






#pragma mark ---------
- (void)setupLoginView
{
    
    
    UITextField *nameTextField = [[UITextField alloc]init];
    nameTextField.placeholder = @"手机号/邮箱";
    nameTextField.font = [UIFont systemFontOfSize:16.0f];
    nameTextField.frame = CGRectMake(24, 100, [UIScreen mainScreen].bounds.size.width - 48, 48);
    nameTextField.backgroundColor = [UIColor clearColor];
    nameTextField.layer.borderWidth = 1;
    nameTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    UILabel * placeholderLabel = [nameTextField valueForKey:@"_placeholderLabel"];
    placeholderLabel.textColor = [UIColor lightGrayColor];
    placeholderLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nameTextField];
    
    
    
    
    UITextField *pwdTextField = [[UITextField alloc]init];
    pwdTextField.placeholder = @"密码";
    pwdTextField.secureTextEntry = YES;
    pwdTextField.font = [UIFont systemFontOfSize:16.0f];
    UILabel * pwdTextFieldLabel = [pwdTextField valueForKey:@"_placeholderLabel"];
    pwdTextFieldLabel.textColor = [UIColor lightGrayColor];
    pwdTextFieldLabel.textAlignment = NSTextAlignmentCenter;
    pwdTextField.frame = CGRectMake(24, 200, [UIScreen mainScreen].bounds.size.width - 48, 48);
    pwdTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    pwdTextField.layer.borderWidth = 1;
    pwdTextField.backgroundColor = [UIColor clearColor];
    [self.view addSubview:pwdTextField];
    
    //进入按钮
    UIButton *enterMainButton = [[UIButton alloc] init];
    enterMainButton.frame = CGRectMake(24, [UIScreen mainScreen].bounds.size.height - 32 - 48, [UIScreen mainScreen].bounds.size.width - 48, 48);
    enterMainButton.layer.borderWidth = 1;
    enterMainButton.layer.cornerRadius = 24;
    enterMainButton.layer.borderColor = [UIColor whiteColor].CGColor;
    enterMainButton.titleLabel.textColor = [UIColor grayColor];
    [enterMainButton setTitle:@"进入应用" forState:UIControlStateNormal];
    [self.view addSubview:enterMainButton];
    [enterMainButton addTarget:self action:@selector(enterMainAction:) forControlEvents:UIControlEventTouchUpInside];
    enterMainButton.hidden = YES;//先设置为隐藏，等过三秒的时间在显示该按钮，
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        enterMainButton.hidden = NO;
    });
}

- (void)enterMainAction:(UIButton *)btn {
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
