//
//  ViewController.m
//  Lissajous
//
//  Created by Dzianis Lebedzeu on 4/6/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "ViewController.h"
#import "DLLissajousView.h"
#import "DLLissajousLayer.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet DLLissajousView *lissajousView;
@property (nonatomic, weak) IBOutlet UILabel *aLabel;
@property (nonatomic, weak) IBOutlet UILabel *bLabel;
@property (weak, nonatomic) IBOutlet UISlider *aSlider;
@property (weak, nonatomic) IBOutlet UISlider *bSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAValue:self.lissajousLayer.a];
    self.aSlider.value = self.lissajousLayer.a;
    
    [self setBValue:self.lissajousLayer.b];
    self.bSlider.value = self.lissajousLayer.b;
}

- (IBAction)didTapWaveType:(UISegmentedControl *)sender {
    self.lissajousView.lissajousLayer.wave = (sender.selectedSegmentIndex == 0) ? DLLissajousLayerWaveSine : DLLissajousLayerWaveTriangular;
}

- (IBAction)didChangeA:(UISlider *)sender {
    NSUInteger value = round(sender.value);
    self.lissajousView.lissajousLayer.a = value;
    [self setAValue:value];
}

- (IBAction)didChangeB:(UISlider *)sender {
    NSUInteger value = round(sender.value);
    self.lissajousView.lissajousLayer.b = value;
    [self setBValue:value];
}

- (DLLissajousLayer *)lissajousLayer {
    return self.lissajousView.lissajousLayer;
}

- (void)setAValue:(NSUInteger)value {
    self.aLabel.text = [NSString stringWithFormat:@"A: %lu", (unsigned long)value];
}

- (void)setBValue:(NSUInteger)value {
    self.bLabel.text = [NSString stringWithFormat:@"B: %lu", (unsigned long)value];
}

@end
