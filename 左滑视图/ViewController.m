//
//  ViewController.m
//  左滑视图
//
//  Created by enter on 15/12/7.
//  Copyright © 2015年 enter. All rights reserved.
//

#import "ViewController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenBounds [UIScreen mainScreen].bounds
#define BarHeight 20
#define NVHeight 44
#define TBHeight 44

#define BackgroundColor [UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1]
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // Do any additional setup after loading the view.
    
    
    [self addChildViewController:self.leftController];
    [self.view addSubview:self.leftController.view];
    
    
    [self addChildViewController:self.midController];
    [self.view addSubview:_midController.view];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.frame = CGRectMake(0, 20, 40, 40);
    [leftButton setTitle:@"left" forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(didClickLeftBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.midController.view addSubview:leftButton];
    
    
    //滑动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    [self.midController.view addGestureRecognizer:pan];
    
    //点击收拾
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    
    [self.midController.view addGestureRecognizer:tap];
    
}

//  网易侧边栏效果
- (void)didClickLeftBarButtonAction:(UIBarButtonItem *)leftButton{
    
    //  用这个判断条件是为了左边视图出来后,再点击按钮能够回去
    if (!self.midController.view.frame.origin.x == 0) {
        [self popLeftView:0.3];
        
        
    }else{
        [self pushLeftView:0.3];
        
    }
    
    
}
//点击手势
- (void)tap:(UITapGestureRecognizer *)tap{
    [self popLeftView:0.3];
}
//滑动手势
- (void)pan:(UIPanGestureRecognizer *)pan{
    // 获取手势的偏移量
    
    CGPoint transP = [pan translationInView:self.midController.view];
    CGFloat offsetX = transP.x;
    // 修改最新的main.frame,
    if ((self.midController.view.frame.origin.x+ offsetX)>=0) {
//        NSLog(@"%f",(self.midController.view.frame.origin.x+ offsetX));
    self.midController.view.frame = CGRectMake(self.midController.view.frame.origin.x+ offsetX, 0, ScreenWidth, ScreenHeight);
    // 复位
    [pan setTranslation:CGPointZero inView:self.midController.view];
    
        // 判断下当前手指有没有抬起,表示手势结束
        if (pan.state == UIGestureRecognizerStateEnded) { // 手指抬起,定位
            //        // x>屏幕的一半,定位到右边某个位置
            if (self.midController.view.frame.origin.x >= ScreenWidth * 0.3) {
                [self pushLeftView:0.3*(ScreenWidth*2/3 - transP.x)/(ScreenWidth*2/3)];
                
            }else{
                // 最大的x < 屏幕一半的时候,定义到左边某个位置
                [self popLeftView:0.3*(ScreenWidth*2/3 - transP.x)/(ScreenWidth*2/3)];
            }
        }
    }else{
    [self popLeftView:0.3*(ScreenWidth*2/3 - transP.x)/(ScreenWidth*2/3)];
    }
}

//收回左视图
- (void)popLeftView:(double)time{
    [UIView animateWithDuration:time animations:^{
        
        self.midController.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        
    } completion:^(BOOL finished) {
    }];
    
}
//推出左视图
- (void)pushLeftView:(double)time{
    [UIView animateWithDuration:time animations:^{
        
        self.midController.view.frame = CGRectMake(ScreenWidth*2/3, 0, ScreenWidth, ScreenHeight);
        
    } completion:^(BOOL finished) {
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
