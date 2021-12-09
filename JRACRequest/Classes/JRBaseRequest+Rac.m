//
//  JRBaseRequest+Rac.m
//  JRACService
//
//  Created by xj on 2021/12/8.
//

#import "JRBaseRequest+Rac.h"
#import "YTKNetworkConfig.h"

@implementation JRBaseRequest (Rac)

- (RACSignal *)rac_signal {
    
    [self stop];
    @weakify(self)
    RACSignal *signal = [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        @strongify(self)
        [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {

            if ([request.responseJSONObject isKindOfClass:[NSDictionary class]]) {
                //只有code 为200 才是请求成功 其他情况都是非error的异常
                NSDictionary *response = (NSDictionary *)request.responseJSONObject;
                NSInteger code = [[response objectForKey:JR_BaseRequest_StatusCodeKey] integerValue];
                if (code == JR_BaseRequest_SuccessCodeKey) {
                    //把data部分给过去就行了
                    id data = [response objectForKey:JR_BaseRequest_DataKey];
                    [subscriber sendNext:data];
                    [subscriber sendCompleted];
                } else {
                    //都是非正常返回
                    NSString *msg = [response objectForKey:JR_BaseRequest_StatusMsgKey];
                    //直接结束
                    NSError *error = [NSError errorWithDomain:msg code:code userInfo:@{}];
                    [subscriber sendError:error];
                }
                
            } else {
                NSError *error = [NSError errorWithDomain: @"reponse.not.dic" code:-1 userInfo:@{}];;
                [subscriber sendError:error];
            }
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            [subscriber sendError: [NSError errorWithDomain: @"request.failed" code:request.error.code userInfo:request.error.userInfo]];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [self stop];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        }];
    }] takeUntil:[self rac_willDeallocSignal]];
    
    return signal;
}

@end
