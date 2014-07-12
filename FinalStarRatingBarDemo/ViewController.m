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
    FinalStarRatingBar *bar = [[FinalStarRatingBar alloc] initWithFrame:CGRectMake(0, 40, 320, 40)];
    FinalStarRatingBar *bar2 = [[FinalStarRatingBar alloc] initWithFrame:CGRectMake(0, 90, 320, 40) starCount:10];
    [self.view addSubview:bar];
    [self.view addSubview:bar2];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 320, 20)];
    label.text = @"Current index for second bar";
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 320, 20)];
    label2.text = [NSString stringWithFormat:@"%d",bar2.rating];
    [self.view addSubview:label];
    [self.view addSubview:label2];
    [bar setRating:3];
    //using block
    [bar2 setRatingChangedBlock:^(NSUInteger rating) {
        dispatch_async(dispatch_get_main_queue(), ^{
            label2.text = [NSString stringWithFormat:@"%d",rating];
        });
    }];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
