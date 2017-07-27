//
//  AppDelegate.h
//  ZoeWebSocketChatDemo
//
//  Created by mac on 2017/6/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) RootViewController * rootVC;
@property (nonatomic, strong) UINavigationController * navVC;

@end

