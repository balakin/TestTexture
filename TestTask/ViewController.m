//
//  ViewController.m
//  TestTask
//
//  Created by Radaev Mikhail on 23.06.2018.
//  Copyright © 2018 msfrms. All rights reserved.
//

#import "ViewController.h"
#import "TestTaskNode.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TestTaskNode * node = TestTaskNode.new;

    CGSize size = [node layoutThatFits:ASSizeRangeMake(self.view.bounds.size)].size;

    node.frame = CGRectMake(0, 200, size.width, 100);

    [self.view addSubnode:node];

    RACSignal * signal1 = [[RACSignal return:@1] delay:1];
    RACSignal * signal2 = [[RACSignal return:@2] delay:1];
    RACSignal * signal3 = [[RACSignal return:@3] delay:1];
    RACSignal * signal4 = [[RACSignal return:@4] delay:1];
    RACSignal * signal5 = [[RACSignal return:@5] delay:1];
    
    // требуется сделать 2 сигнала паралельно, потом 1 последовательно, 2 паралельно

    // Do any additional setup after loading the view, typically from a nib.
    
    RACSignal *signal6 = [RACSignal zip:@[signal1, signal2]];
    RACSignal *signal7 = [RACSignal zip:@[signal4, signal5]];
    RACSignal *signal8 = [@[signal6, signal3, signal7].rac_sequence.signal flatten];
    
    [signal8 subscribeNext:^(id x)
    {
        NSLog(@"%@", x);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
