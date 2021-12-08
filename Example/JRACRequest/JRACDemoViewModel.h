//
//  JRACDemoViewModel.h
//  JRACRequest_Example
//
//  Created by xj on 2021/12/8.
//  Copyright © 2021 slark. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class RACCommand;
@interface JRACDemoViewModel : NSObject

@property (nonatomic, strong) RACCommand *loadDataCommand;

@end

NS_ASSUME_NONNULL_END
