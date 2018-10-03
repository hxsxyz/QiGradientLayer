//
//  QiGradientLayerViewController.m
//  QiGradientLayer
//
//  Created by huangxianshuai on 2018/10/3.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import "QiGradientLayerViewController.h"

@interface QiGradientLayerViewController ()

@end

@implementation QiGradientLayerViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = NSStringFromClass(self.class);
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self handleType:_type];
}

- (void)dealloc {
    
    NSLog(@"%s", __func__);
}


#pragma mark - Private functions

- (void)handleType:(QiGradientLayerType)type {
    
    switch (type) {
        case QiGradientLayerTypeView: {
            
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qr_qishare"]];
            imageView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 3);
            imageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
            [self.view addSubview:imageView];
            
            CAGradientLayer *gradientLayer = [CAGradientLayer layer];
            gradientLayer.frame = imageView.bounds;
            gradientLayer.colors = @[(__bridge id)[[UIColor purpleColor] colorWithAlphaComponent:1.0].CGColor,
                                     (__bridge id)[[UIColor blueColor] colorWithAlphaComponent:1.0].CGColor];
            gradientLayer.startPoint = CGPointMake(.0, .0);
            gradientLayer.endPoint = CGPointMake(.0, 1.0);
            [imageView.layer addSublayer:gradientLayer];
            
            break;
        }
        case QiGradientLayerTypeProgressForward: {
            
            UIView *progressView = [[UIView alloc] initWithFrame:CGRectMake(30.0, 100.0, self.view.bounds.size.width - 30.0 * 2, 5.0)];
            progressView.center = (CGPoint){self.view.bounds.size.width / 2, self.view.bounds.size.height / 3};
            progressView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
            progressView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:.3];
            progressView.layer.cornerRadius = progressView.bounds.size.height / 2;
            progressView.layer.masksToBounds = YES;
            [self.view addSubview:progressView];
            
            CAGradientLayer *gradientLayer = [CAGradientLayer layer];
            gradientLayer.frame = progressView.bounds;
            gradientLayer.colors = @[(__bridge id)[[UIColor greenColor] colorWithAlphaComponent:1.0].CGColor,
                                     (__bridge id)[[UIColor blueColor] colorWithAlphaComponent:1.].CGColor,
                                     (__bridge id)[[UIColor purpleColor] colorWithAlphaComponent:1.0].CGColor,];
            gradientLayer.startPoint = (CGPoint){.0};
            gradientLayer.endPoint = (CGPoint){1.0};
            [progressView.layer addSublayer:gradientLayer];
            
            CALayer *maskLayer = [CALayer layer];
            maskLayer.frame = (CGRect){.0, .0, .0, gradientLayer.bounds.size.height};
            maskLayer.backgroundColor = [UIColor whiteColor].CGColor;
            gradientLayer.mask = maskLayer;
            
            CGFloat deltaWidth = gradientLayer.bounds.size.width / 60;
            [NSTimer scheduledTimerWithTimeInterval:.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
                CGRect rect = maskLayer.bounds;
                rect.size.width += deltaWidth;
                maskLayer.frame = rect;
                if (gradientLayer.bounds.size.width - maskLayer.bounds.size.width < deltaWidth) {
                    [timer invalidate];
                }
            }];
            break;
        }
        case QiGradientLayerTypeProgressBackward: {
            
            UIView *progressView = [[UIView alloc] initWithFrame:CGRectMake(30.0, 100.0, self.view.bounds.size.width - 30.0 * 2, 5.0)];
            progressView.center = (CGPoint){self.view.bounds.size.width / 2, self.view.bounds.size.height / 3};
            progressView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
            progressView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:.3];
            progressView.layer.cornerRadius = progressView.bounds.size.height / 2;
            progressView.layer.masksToBounds = YES;
            [self.view addSubview:progressView];
            
            CAGradientLayer *gradientLayer = [CAGradientLayer layer];
            gradientLayer.frame = progressView.bounds;
            gradientLayer.colors = @[(__bridge id)[[UIColor purpleColor] colorWithAlphaComponent:1.0].CGColor,
                                     (__bridge id)[[UIColor blueColor] colorWithAlphaComponent:1.].CGColor,
                                     (__bridge id)[[UIColor greenColor] colorWithAlphaComponent:1.0].CGColor];
            gradientLayer.startPoint = (CGPoint){.0};
            gradientLayer.endPoint = (CGPoint){1.0};
            [progressView.layer addSublayer:gradientLayer];
            
            CALayer *maskLayer = [CALayer layer];
            maskLayer.frame = gradientLayer.bounds;
            maskLayer.backgroundColor = [progressView.backgroundColor colorWithAlphaComponent:1.0].CGColor;
            gradientLayer.mask = maskLayer;
            
            CGFloat deltaWidth = gradientLayer.bounds.size.width / 60;
            [NSTimer scheduledTimerWithTimeInterval:.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
                CGRect rect = maskLayer.bounds;
                rect.size.width -= deltaWidth;
                maskLayer.frame = rect;
                if (maskLayer.bounds.size.width < deltaWidth) {
                    [timer invalidate];
                }
            }];
            break;
        }
        case QiGradientLayerTypeArc: {
            
            UIView *arcView = [[UIView alloc] initWithFrame:CGRectMake(.0, .0, 300.0, 300.0)];
            arcView.center = (CGPoint){self.view.bounds.size.width / 2, self.view.bounds.size.height / 3};
            arcView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
            [self.view addSubview:arcView];
            
            CAGradientLayer *gradientLayer = [CAGradientLayer layer];
            gradientLayer.frame = arcView.bounds;
            gradientLayer.colors = @[(__bridge id)[[UIColor redColor] colorWithAlphaComponent:1.0].CGColor,
                                     (__bridge id)[[UIColor greenColor] colorWithAlphaComponent:1.0].CGColor,
                                     (__bridge id)[[UIColor blueColor] colorWithAlphaComponent:1.0].CGColor];
            gradientLayer.startPoint = CGPointMake(.0, .0);
            gradientLayer.endPoint = CGPointMake(.0, 1.0);
            [arcView.layer addSublayer:gradientLayer];
            
            CGFloat lineWidth = 10.0;
            CGFloat radius = gradientLayer.bounds.size.width - lineWidth;
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:(CGRect){lineWidth / 2, lineWidth / 2, radius, radius}];
            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            shapeLayer.path = path.CGPath;
            shapeLayer.fillColor = [UIColor clearColor].CGColor;
            shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
            shapeLayer.lineWidth = lineWidth;
            gradientLayer.mask = shapeLayer;
            
            __block CGFloat redIndex = 1.0, greenIndex = 1.0, blueIndex = 1.0;
            [NSTimer scheduledTimerWithTimeInterval:.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
                redIndex -= 4.0 / 600;
                greenIndex -= 2.0 / 600;
                blueIndex -= 1.0 / 600;
                gradientLayer.locations = @[@(redIndex), @(greenIndex), @(blueIndex)];
                if (blueIndex <= .0) {
                    [timer invalidate];
                }
            }];
            
            break;
        }
        default:
            break;
    }
}

@end
