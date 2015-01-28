//
//  UIClockPointView.h
//
//
//  Created by aeieli on 15/1/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import "easing.h"


@interface UIClockPointView : UIView
/**
 *  clock Point ImageView
 */
@property (nonatomic, strong) UIImageView *pointImageView;

/**
 *  clock animation center point
 */
@property (nonatomic)         CGPoint anchorPoint;
/**
 *  animation kept time
 */
@property (nonatomic)         double durationIntervalTime;
/**
 *  start radians, has counterclockwise 0~360°
 */
@property (nonatomic)         NSInteger startRadians;

/**
 *  end radians, just at isRepeats = NO is valid.
 */
@property (nonatomic)         NSInteger endRadinas;

@property (nonatomic)         BOOL isRepeats;

/**
 *  clock point animation is clockwiser(YES) or counterclockwise(NO).
 */
@property (nonatomic)         BOOL isClockWise;
/**
 *  begin animation
 */
-(void)clockStart;

/**
 *  stop animation
 */
-(void)clockStop;

-(void)clockMoveToRotationTransFormValue:(NSInteger)oldRadians
                                  TodVale:(NSInteger)newRadians
                                 duration:(CGFloat)durationTime;

@end
