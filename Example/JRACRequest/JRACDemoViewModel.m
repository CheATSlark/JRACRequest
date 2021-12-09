//
//  JRACDemoViewModel.m
//  JRACRequest_Example
//
//  Created by xj on 2021/12/8.
//  Copyright © 2021 slark. All rights reserved.
//

#import "JRACDemoViewModel.h"
#import "JRBaseRequest+Rac.h"
#import "JRACDemoRequest.h"

@interface JRACDemoViewModel()
{
    JRACDemoRequest *_requset;
}
@end

@implementation JRACDemoViewModel

- (RACCommand *)loadDataCommand
{
    
    if (!_loadDataCommand) {
        _requset = [[JRACDemoRequest alloc] init];
        @weakify(self)
        _loadDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self)
            return  [[[[self->_requset rac_signal] doNext:^(id  _Nullable x) {
                    // 副作用区 便于观察信号数据
            }] map:^id _Nullable(id  _Nullable value) {
                // 信号转换，可以做模型切换
                return  @"xxx";
            }] materialize];;
        }];

        
    }
    return _loadDataCommand;
}

@end
