//
//  RootViewController.m
//  ZoeWebSocketChatDemo
//
//  Created by mac on 2017/6/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "RootViewController.h"
#import "ChatBaseViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"ZoeChat";
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth/2 - kScaleFrom_iPhone6_Desgin(100), kScreenHeight/2, kScaleFrom_iPhone6_Desgin(200), kScaleFrom_iPhone6_Desgin(80))];
    [btn setTitle:@"Go to Chat" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)click:(UIButton *)btn{
    btn.selected = YES;
    [self.navigationController pushViewController:[[ChatBaseViewController alloc]init] animated:YES];
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
