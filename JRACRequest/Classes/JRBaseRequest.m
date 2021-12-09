//
//  JRBaseRequest.m
//  JRACService
//
//  Created by xj on 2021/12/8.
//

#import "JRBaseRequest.h"

// 获取服务器响应状态码 key
NSString *const JR_BaseRequest_StatusCodeKey = @"code";
// 服务器响应数据成功状态码 value
NSInteger const JR_BaseRequest_SuccessCodeKey = 200;
// 获取服务器响应状态信息 key
NSString *const JR_BaseRequest_StatusMsgKey = @"msg";
// 获取服务器响应数据 key
NSString *const JR_BaseRequest_DataKey = @"data";;

@implementation JRBaseRequest

#pragma mark - Override
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeJSON;
}

- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeJSON;
}

- (id)requestArgument
{
    return @{};
}

- (NSTimeInterval)requestTimeoutInterval
{
    return 15;
}

- (NSDictionary *)reformParams:(NSDictionary *)params
{
    return params;
}


- (void)start
{
    [super start];
}

- (void)stop
{
    [super stop];
}

#pragma mark - Subclass Ovrride
- (id)reformJSONResponse:(id)jsonResponse {
    
    return jsonResponse;
    
}

@end
