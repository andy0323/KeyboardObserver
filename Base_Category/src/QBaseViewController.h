//
//  QBaseViewController.h
//  QBaseViewController
//
//  Created by andy on 10/10/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QBaseViewController : UIViewController

/**
 *  键盘高度发生变化, 回调代理
 */
- (void)keyboardHeightCallback:(CGFloat)keyboardHeight;

@end

