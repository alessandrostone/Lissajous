//
//  DLLissajousLayer.m
//  Lissajous
//
//  Created by Dzianis Lebedzeu on 4/6/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "DLLissajousLayer.h"

static const CGFloat kTwoPI = M_PI * 2;

@interface DLLissajousLayer ()

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) CGFloat delta;

@end

@implementation DLLissajousLayer

- (instancetype)init {
    if (self = [super init]) {
        self.allowsEdgeAntialiasing = YES;
        
        _a = 2;
        _b = 3;
        _delta = 0;
        _velocity = 0.02;
        _wave = DLLissajousLayerWaveSine;
        
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(animationFired:)];
        [_displayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:NSDefaultRunLoopMode];
    }
    return self;
}

- (void)dealloc {
    [_displayLink invalidate];
    _displayLink = nil;
}

- (void)drawInContext:(CGContextRef)context {
    [super drawInContext:context];
    CGRect bounds = [self bounds];
    CGContextTranslateCTM(context, CGRectGetWidth(bounds) / 2.0, CGRectGetHeight(bounds) / 2.0);
    
    CGContextSetStrokeColorWithColor(context, UIColor.grayColor.CGColor);
    CGContextSetLineWidth(context, 3.0);

    CGFloat horizontalAmplitude = CGRectGetWidth(bounds) / 2 - 1;
    CGFloat verticalAmplitude = CGRectGetHeight(bounds) / 2 - 1;
    CGFloat increment = kTwoPI / (self.a * self.b * 100.0);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    BOOL shouldMoveToPoint = YES;
    
    for (CGFloat t = 0.0; t < kTwoPI + increment; t += increment) {
        CGFloat x;
        if (self.wave == DLLissajousLayerWaveSine) {
            x = horizontalAmplitude * sin(self.a * t + self.delta);
        } else {
            x = (2 * horizontalAmplitude / M_PI) * asin(sin((kTwoPI * t) / self.a + self.delta));
        }
        
        CGFloat y;
        if (self.wave == DLLissajousLayerWaveSine) {
            y = verticalAmplitude * sin(self.b * t);
        } else {
            y = (2 * verticalAmplitude /  M_PI) * asin(sin(kTwoPI * t / self.b));
        }
        
        if (shouldMoveToPoint) {
            CGPathMoveToPoint(path, NULL, x, y);
            shouldMoveToPoint = NO;
        } else {
            CGPathAddLineToPoint(path, NULL, x, y);
        }
    }
    
    CGContextAddPath(context, path);
    CGContextSetLineJoin(context, kCGLineJoinBevel);
    CGContextStrokePath(context);
    CFRelease(path);
}

- (void)animationFired:(CADisplayLink *)displayLink {
    [self setNeedsDisplay];
    self.delta += self.velocity;
}

@end
