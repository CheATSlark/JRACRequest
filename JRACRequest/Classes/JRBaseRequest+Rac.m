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
            
//            DLog(@"本次请求--->>%@ 本次结果---->>%@",request,request.responseJSONObject);
            
            if ([request.responseJSONObject isKindOfClass:[NSDictionary class]]) {
                //只有code 为0 才是请求成功 其他情况都是非error的异常
                NSDictionary *response = (NSDictionary *)request.responseJSONObject;
                NSInteger code = (NSInteger)[response objectForKey:JR_BaseRequest_StatusCodeKey];
                if (code == JR_BaseRequest_SuccessCodeKey) {
                    //把data部分给过去就行了
                    id data = [response objectForKey:JR_BaseRequest_DataKey];
                    [subscriber sendNext:data];
                    [subscriber sendCompleted];
                } else {
                    //都是非正常返回
                    NSString *msg = [response objectForKey:JR_BaseRequest_StatusMsgKey];
                    //                        [[RACScheduler mainThreadScheduler] afterDelay:0.5f schedule:^{
                    //                            [BCCustomHUD showErrorWithStr:msg];
                    //                        }];
                    //直接结束
                    NSError *error = [NSError errorWithDomain:msg code:code userInfo:@{}];
                    [subscriber sendError:error];
     
                }
                
            } else {
                NSError *error = [NSError errorWithDomain: @"network.err3" code:-1 userInfo:@{}];
//                DLog(@"服务器返回的数据不是字典格式");
                [subscriber sendError:error];
            }
                
            
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//            DLog(@"本次请求出现错误---->%@",request.error);
            [subscriber sendError: [NSError errorWithDomain: @"error" code:request.error.code userInfo:request.error.userInfo]];
            
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [self stop];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//            DLog(@"----请求信号被释放----");
        }];
        
    }] takeUntil:[self rac_willDeallocSignal]];
    
    return signal;
}

//- (NSError *)errorWithError:(NSError *)error{
//    if (error) {
//        switch (error.code) {
//            case -1003:
//            case -1009:
//            case -1004:{//没有网络
//                NSError *err = [NSError errorWithDomain:BCLocalStr(@"network.err1") code:error.code userInfo:nil];
//                return err;
//            }
//                break;
//            case -999:{//没有网络
//                NSError *err = [NSError errorWithDomain:BCLocalStr(@"network.err1") code:error.code userInfo:nil];
//                return err;
//            }
//                break;
//            case -1001:
//            case -2000: {
//                NSError *err = [NSError errorWithDomain:BCLocalStr(@"network.err2") code:error.code userInfo:nil];
//                return err;
//            }
//                break;
//            case -1008:
//            case -1011:{
//                NSError *err = [NSError errorWithDomain:BCLocalStr(@"network.err3") code:error.code userInfo:nil];
//                return err;
//            }
//                break;
//            case -1201:
//            case -1015:
//            case -1016:{
//                NSError *err = [NSError errorWithDomain:BCLocalStr(@"network.err3") code:error.code userInfo:nil];
//                return err;
//            }
//                break;
//            case -1005:{
//                NSError *err = [NSError errorWithDomain:BCLocalStr(@"network.err3") code:error.code userInfo:nil];
//                return err;
//            }
//                break;
//            case -1002:
//            case -1000:{
//                NSError *err = [NSError errorWithDomain:BCLocalStr(@"network.err3") code:error.code userInfo:nil];
//                return err;
//            }
//                break;
//            default:
//            {
//                NSError *err = [NSError errorWithDomain:BCLocalStr(@"network.err4") code:error.code userInfo:nil];
//                return err;
//            }
//                break;
//        }
//
//    }
//    return error;
//}

@end
