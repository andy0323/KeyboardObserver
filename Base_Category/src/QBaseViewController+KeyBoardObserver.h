//
//  QBaseViewController+KeyBoardObserver.h
//  QBaseViewController
//
//  Created by andy on 10/10/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseViewController.h"

@interface QBaseViewController (KeyBoardObserver)

/**
 *  注册通知
 */
- (void)registKeyboardNotification;

/**
 *  移除通知
 */
- (void)removeKeyboardNotification;

@end
