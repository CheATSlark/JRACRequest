//
//  JRACDemoRequest.m
//  JRACRequest_Example
//
//  Created by xj on 2021/12/8.
//  Copyright © 2021 slark. All rights reserved.
//

#import "JRACDemoRequest.h"

@implementation JRACDemoRequest

- (NSString *)requestUrl {
    
    return  @"/api/v1/trace/record/sendTraceRecord";
}

- (NSDictionary *)requestHeaderFieldValueDictionary {
    return @{@"ver" : @"1.0.0", @"vcode" : @"1", @"did" : @"712F8721-6006-4F43-9D5D-B6FCB7DD8E78", @"dtype": @"2", @"timestamp" : @"20211207135421", @"productId" : @"1001", @"appId" : @"100101", @"channel" : @"ios"};
}

- (id)requestArgument {
    return @{ @"event" : @"P00004", @"type" : @"load"};
}

@end
