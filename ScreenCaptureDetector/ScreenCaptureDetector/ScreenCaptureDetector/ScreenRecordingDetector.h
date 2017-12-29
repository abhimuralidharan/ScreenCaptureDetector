//
//  ScreenRecordingDetector.h
//  ScreenCaptureDetector
//
//  Created by Abhilash on 29/12/17.
//  Copyright © 2017 Abhilash. All rights reserved.
//

/*
ScreenRecordingDetector checks for screen capturing as well as airplay mirroring
*/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString *kScreenRecordingDetectorRecordingStatusChangedNotification;

@interface ScreenRecordingDetector : NSObject

+(instancetype)sharedInstance;
+ (void)triggerDetectorTimer;
+ (void)stopDetectorTimer;
- (BOOL)isRecording;

@end
