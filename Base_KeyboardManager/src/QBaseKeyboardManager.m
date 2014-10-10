//
//  QBaseKeyboardManager.m
//  KeyboardManager
//
//  Created by andy on 10/10/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseKeyboardManager.h"
#import <objc/message.h>

@implementation QBaseKeyboardManager

#pragma mark -
#pragma mark - Public Methods

/**
 *  键盘高度发生变化回调
 */
- (void)keyboardHeightChanged:(QBaseKeyboardHeightChangedBlock)block
{
    self.heightChangedBlock = block;
}



#pragma mark - 
#pragma mark - Init

- (id)init
{
    if (self = [super init]) {
        
        [self registNotification];
    }
    
    return self;
}

- (void)dealloc
{
    [self removeNotification];
}

/**
 *  注册通知
 */
- (void)registNotification
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
- (void)removeNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -
#pragma mark - Keyboard Height Changed Callback

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
- (NSInteger)getKeyboardHeight:(NSDictionary *)userInfo
{
    CGRect keyboardFrame = [[userInfo objectForKey:@"UIKeyboardBoundsUserInfoKey"] CGRectValue];
    NSInteger keyboardHeight = keyboardFrame.size.height;
    
    return keyboardHeight;
}

/**
 *  键盘高度发生变化, 回调代理
 */
- (void)keyboardHeightCallback:(NSInteger)keyboardHeight
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardManager:keyboardHeightDidChanged:)]) {

        objc_msgSend( self.delegate,
                      @selector(keyboardManager:keyboardHeightDidChanged:),
                      self,
                      keyboardHeight);

    }else if (self.heightChangedBlock) {
    
        self.heightChangedBlock(keyboardHeight);
    }
}


@end
