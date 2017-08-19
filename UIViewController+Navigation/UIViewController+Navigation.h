//
//  UIViewController+Navigation.h
//  MLCategory
//
//  Created by mjpc on 2017/8/19.
//  Copyright © 2017年 mali. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MLCurrentNavigationController [[UIApplication sharedApplication].delegate window].rootViewController.myNavigationController

@interface UIViewController (Navigation)

@property (nonatomic, strong, readonly) UINavigationController *myNavigationController;

@end
