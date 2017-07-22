//
//  ViewController.m
//  helloDanche
//
//  Created by 陈晓军 on 2017/7/19.
//  Copyright © 2017年 陈晓军. All rights reserved.
//

#import "ViewController.h"
#define time 8.0
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *ByciyView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = _ByciyView.frame.size.width;
    self.view.backgroundColor = [UIColor whiteColor];
    UIBezierPath * path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(0, 300)];
    [path addLineToPoint:CGPointMake(width/2.0, 300)];
    [path addArcWithCenter:CGPointMake(width/2.0, 300 - 80) radius:80 startAngle:M_PI_2 endAngle:-(M_PI_2 *3.0) clockwise:0];
    
    
    [path addLineToPoint:CGPointMake(width, 300)];
    
    CAShapeLayer * pathLayer = [CAShapeLayer layer];
    pathLayer.path = path.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.ByciyView.layer addSublayer:pathLayer];
    
    CAKeyframeAnimation * pathAnimation = [CAKeyframeAnimation animation];
    pathAnimation.keyPath = @"position";
    pathAnimation.duration  = time;
    pathAnimation.path = path.CGPath;
    pathAnimation.rotationMode = kCAAnimationRotateAuto;
    pathAnimation.calculationMode = kCAAnimationCubicPaced;
    CALayer * bicyleLayer = [CALayer layer];
    bicyleLayer.frame = CGRectMake(0, 0, 22, 22);
    bicyleLayer.position = CGPointMake(0, 300);
    bicyleLayer.anchorPoint = CGPointMake(0.0, 1.0);
    bicyleLayer.contents = (__bridge id)[UIImage imageNamed:@"bicycle.png"].CGImage;
    [self.ByciyView.layer addSublayer:bicyleLayer];
    [bicyleLayer addAnimation:pathAnimation forKey:nil];
    
}


@end
