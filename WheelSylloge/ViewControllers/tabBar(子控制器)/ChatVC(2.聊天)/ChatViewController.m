//
//  ChatViewController.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/17.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.blueColor;
    self.navigationItem.title = @"聊天";
    
    [[SwbADC_TabBarTool shareTool] showNewAtIndex:1];
}

- (void)selectTabbarItemDoubleTapped
{
    [super selectTabbarItemDoubleTapped];
    NSLog(@"双击了%@",self);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
