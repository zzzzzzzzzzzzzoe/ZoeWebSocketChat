//
//  ChatBaseViewController.m
//  ZoeWebSocketChatDemo
//
//  Created by mac on 2017/6/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ChatBaseViewController.h"

@interface ChatBaseViewController ()

@end

@implementation ChatBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.chatToolBar];
    // Do any additional setup after loading the view.
}
- (void)dealloc{
    NSLog(@"-------------");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- getter
- (ZoeToolBar *)chatToolBar{
    if (!_chatToolBar) {
        _chatToolBar = [[ZoeToolBar alloc]initWithSuperView:self.view];
    }
    return _chatToolBar;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
