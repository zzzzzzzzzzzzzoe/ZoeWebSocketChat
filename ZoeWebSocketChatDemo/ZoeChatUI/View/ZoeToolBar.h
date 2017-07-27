//
//  ZoeToolBar.h
//  ZoeWebSocketChatDemo
//
//  Created by mac on 2017/6/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZoeToolBar : UIView
@property (nonatomic,strong) UIButton * leftBtn , * rightBtn , * rightMidBtn ,* midVoiceBtn;
- (instancetype)initWithSuperView:(UIView *)superView;
@end
