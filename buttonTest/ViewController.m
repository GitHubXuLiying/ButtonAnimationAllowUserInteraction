//
//  ViewController.m
//  buttonTest
//
//  Created by Xly on 2018/7/13.
//  Copyright © 2018年 Xly. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Addtion.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 30, 100, 100)];
    view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view1];
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(100, 30, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.animationAllowUserInteraction = YES;
    self.btn = btn;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static BOOL ret = YES;
    if (ret) {
        self.btn.frame = CGRectMake(100, 30, 100, 100);
        [UIView animateKeyframesWithDuration:20 delay:0 options:UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
            self.btn.frame = CGRectMake(100, 300, 100, 100);
        } completion:^(BOOL finished) {
            NSLog(@"xly--%@",@"finished");
            ret = YES;
        }];
        ret = NO;
    }
}


- (void)btnClick {
    NSLog(@"xly--%@",@"test");
    
    NSLog(@"xly--^^^^^%f",self.btn.frame.origin.y);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
