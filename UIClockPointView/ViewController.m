//
//  ViewController.m
//  UIClockPointView
//
//  Created by aeieli on 15/1/28.
//  Copyright (c) 2015年 com.aeli.clockPointDemo. All rights reserved.
//

#import "ViewController.h"
#import "UIClockPointView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIClockPointView *colockSecoend = [[UIClockPointView alloc]initWithFrame:self.view.frame];
    [colockSecoend setBackgroundColor:[UIColor whiteColor]];
    colockSecoend.pointImageView = [[UIImageView alloc]initWithFrame:CGRectMake(colockSecoend.frame.size.width/2-60, colockSecoend.frame.size.height/2, 120, 3)];
    [colockSecoend.pointImageView setImage:[UIImage imageNamed:@"FREE_03"]];
    [colockSecoend addSubview:colockSecoend.pointImageView];
    
    colockSecoend.anchorPoint = CGPointMake(0.1, 0);
    [self.view addSubview:colockSecoend];
    colockSecoend.startRadians = 90;
    colockSecoend.durationIntervalTime = 1;
    colockSecoend.isClockWise = YES;
    colockSecoend.isRepeats = YES;
    [colockSecoend clockStart];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
