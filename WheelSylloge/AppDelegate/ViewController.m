//
//  ViewController.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/6.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "ViewController.h"
#import "SwbADC_ViewController.h"
#import "NavigateToolUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    appDelegate.window.rootViewController = [[SwbADC_ViewController alloc]init];
    [NavigateToolUtil configNavtigateBar];
    
    [[SwbADC_TabBarTool shareTool] showBadgeValue:@"1111" AtIndex:3];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
