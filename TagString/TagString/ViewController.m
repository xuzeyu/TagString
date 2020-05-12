//
//  ViewController.m
//  TagString
//
//  Created by hc on 2018/12/6.
//  Copyright © 2018年 xzy. All rights reserved.
//

#import "ViewController.h"
#import "UIView+TagString.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
}

- (void)test {
    UIView *subView0 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    subView0.backgroundColor = [UIColor redColor];
    subView0.tagString = @"我是subView0";
    [self.view addSubview:subView0];
    
    UIView *subView1 = [[UIView alloc] initWithFrame:CGRectMake(50, 150, 200, 100)];
    subView1.backgroundColor = [UIColor yellowColor];
    subView1.tagString = @"我是subView1";
    [self.view addSubview:subView1];
    
    UIView *subView2 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    subView2.backgroundColor = [UIColor grayColor];
    subView2.tagString = @"我是subView1";
    [subView1 addSubview:subView2];
    
    UIView *searchSubview = [self.view viewWithTagString:@"我是subView0"];
    if (subView0 == searchSubview) {
        NSLog(@"获取subView0成功");
    }
    
    NSLog(@"%@", [self.view viewsWithTagString:@"我是subView0"]);
    NSLog(@"%@", [self.view viewsWithTagString:@"我是subView1"]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
