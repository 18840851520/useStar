//
//  ViewController.m
//  FinalStarRatingBarDemo
//
//  Created by Final on 14-7-8.
//  Copyright (c) 2014年 FinalProject. All rights reserved.
//

#import "ViewController.h"
#import "FinalStarRatingBar.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    FinalStarRatingBar *bar = [[FinalStarRatingBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    FinalStarRatingBar *bar2 = [[FinalStarRatingBar alloc] initWithFrame:CGRectMake(0, 50, 320, 40) starCount:10];
    [self.view addSubview:bar];
    [self.view addSubview:bar2];
    [bar setRating:3];
    [bar setRatingChangedBlock:^(NSUInteger rating) {
        NSLog(@"rating:%d",rating);
    }];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
