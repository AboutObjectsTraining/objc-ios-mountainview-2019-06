// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewCell.h"

UIEdgeInsets CLNTextInsets = {
    .top = 7,
    .bottom = 8,
    .left = 12,
    .right = 12
};

CGPoint CLNTextOrigin = { .x = 12, .y = 7 };

@interface CLNCoolViewCell ()

@property (assign, nonatomic) BOOL highlighted;
@property (class, readonly, nonatomic) NSDictionary<NSAttributedStringKey, id> *defaultTextAttributes;

@end


@implementation CLNCoolViewCell

+ (NSDictionary<NSAttributedStringKey,id> *)defaultTextAttributes {
    return @{ NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
              NSForegroundColorAttributeName : UIColor.whiteColor };
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

// MARK: - Drawing and resizing

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [self.text sizeWithAttributes:self.class.defaultTextAttributes];
    newSize.width += CLNTextInsets.left + CLNTextInsets.right;
    newSize.height += CLNTextInsets.top + CLNTextInsets.bottom;
    return newSize;
}

- (void)drawRect:(CGRect)rect {
    [self.text drawAtPoint:CLNTextOrigin withAttributes:self.class.defaultTextAttributes];
}

@end


// MARK: - UIResponder methods
@implementation CLNCoolViewCell (RespondingToTouches)

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    self.highlighted = true;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    
    CGFloat dx = currLocation.x - prevLocation.x;
    CGFloat dy = currLocation.y - prevLocation.y;
    self.frame = CGRectOffset(self.frame, dx, dy);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = false;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = false;
}

@end
