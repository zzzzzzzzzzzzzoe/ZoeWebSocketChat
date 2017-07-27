//
//  ZoeToolBar.m
//  ZoeWebSocketChatDemo
//
//  Created by mac on 2017/6/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#define RIGHTBTN_X (kScreenWidth - kScaleFrom_iPhone6_Desgin(70))
#define RIGHTMIDBTN_X (kScreenWidth - kScaleFrom_iPhone6_Desgin(20) - kScaleFrom_iPhone6_Desgin(60) - kScaleFrom_iPhone6_Desgin(70))
#define MIDVOICE_X (kScaleFrom_iPhone6_Desgin(90) + kScaleFrom_iPhone6_Desgin(20))
#define MIDVOICE_WIDTH (kScreenWidth - MIDVOICE_X - kScaleFrom_iPhone6_Desgin(60) - kScaleFrom_iPhone6_Desgin(70) - kScaleFrom_iPhone6_Desgin(40))

#import "ZoeToolBar.h"

@interface ZoeToolBar (){
    CGRect toolBGNormalRect;
    CGRect toolBarNormalRect;
    UIView * _superView;
}
@property (nonatomic,strong)UIView * toolsBackgroudView;
@property (nonatomic,strong)UICollectionView * toolsCView, * expressionCView;

@end

@implementation ZoeToolBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithSuperView:(UIView *)superView{
    if (self = [super init]) {
        _superView = superView;
        [self initView];
    }
    return self;
}

- (void)initView{
    self.frame = CGRectMake(0, kScreenHeight - kScaleFrom_iPhone6_Desgin(120), kScreenWidth, kScaleFrom_iPhone6_Desgin(120));
    toolBarNormalRect = self.frame;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor colorWithRed:0.702 green:0.702 blue:0.702 alpha:1.00].CGColor;
    self.layer.borderWidth = kScaleFrom_iPhone6_Desgin(2);
    self.backgroundColor = [UIColor colorWithRed:0.945 green:0.945 blue:0.945 alpha:1.00];
    self.leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScaleFrom_iPhone6_Desgin(30), kScaleFrom_iPhone6_Desgin(30), kScaleFrom_iPhone6_Desgin(60), kScaleFrom_iPhone6_Desgin(60))];
    [self.leftBtn setImage:[UIImage imageNamed:@"yuyin_defaut"] forState:UIControlStateNormal];
    [self.leftBtn setImage:[UIImage imageNamed:@"jianpan_defaut"] forState:UIControlStateSelected];
    [self.leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.leftBtn addObserver:self forKeyPath:@"selected" options:NSKeyValueObservingOptionNew context:NULL];
    [self addSubview:self.leftBtn];
    self.rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(RIGHTBTN_X, kScaleFrom_iPhone6_Desgin(30), kScaleFrom_iPhone6_Desgin(60), kScaleFrom_iPhone6_Desgin(60))];
    [self.rightBtn setImage:[UIImage imageNamed:@"add_defaut"] forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rightBtn];
    self.rightMidBtn = [[UIButton alloc]initWithFrame:CGRectMake(RIGHTMIDBTN_X, kScaleFrom_iPhone6_Desgin(30), kScaleFrom_iPhone6_Desgin(60), kScaleFrom_iPhone6_Desgin(60))];
    [self.rightMidBtn setImage:[UIImage imageNamed:@"biaoqing_defaut"] forState:UIControlStateNormal];
    [self.rightMidBtn addTarget:self action:@selector(rightMidBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rightMidBtn];
    self.midVoiceBtn = [[UIButton alloc]initWithFrame:CGRectMake(MIDVOICE_X, kScaleFrom_iPhone6_Desgin(20), MIDVOICE_WIDTH, kScaleFrom_iPhone6_Desgin(80))];
    self.midVoiceBtn.layer.masksToBounds = YES;
    self.midVoiceBtn.layer.borderColor = [UIColor colorWithRed:0.702 green:0.702 blue:0.702 alpha:1.00].CGColor;
    self.midVoiceBtn.layer.borderWidth = kScaleFrom_iPhone6_Desgin(2);
    self.midVoiceBtn.layer.cornerRadius = kScaleFrom_iPhone6_Desgin(8);
    [self.midVoiceBtn setTitle:@"按住说话" forState:UIControlStateNormal];
    [self.midVoiceBtn setTitleColor:[UIColor colorWithRed:0.157 green:0.169 blue:0.204 alpha:1.00] forState:UIControlStateNormal];
    [self.midVoiceBtn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:0.525 green:0.529 blue:0.533 alpha:0.70]] forState:UIControlStateHighlighted];
    self.midVoiceBtn.titleLabel.font = [UIFont systemFontOfSize:kScaleFrom_iPhone6_Desgin(30)];

    [self addSubview:self.midVoiceBtn];
}


- (UIView *)toolsBackgroudView{
    if (!_toolsBackgroudView) {
        _toolsBackgroudView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, (kScreenWidth/4) * 2)];
        _toolsBackgroudView.backgroundColor = [UIColor colorWithRed:0.945 green:0.945 blue:0.945 alpha:1.00];
        toolBGNormalRect = _toolsBackgroudView.frame;

    }
    return _toolsBackgroudView;
}

- (UICollectionView *)toolsCView{
    if (!_toolsCView) {
        _toolsCView = [[UICollectionView alloc]initWithFrame:self.toolsBackgroudView.bounds collectionViewLayout:[[UICollectionViewLayout alloc]init]];
        _toolsCView.backgroundColor = [UIColor redColor];
    }
    return _toolsCView;
}

- (UICollectionView *)expressionCView{
    if (!_expressionCView) {
        _expressionCView = [[UICollectionView alloc]initWithFrame:self.toolsBackgroudView.bounds collectionViewLayout:[[UICollectionViewLayout alloc]init]];
        _expressionCView.backgroundColor = [UIColor blueColor];
    }
    return _expressionCView;
}


- (void)leftBtnClick{
    self.leftBtn.selected = !self.leftBtn.selected;
}

- (void)rightBtnClick{
    [self showToolsView];
    self.leftBtn.selected = YES;
}

- (void)rightMidBtnClick{
    [self showExpressionView];
    self.leftBtn.selected = YES;

}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"selected"])
    {
        if (self.leftBtn.selected == YES) {
            NSLog(@"YES");
        }else{
            NSLog(@"NO");
        }

    }
}

- (void)showToolsView{
    if (!self.rightBtn.selected  && !self.rightMidBtn.selected) {
//        [[UIApplication sharedApplication].keyWindow addSubview:self.toolsBackgroudView];
        [_superView addSubview:self.toolsBackgroudView];
        [self.toolsBackgroudView addSubview:self.toolsCView];
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = self.toolsBackgroudView.frame;
            rect.origin =  CGPointMake(0, kScreenHeight - self.toolsBackgroudView.frame.size.height);
            self.toolsBackgroudView.frame = rect;
            CGRect toolsbarRect = self.frame;
            toolsbarRect.origin = CGPointMake(0, kScreenHeight - self.toolsBackgroudView.frame.size.height - self.frame.size.height);
            self.frame = toolsbarRect;
        }];
    }else if (self.rightBtn.selected == YES){
        return ;
    }else if (self.rightMidBtn.selected == YES){
        [self.expressionCView removeFromSuperview];
        self.expressionCView = nil;
        self.toolsCView.frame = toolBGNormalRect;
        [self.toolsBackgroudView addSubview:self.toolsCView];
        [UIView animateWithDuration:0.2 animations:^{
            self.toolsCView.frame = self.toolsBackgroudView.bounds;
        }];
    }
    self.rightBtn.selected = YES;
    self.rightMidBtn.selected = NO;
}

- (void)showExpressionView{
    if (!self.rightBtn.selected  && !self.rightMidBtn.selected) {
//        [[UIApplication sharedApplication].keyWindow addSubview:self.toolsBackgroudView];
        [_superView addSubview:self.toolsBackgroudView];
        [self.toolsBackgroudView addSubview:self.expressionCView];
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = self.toolsBackgroudView.frame;
            rect.origin =  CGPointMake(0, kScreenHeight - self.toolsBackgroudView.frame.size.height);
            self.toolsBackgroudView.frame = rect;
            CGRect toolsbarRect = self.frame;
            toolsbarRect.origin = CGPointMake(0, kScreenHeight - self.toolsBackgroudView.frame.size.height - self.frame.size.height);
            self.frame = toolsbarRect;
        }];
    }else if (self.rightMidBtn.selected == YES){
        return ;
    }else if (self.rightBtn.selected == YES){
        [self.toolsCView removeFromSuperview];
        self.toolsCView = nil;
        self.expressionCView.frame = toolBGNormalRect;
        [self.toolsBackgroudView addSubview:self.expressionCView];
        [UIView animateWithDuration:0.2 animations:^{
            self.expressionCView.frame = self.toolsBackgroudView.bounds;
        }];
    }
    self.rightBtn.selected = NO;
    self.rightMidBtn.selected = YES;
}

- (void)hideExpressionView{
    if (_toolsBackgroudView) {
        [UIView animateWithDuration:0.3 animations:^{
            self.toolsBackgroudView.frame = toolBGNormalRect;
            self.frame = toolBarNormalRect;
        } completion:^(BOOL finished) {
            [self.toolsBackgroudView removeFromSuperview];
            self.toolsBackgroudView = nil;
        }];
    }
}

- (void)removeExpressionView{
    [self.toolsBackgroudView removeFromSuperview];
}

@end
