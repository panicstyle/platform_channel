//
//  AboutView.m
//  Runner
//
//  Created by dykim on 2022/02/17.
//  Copyright © 2022 The Flutter Authors. All rights reserved.
//

#import "AboutView.h"

@implementation AboutView
@synthesize textView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *msgAbout;
    
    // Do any additional setup after loading the view from its nib.
    NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
//    NSString *version = [infoDict objectForKey:@"CFBundleShortVersionString"];
    NSString *version = [infoDict objectForKey:@"CFBundleShortVersionString"];
    
    msgAbout = [NSString stringWithFormat:@"무지개교육마을앱 for iOS\n버전 : %@\n개발자 : 호랑이\n문의메일 : panicstyle@gmail.com\n지원 페이지 : https://github.com/panicstyle/iMoojigae/wiki",  version];
    textView.text = msgAbout;
    
}

- (IBAction)yesAction:(id)sender
{
    if (self.delegate != nil)
        if ([self.delegate respondsToSelector:@selector(aboutLevel:level:)] == YES)
            [self.delegate aboutLevel:self level:@"YES"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)noAction:(id)sender
{
    if (self.delegate != nil)
        if ([self.delegate respondsToSelector:@selector(aboutLevel:level:)] == YES)
            [self.delegate aboutLevel:self level:@"NO"];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
