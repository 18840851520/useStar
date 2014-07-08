//
//  FinalStarRatingBar.m
//  FinalStarRatingBarDemo
//
//  Created by Final on 14-7-8.
//  Copyright (c) 2014年 FinalProject. All rights reserved.
//

#import "FinalStarRatingBar.h"
const NSUInteger DEFAULT_STAR_COUNT = 5;
@interface FinalStarRatingBar()
@property (nonatomic,strong) NSMutableArray *stars;
-(void)initWithStarCount:(NSUInteger)count;
-(BOOL)touch:(UITouch*)touch inStar:(UIImageView*)star;
@end
@implementation FinalStarRatingBar
-(void)setRating:(NSUInteger)rating
{
    if (_rating != rating) {
        _rating = MIN(rating, self.stars.count);
        if (self.ratingChangedBlock) {
            self.ratingChangedBlock(_rating);
        }
        [self.stars enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [obj setHighlighted:(idx < rating)];
        }];
    }
}

-(void)initWithStarCount:(NSUInteger)count
{
    self.stars = [NSMutableArray array];
    for (NSUInteger idx = 0; idx < count; ++idx) {
        UIImageView *star = [UIImageView new];
        star.image = [UIImage imageNamed:@"FinalStarRatingBar.bundle/star"];
        star.highlightedImage = [UIImage imageNamed:@"FinalStarRatingBar.bundle/star_highlighted"];
        star.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:star];
        [self.stars addObject:star];
    }
}

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initWithStarCount:DEFAULT_STAR_COUNT];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initWithStarCount:DEFAULT_STAR_COUNT];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame starCount:(NSUInteger)count
{
    if (self = [super initWithFrame:frame]) {
        [self initWithStarCount:count];
    }
    return self;
}

-(void)layoutSubviews
{
    const CGFloat BAR_WIDTH = CGRectGetWidth(self.frame);
    const CGFloat BAR_HEIGHT = CGRectGetHeight(self.frame);
    const CGFloat STAR_WIDTH = BAR_WIDTH / self.stars.count;
    [self.stars enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj setFrame:CGRectMake(idx * STAR_WIDTH, 0, STAR_WIDTH, BAR_HEIGHT)];
    }];
}

-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    __block FinalStarRatingBar *blockSelf = self;
    [self.stars enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([blockSelf touch:touch inStar:obj]) {
            self.rating = idx + 1;
            *stop = YES;
        }
    }];
    return YES;
}

-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    __block FinalStarRatingBar *blockSelf = self;
    [self.stars enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([blockSelf touch:touch inStar:obj]) {
            self.rating = idx + 1;
            *stop = YES;
        }
    }];
    return YES;
}

#pragma mark - Private Method
-(BOOL)touch:(UITouch *)touch inStar:(UIImageView *)star
{
    
    CGPoint pt = [touch locationInView:self];
    return CGRectContainsPoint(star.frame, pt);
}
@end
