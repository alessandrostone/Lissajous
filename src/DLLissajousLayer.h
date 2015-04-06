//
//  DLLissajousLayer.h
//  Lissajous
//
//  Created by Dzianis Lebedzeu on 4/6/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DLLissajousLayerWave) {
    DLLissajousLayerWaveSine,
    DLLissajousLayerWaveTriangular
};

@interface DLLissajousLayer : CALayer

@property (nonatomic, assign) CGFloat a;
@property (nonatomic, assign) CGFloat b;
@property (nonatomic, assign) DLLissajousLayerWave wave;
@property (nonatomic, assign) CGFloat delta;
@property (nonatomic, assign) CGFloat velocity;

@end
