//
//  JRACViewController.m
//  JRACRequest
//
//  Created by slark on 12/08/2021.
//  Copyright (c) 2021 slark. All rights reserved.
//

#import "JRACViewController.h"
#import "JRBaseRequest+Rac.h"
#import "JRACDemoViewModel.h"
#import "JRACDemoRequest.h"

@interface JRACViewController ()
{
    JRACDemoViewModel *_viewModel;
}

@end

@implementation JRACViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
   
    _viewModel = [[JRACDemoViewModel alloc] init];


    [_viewModel.loadDataCommand.executionSignals subscribeNext:^(RACSignal * _Nullable x) {
        [[x dematerialize] subscribeNext:^(id  _Nullable x) {

                } error:^(NSError * _Nullable error) {

                } completed:^{

                }];
    } error:^(NSError * _Nullable error) {

    } completed:^{

    }];
    
    [_viewModel.loadDataCommand execute:nil];
//    JRACDemoRequest *demoRequest = [[JRACDemoRequest alloc] init];
//    [[demoRequest rac_signal] subscribeNext:^(id  _Nullable x) {
//
//        } error:^(NSError * _Nullable error) {
//
//        } completed:^{
//
//        }];
 
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
