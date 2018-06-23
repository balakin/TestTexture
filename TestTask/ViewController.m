//
//  ViewController.m
//  TestTask
//
//  Created by Radaev Mikhail on 23.06.2018.
//  Copyright © 2018 msfrms. All rights reserved.
//

#import "ViewController.h"
#import "TestTaskNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TestTaskNode * node = TestTaskNode.new;

    CGSize size = [node layoutThatFits:ASSizeRangeMake(self.view.bounds.size)].size;

    node.frame = CGRectMake(0, 200, size.width, 100);

    [self.view addSubnode:node];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
