//
//  UIViewController+HookForLog.m
//  TestMethodSwizzling
//
//  Created by mjpc on 2017/7/30.
//  Copyright © 2017年 mali. All rights reserved.
//

#import "UIViewController+HookForLog.h"
#import <objc/runtime.h>

#ifdef DEBUG
#   define MLLog(fmt, ...) NSLog((fmt), ##__VA_ARGS__);
#else
#   define MLLog(...)
#endif

@implementation UIViewController (HookForLog)

+ (void)load {
    Method methodOld= class_getInstanceMethod([UIViewController class], @selector(viewDidLoad));
    Method methodNew = class_getInstanceMethod([UIViewController class], @selector(hook_viewDidLoad));
    method_exchangeImplementations(methodOld, methodNew);
    
    methodOld = class_getInstanceMethod([UIViewController class], NSSelectorFromString(@"dealloc"));
    methodNew = class_getInstanceMethod([UIViewController class], @selector(hook_dealloc));
    method_exchangeImplementations(methodOld, methodNew);
}

- (void)hook_viewDidLoad {
    MLLog(@"%@-%@ viewDidLoad", [self titleName], [self class]);
    [self hook_viewDidLoad];
}

- (void)hook_dealloc {
    MLLog(@"%@-%@ dealloc", [self titleName], [self class]);
    [self hook_dealloc];
}
- (NSString *)titleName {
    NSString *titleName = @"Null";
    if (self.navigationItem.title.length) {
        return self.navigationItem.title;
    } else if (self.title.length) {
        return self.title;
    } else if ([self.navigationItem.titleView isKindOfClass:[UILabel class]]) {
        return ((UILabel *) self.navigationItem.titleView).text;
    }
    return titleName;
}



@end
