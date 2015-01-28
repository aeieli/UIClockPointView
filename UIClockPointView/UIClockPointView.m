//
//  UIClockPointView.m
//  
//
//  Created by aeieli on 15/1/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UIClockPointView.h"

@implementation UIClockPointView{
    CALayer *layer;
    NSTimer *clockTime;
    NSInteger runRadians;
}

// 将角度转换为弧度
#define DEGREES_TO_RADIANS(d)  ((d) * M_PI / 180.f)

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _pointImageView = [[UIImageView alloc]init];
        [self setBackgroundColor:[UIColor clearColor]];
        self.frame = frame;
        //        _pointImageView.layer.backgroundColor = [UIColor blackColor].CGColor;
        //        _pointImageView.layer.anchorPoint = _anchorPoint;
    }
    return self;
}

-(void)clockStart{
    _pointImageView.layer.anchorPoint = _anchorPoint;
    runRadians = _startRadians/2;
    _endRadinas = _endRadinas/2;
    if (!_isClockWise) {
        _endRadinas = -_endRadinas;
    }
    [self clockChangeRotation];
}

-(void)clockStop{
    if (clockTime.isValid) {
        [clockTime invalidate];
        clockTime = nil;
        [_pointImageView.layer removeAnimationForKey:@"transform.rotation.z"];
    }
}

-(void)clockChangeRotation{
    BOOL canRun;
    if (_isClockWise) {
        canRun = runRadians < _endRadinas || _isRepeats;
    }else{
        canRun = runRadians > _endRadinas || _isRepeats;
    }
    if (canRun) {
        if (!clockTime.isValid) {
            clockTime = [NSTimer scheduledTimerWithTimeInterval:_durationIntervalTime target:self selector:@selector(clockChangeRotation) userInfo:nil repeats:YES];
        }
        if (_isClockWise) {
            [self clockMoveToRotationTransFormValue:runRadians TodVale:(++runRadians) duration:_durationIntervalTime/2];
        }else{
            [self clockMoveToRotationTransFormValue:runRadians TodVale:(--runRadians) duration:_durationIntervalTime/2];
        }
        
    }else{
        if (clockTime.isValid) {
            [clockTime invalidate];
            clockTime = nil;
        }
    }
}

-(void)clockMoveToRotationTransFormValue:(NSInteger)oldRadians
                                  TodVale:(NSInteger)newRadians
                                 duration:(CGFloat)durationTime{
    CGFloat oldValue = DEGREES_TO_RADIANS((360/60.f) *oldRadians);
    CGFloat newValue = DEGREES_TO_RADIANS((360/60.f) *newRadians);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    [animation setValues:[UIClockPointView calculateFrameFromValue:oldValue
                                                          toValue:newValue
                                                             func:ElasticEaseOut
                                                       frameCount:500]];
    animation.duration = durationTime;
    _pointImageView.layer.transform = CATransform3DMakeRotation(newValue, 0.0, 0.0, 1.0);
    [_pointImageView.layer addAnimation:animation forKey:nil];
}


+ (NSArray *)calculateFrameFromValue:(CGFloat)fromValue
                             toValue:(CGFloat)toValue
                                func:(AHEasingFunction)func
                          frameCount:(size_t)frameCount
{
    // 设置帧数量
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:frameCount];
    
    // 计算并存储
    CGFloat t = 0.0;
    CGFloat dt = 1.0 / (frameCount - 1);
    for(size_t frame = 0; frame < frameCount; ++frame, t += dt)
    {
        // 此处就会根据不同的函数计算出不同的值达到不同的效果
        CGFloat value = fromValue + func(t) * (toValue - fromValue);
        
        // 将计算结果存储进数组中
        [values addObject:[NSNumber numberWithFloat:(float)value]];
    }
    
    // 数组中存储的数据为 NSNumber float 型
    return values;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
}
@end
