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
    
    [[RACSignal
      combineLatest:@[signal1, signal2]
      reduce:^id(NSNumber *number1, NSNumber *number2)
    {
          return [NSNumber numberWithBool:[number1 intValue] + [number2 intValue] == 3];
    }]
    subscribeNext:^(NSNumber *completed12)
    {
        if ([completed12 intValue] > 0)
        [signal3 subscribeNext:^(NSNumber *number3)
        {
            if ([number3 intValue] == 3)
            {
                [[RACSignal
                  combineLatest:@[signal4, signal5]
                  reduce:^id(NSNumber *number4, NSNumber *number5)
                  {
                      return [NSNumber numberWithBool:[number4 intValue] + [number5 intValue] == 9];
                  }]
                 subscribeNext:^(NSNumber *completed45)
                 {
                     if ([completed45 intValue] > 0)
                     NSLog(@"Finished!!!");
                 }];
            }
        }];
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
