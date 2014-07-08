//
//  FinalStarRatingBar.h
//  FinalStarRatingBarDemo
//
//  Created by Final on 14-7-8.
//  Copyright (c) 2014年 FinalProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinalStarRatingBar : UIControl
@property (nonatomic) NSUInteger rating;
@property (nonatomic,weak) void (^ratingChangedBlock)(NSUInteger rating);
-(id)initWithFrame:(CGRect)frame;
-(id)initWithFrame:(CGRect)frame starCount:(NSUInteger)count;
@end
