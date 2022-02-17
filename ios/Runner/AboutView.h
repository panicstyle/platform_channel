//
//  AboutView.h
//  Runner
//
//  Created by dykim on 2022/02/17.
//  Copyright © 2022 The Flutter Authors. All rights reserved.
//

#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@class AboutView;
@protocol AboutViewDelegate <NSObject>
@optional

- (void) aboutLevel:(AboutView *)aboutView level:(NSString *)level;

@end

@interface AboutView : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic, assign) id <AboutViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
