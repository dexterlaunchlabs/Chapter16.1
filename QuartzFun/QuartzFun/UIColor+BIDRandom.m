//
//  UIColor+BIDRandom.m
//  QuartzFun
//
//  Created by Dexter Launchlabs on 7/31/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "UIColor+BIDRandom.h"

@implementation UIColor (BIDRandom)
+ (UIColor *)randomColor { static BOOL seeded = NO; if (!seeded) {
    seeded = YES;
    srandom(time(NULL)); }
    CGFloat red = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}
@end
