//
//  demo.m
//  BJNavigationController-Swift
//
//  Created by 王旭 on 16/9/1.
//  Copyright © 2016年 beijiahiddink. All rights reserved.
//

#import "BJConfig.h"

@implementation BJConfig

- (UIViewController *)rootViewController {
    
    UIViewController *controller;
    
#ifdef Main
    controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
#elif MeiTuan
    controller = [[UIStoryboard storyboardWithName:@"BJMTMainInterface" bundle:nil] instantiateInitialViewController];
#endif
    
    return controller;
}

@end
