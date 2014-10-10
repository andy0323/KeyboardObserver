//
//  QBaseViewController+KeyBoardObserver.m
//  QBaseViewController
//
//  Created by andy on 10/10/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseViewController+KeyBoardObserver.h"

@implementation QBaseViewController (KeyBoardObserver)

/**
 *  注册通知
 */
- (void)registKeyboardNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showKeyboard:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hiddenKeyboard:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

/**
 *  移除通知
 */
- (void)removeKeyboardNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

/**
 *  键盘显示通知回调
 */
- (void)showKeyboard:(NSNotification *)noti
{
    NSInteger keyboardHeight = [self getKeyboardHeight:noti.userInfo];
    
    [self keyboardHeightCallback:keyboardHeight];
}

/**
 *  键盘消失通知回调
 */
- (void)hiddenKeyboard:(NSNotification *)noti
{
    [self keyboardHeightCallback:0.0f];
}

/**
 *  回调键盘高度
 */
- (CGFloat)getKeyboardHeight:(NSDictionary *)userInfo
{
    CGRect keyboardFrame = [[userInfo objectForKey:@"UIKeyboardBoundsUserInfoKey"] CGRectValue];
    CGFloat keyboardHeight = keyboardFrame.size.height;
    
    return keyboardHeight;
}

@end
