//
//  JRequestConfiguration.h
//  JRACRequest
//
//  Created by xj on 2021/12/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JRequestConfiguration : NSObject

@property (nonatomic, copy) NSDictionary *commonParams;

@property (nonatomic, copy) NSString *baseUrl;

@end

NS_ASSUME_NONNULL_END
