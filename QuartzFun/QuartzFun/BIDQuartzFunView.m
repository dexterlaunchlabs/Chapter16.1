//
//  BIDQuartzFunView.m
//  QuartzFun
//
//  Created by Dexter Launchlabs on 7/31/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "BIDQuartzFunView.h"
#import "UIColor+BIDRandom.h"

@implementation BIDQuartzFunView

@synthesize firstTouch, lastTouch, currentColor, drawImage, useRandomColor, shapeType;
@synthesize redrawRect, currentRect;
- (CGRect)currentRect {
    return CGRectMake (firstTouch.x,
                       firstTouch.y,
                       lastTouch.x - firstTouch.x, lastTouch.y - firstTouch.y);
}

                       
                       
- (id)initWithCoder:(NSCoder*)coder {
    if (self = [super initWithCoder:coder]) {
        currentColor = [UIColor redColor];
        useRandomColor = NO;
        self.drawImage = [UIImage imageNamed:@"iphone.png"] ;
    }
    return self; }
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event { if (useRandomColor) {
    self.currentColor = [UIColor randomColor]; }
    UITouch *touch = [touches anyObject]; firstTouch = [touch locationInView:self]; lastTouch = [touch locationInView:self]; [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event { UITouch *touch = [touches anyObject];
    lastTouch = [touch locationInView:self];
    [self setNeedsDisplay]; }
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event { UITouch *touch = [touches anyObject];
    lastTouch = [touch locationInView:self];
    [self setNeedsDisplay]; }/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
                              */
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0); CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
    CGContextSetFillColorWithColor(context, currentColor.CGColor); CGRect currentRect = CGRectMake(firstTouch.x,
                                                                                                   firstTouch.y,
                                                                                                   lastTouch.x - firstTouch.x, lastTouch.y - firstTouch.y);
    
    switch (shapeType) {
        case kLineShape:
            CGContextMoveToPoint(context, firstTouch.x, firstTouch.y); CGContextAddLineToPoint(context, lastTouch.x, lastTouch.y); CGContextStrokePath(context);
            break;
        case kRectShape:
            CGContextAddRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case kEllipseShape:
            CGContextAddEllipseInRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case kImageShape:
        {
            CGFloat horizontalOffset = drawImage.size.width / 2;
            CGFloat verticalOffset = drawImage.size.height / 2;
            CGPoint drawPoint = CGPointMake(lastTouch.x - horizontalOffset,
                                            lastTouch.y - verticalOffset); [drawImage drawAtPoint:drawPoint];
            break; }        default:
            break;
    }}


@end
