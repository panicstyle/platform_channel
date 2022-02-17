// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import "AppDelegate.h"
#import <Flutter/Flutter.h>
#import "GeneratedPluginRegistrant.h"
#import "AboutView.h"

@interface AppDelegate () <AboutViewDelegate>
@end

@implementation AppDelegate {
    FlutterEventSink _eventSink;
    FlutterResult _result;
}

- (BOOL)application:(UIApplication*)application
    didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  FlutterViewController* controller =
      (FlutterViewController*)self.window.rootViewController;

  FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
      methodChannelWithName:@"samples.flutter.io/about"
            binaryMessenger:controller];
  __weak typeof(self) weakSelf = self;
  [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call,
                                         FlutterResult result) {
    if ([@"aboutLevel" isEqualToString:call.method]) {
/*
      int batteryLevel = [weakSelf getBatteryLevel];
      if (batteryLevel == -1) {
        result([FlutterError errorWithCode:@"UNAVAILABLE"
                                   message:@"Battery info unavailable"
                                   details:nil]);
      } else {
        result(@(batteryLevel));
      }
 */
        _result = result;
        [weakSelf showAboutView];
    } else {
      result(FlutterMethodNotImplemented);
    }
  }];

  FlutterEventChannel* chargingChannel = [FlutterEventChannel
      eventChannelWithName:@"samples.flutter.io/charging"
           binaryMessenger:controller];
  [chargingChannel setStreamHandler:self];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)showAboutView {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:NULL];
    
    AboutView *viewController = (AboutView*)[storyboard instantiateViewControllerWithIdentifier:@"AboutView"];
    if (viewController != nil) {
    } else {
        return;
    }
    viewController.delegate = self;
    
    FlutterViewController* controller =
        (FlutterViewController*)self.window.rootViewController;
    [controller presentViewController:viewController animated:YES completion:nil];
}

#pragma mark -
#pragma mark AboutViewDelegate

- (void)aboutLevel:(AboutView *)aboutView level:(NSString *)level
{
    _result(level);
}

@end
