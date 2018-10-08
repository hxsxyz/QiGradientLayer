//
//  QiGradientLayerViewController.h
//  QiGradientLayer
//
//  Created by huangxianshuai on 2018/10/3.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, QiGradientLayerType) {
    QiGradientLayerTypeView,
    QiGradientLayerTypeProgressForward,
    QiGradientLayerTypeProgressBackward,
    QiGradientLayerTypeArcClosed,
    QiGradientLayerTypeArcOpend,
};

NS_ASSUME_NONNULL_BEGIN

@interface QiGradientLayerViewController : UIViewController

@property (nonatomic, assign) QiGradientLayerType type;

@end

NS_ASSUME_NONNULL_END
