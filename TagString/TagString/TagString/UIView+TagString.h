//
//  UIView+TagString.h
//  C
//
//  Created by xuzeyu on 2018/9/13.
//  Copyright © 2018年 xuzejia_joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TagString)

@property (nonatomic, copy, nonnull) IBInspectable NSString *tagString;            /**<   tag字符串 */

- (UIView *_Nullable)viewWithTagString:(NSString *_Nonnull)tagString;              /**<    根据TagString获取子视图 */

- (NSArray <UIView *>*_Nullable)viewsWithTagString:(NSString *_Nonnull)tagString;  /**<    根据TagString获取所有子视图的数组 */

- (UIView *_Nullable)superviewWithTagString:(NSString *_Nonnull)tagString;         /**<    根据TagString获取父视图 */

@end
