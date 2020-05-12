//
//  UIView+TagString.m
//  C
//
//  Created by xuzeyu on 2018/9/13.
//  Copyright © 2018年 xuzejia_joe. All rights reserved.
//

#import "UIView+TagString.h"
#import <objc/runtime.h>

@implementation UIView (TagString)

#pragma mark - 属性
- (NSString *)tagString {
    return objc_getAssociatedObject(self, @selector(tagString));
}

- (void)setTagString:(NSString *)tagString {
    objc_setAssociatedObject(self, @selector(tagString), tagString, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - 方法
- (UIView *_Nullable)viewWithTagString:(NSString *_Nonnull)tagString {
    if (!tagString.length)
        return nil;
    
    for (UIView *subview in self.subviews) {
        if ([subview.tagString isEqualToString:tagString])
            return subview;
        
        UIView *v = [subview viewWithTagString:tagString];
        if (v)
            return v;
    }
    return nil;
}

- (NSArray <UIView *>*_Nullable)viewsWithTagString:(NSString *_Nonnull)tagString {
    if (!tagString.length)
        return nil;
    
    NSMutableArray *array = [NSMutableArray array];
    [self viewsWithTagString:tagString array:array];
    return array.count > 0 ? array : nil;
}

- (void)viewsWithTagString:(NSString *)tagString array:(NSMutableArray *)array {
    for (UIView *subview in self.subviews) {
        if ([subview.tagString isEqualToString:tagString])
            [array addObject:subview];
        
        [subview viewsWithTagString:tagString array:array];
    }
}

- (UIView *_Nullable)superviewWithTagString:(NSString *_Nonnull)tagString {
    UIView *superview = self.superview;
    while (superview) {
        if ([superview.tagString isEqualToString:tagString])
            return superview;
        superview = superview.superview;
    }
    return nil;
}

@end
