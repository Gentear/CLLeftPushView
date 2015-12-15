//
//  ViewController.h
//  左滑视图
//
//  Created by enter on 15/12/7.
//  Copyright © 2015年 enter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "leftController.h"
#import "rightController.h"
#import "midController.h"
#import "ViewController.h"
@interface ViewController : UIViewController
@property (nonatomic,strong)leftController *leftController;
@property (nonatomic,strong)UINavigationController *midController;

@end

