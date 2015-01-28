# UIClockPointView
clock point run with CAKeyframeAnimation

## How to use?

- add *UIClockPointView.h*、*UIClockPointView.m*、*easing.h*、*easing.c* to you project.
- import "UIClockPointView.h"

```Objective-C

// create UIClockPointView
    UIClockPointView *colockSecoend = [[UIClockPointView alloc]initWithFrame:self.view.frame];
// set pointImageView frame and image.
    colockSecoend.pointImageView = [[UIImageView alloc]initWithFrame:CGRectMake(colockSecoend.frame.size.width/2-60, colockSecoend.frame.size.height/2, 120, 3)];
    [colockSecoend.pointImageView setImage:[UIImage imageNamed:@"FREE_03"]];
// set animation center point.
    colockSecoend.anchorPoint = CGPointMake(0.1, 0);
    [self.view addSubview:colockSecoend];
//start radians.0~360..
    colockSecoend.startRadians = 90;
    colockSecoend.durationIntervalTime = 1;
    colockSecoend.isClockWise = YES;
    colockSecoend.isRepeats = YES;
//start animation.
    [colockSecoend clockStart];
    
```

## Thanks

https://github.com/YouXianMing/EasingAnimation

http://easings.net/