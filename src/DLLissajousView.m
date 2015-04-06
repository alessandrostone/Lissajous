//
//  LissajousView.m
//  Lissajous
//
//  Created by Dzianis Lebedzeu on 4/6/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "DLLissajousView.h"
#import "DLLissajousLayer.h"

@implementation DLLissajousView

+ (Class)layerClass {
    return DLLissajousLayer.class;
}

- (DLLissajousLayer *)lissajousLayer {
    return (DLLissajousLayer *)self.layer;
}

@end
