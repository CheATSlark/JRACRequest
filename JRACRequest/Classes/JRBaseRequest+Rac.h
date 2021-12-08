//
//  JRBaseRequest+Rac.h
//  JRACService
//
//  Created by xj on 2021/12/8.
//

#import "JRBaseRequest.h"
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface JRBaseRequest (Rac)

- (RACSignal *)rac_signal;

@end

NS_ASSUME_NONNULL_END
