//
//  QBaseKeyboardManager.h
//  KeyboardManager
//
//  Created by andy on 10/10/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - Protocol

@class QBaseKeyboardManager;
@protocol QBaseKeyboardManagerDelegate <NSObject>

@optional
/**
 *  键盘高度发生变化的时候, 执行该函数
 *
 *  @param keyboardManager 函数调用对象 keyboardManager
 *  @param keyboardHeight  最新键盘高度
 */
- (void)keyboardManager:(QBaseKeyboardManager *)keyboardManager keyboardHeightDidChanged:(NSInteger)keyboardHeight;

@end

/// 键盘高度发生变化的时候, 将会回调的Block
typedef void (^QBaseKeyboardHeightChangedBlock) (NSInteger keyboardHeight);

@interface QBaseKeyboardManager : NSObject
{

}
/**
 *  回调代理
 */
@property (nonatomic, assign) id<QBaseKeyboardManagerDelegate> delegate;

/**
 *  键盘高度发生变化的Block回调
 */
@property (nonatomic, copy) QBaseKeyboardHeightChangedBlock heightChangedBlock;

/**
 *  键盘高度发生变化回调
 *
 *  @param block 键盘高度发生变化的Block回调
 */
- (void)keyboardHeightChanged:(QBaseKeyboardHeightChangedBlock)block;


@end

