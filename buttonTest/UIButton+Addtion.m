//
//  UIButton+Addtion.m
//  buttonTest
//
//  Created by Xly on 2018/7/13.
//  Copyright © 2018年 Xly. All rights reserved.
//

#import "UIButton+Addtion.h"
#import <objc/runtime.h>

@implementation UIButton (Addtion)

- (void)setAnimationAllowUserInteraction:(BOOL)animationAllowUserInteraction {
    objc_setAssociatedObject(self, @selector(animationAllowUserInteraction), @(animationAllowUserInteraction), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)animationAllowUserInteraction {
    return objc_getAssociatedObject(self, _cmd);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.animationAllowUserInteraction) {
        CGPoint p = [self convertPoint:point toView:self.superview];
        if ([self.layer.presentationLayer hitTest:p]) {
            return YES;
        }
    }
     return [super pointInside:point withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.animationAllowUserInteraction) {
        CGPoint pS =  [touches.anyObject locationInView:self.superview];
        if ([self.layer.presentationLayer hitTest:pS]) {
            [super touchesBegan:touches withEvent:event];
        }
    } else {
        [super touchesBegan:touches withEvent:event];
    }
}

@end
