//
//  UIViewController+Navigation.m
//  MLCategory
//
//  Created by mjpc on 2017/8/19.
//  Copyright © 2017年 mali. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

- (UINavigationController*)myNavigationController {
    UINavigationController* navigationController;
    if ([self isKindOfClass:[UINavigationController class]]) {
        navigationController = (id)self;
    } else {
        if ([self isKindOfClass:[UITabBarController class]]) {
            navigationController = ((UITabBarController*)self).selectedViewController.myNavigationController;
        } else {
            navigationController = self.navigationController;
        }
    }
    
    return navigationController;
}

@end
