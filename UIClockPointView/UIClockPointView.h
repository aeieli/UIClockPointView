//
//  UIClockPointView.h
//  AirBest4S
//
//  Created by aeieli on 15/1/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import "easing.h"


@interface UIClockPointView : UIView

@property (nonatomic, strong) UIImageView *pointImageView;

@property (nonatomic)         CGPoint anchorPoint;

@property (nonatomic)         double durationIntervalTime;
/**
 *  start radians, has counterclockwise 0~360°
 */
@property (nonatomic)         NSInteger startRadians;

@property (nonatomic)         NSInteger endRadinas;

@property (nonatomic)         BOOL isRepeats;

@property (nonatomic)         BOOL isClockWise;

-(void)clockStart;

-(void)clockStop;

-(void)clockMoveToRotationTransFormValue:(NSInteger)oldRadians
                                  TodVale:(NSInteger)newRadians
                                 duration:(CGFloat)durationTime;

@end
