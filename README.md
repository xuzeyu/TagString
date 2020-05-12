# TagString
## 概述
在IOS开发中，经常需要获取特定的子视图，我们可以使用苹果官方提供给我们获取子视图的方法viewWithTag。
`- (nullable __kindof UIView *)viewWithTag:(NSInteger)tag; // recursive search. includes self`
传入指定的NSInteger型数字就可以获取对应的UIView。

这很容易，但当我们获取多个子视图时，就会发现代码的可读性变差，维护难度增加
例如：
UIView *view0 = [self.view viewWithTag:100];
UIView *view1 = [self.view viewWithTag:101];
UIView *view2 = [self.view viewWithTag:102];
你很难从马上这几行代码的tag值100，101， 102看出代表的是哪个子视图，很多时候，需要查看上下文，进行参考，才能发现Tag对应的子视图。

正是为了解决这个问题，我书写了这个UIView的类别TagString，可以更好的获取子视图，
导入UIView+TagString类别，你就可以为UIView及其子类设置tagString属性，进而通过tagString属性查找对应的子视图
tagString是字符串型，你可以设置浅显易懂的中英文，从而使代码更具可读性

## 代码
### 头文件
```objective-c
@interface UIView (TagString)

@property (nonatomic, copy, nonnull) IBInspectable NSString *tagString;            /**<   tag字符串 */

- (UIView *_Nullable)viewWithTagString:(NSString *_Nonnull)tagString;              /**<    根据TagString获取子视图，循环查询 不包括自己*/

- (NSArray <UIView *>*_Nullable)viewsWithTagString:(NSString *_Nonnull)tagString;  /**<    根据TagString获取所有子视图的数组，循环查询 不包括自己 */

- (UIView *_Nullable)superviewWithTagString:(NSString *_Nonnull)tagString;         /**<    根据TagString获取父视图，不包括自己 */

@end
```

### 调用范例
如何调用
```objective-c
[self.view viewWithTagString:@"我是UIView"]; //获取单个TagString为"我是UIView"的View
[self.view viewsWithTagString:@"我是UIView"]; //获取所有TagString为"我是UIView"的View数组
[self.view superviewWithTagString:@"我是superview"]; //获取单个TagString为"我是superview"的View
```

相关范例
```objective-c
UIView *subView0 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
subView0.backgroundColor = [UIColor redColor];
subView0.tagString = @"我是UIView1";
[self.view addSubview:subView0];

UITextField *textField0 = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, 100, 50)];
textField0.backgroundColor = [UIColor yellowColor];
textField0.tagString = @"我是textField";
[self.view addSubview:textField0];

UIView *subView1 = [[UIView alloc] initWithFrame:CGRectMake(50, 250, 200, 100)];
subView1.backgroundColor = [UIColor grayColor];
subView1.tagString = @"我是UIView2";
[self.view addSubview:subView1];

UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(50, 25, 100, 50)];
textField1.backgroundColor = [UIColor yellowColor];
textField1.tagString = @"我是textField";
[subView1 addSubview:textField1];

UIView *searchSubview = [self.view viewWithTagString:@"我是UIView1"];
if (subView0 == searchSubview) {
    NSLog(@"获取UIView1成功");
}

NSLog(@"查找子视图：%@", [self.view viewsWithTagString:@"我是UIView1"]);
NSLog(@"查找所有子视图：%@", [self.view viewsWithTagString:@"我是textField"]);
NSLog(@"查找父视图：%@", [textField1 superviewWithTagString:@"我是UIView2"]);
```

## 结语
你觉得代码有问题和改进的地方，请Issues我吧

## 许可证
TagString 使用 MIT 许可证，详情见 LICENSE 文件。

