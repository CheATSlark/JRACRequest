//
//  JRBaseRequest.h
//  JRACService
//
//  Created by xj on 2021/12/8.
//

#import <YTKNetwork/YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN

// 获取服务器响应状态码 key
FOUNDATION_EXTERN NSString *const JR_BaseRequest_StatusCodeKey;
// 服务器响应数据成功状态码 value
FOUNDATION_EXTERN NSInteger const JR_BaseRequest_SuccessCodeKey;
// 获取服务器响应状态信息 key
FOUNDATION_EXTERN NSString *const JR_BaseRequest_StatusMsgKey;
// 获取服务器响应数据 key
FOUNDATION_EXTERN NSString *const JR_BaseRequest_DataKey;
// token错误
FOUNDATION_EXTERN NSInteger const JR_BaseRequest_TokenErrorCodeKey;
@class JRBaseRequest;
@protocol BCBaseRequestReformDelegate <NSObject>

/**
 自定义解析器解析响应参数
 
 @param request 当前请求
 @param jsonResponse 响应数据
 @return 自定reformat数据
 */
- (id)request:(JRBaseRequest *)request reformJSONResponse:(id)jsonResponse;

@end


@interface JRBaseRequest : YTKBaseRequest

@end

NS_ASSUME_NONNULL_END
