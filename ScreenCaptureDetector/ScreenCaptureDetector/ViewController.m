//
//  ViewController.m
//  ScreenCaptureDetector
//
//  Created by Apple on 29/12/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)setupView {
    if ([[ScreenRecordingDetector sharedInstance] isRecording]) {
        _mainView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.7];
        _recordingStatusLabel.text = @"Recording status: YES";
    } else {
        _mainView.backgroundColor = [UIColor yellowColor];
        _recordingStatusLabel.text = @"Recording status: NO";

    }
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupView];

    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(appDidBecomeActive)
                                                name:UIApplicationDidBecomeActiveNotification
                                              object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(applicationWillResignActive)
                                                name:UIApplicationWillResignActiveNotification
                                              object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(screenCaptureStatusChanged)
                                                 name:kScreenRecordingDetectorRecordingStatusChangedNotification
                                               object:nil];
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kScreenRecordingDetectorRecordingStatusChangedNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationDidBecomeActiveNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationWillResignActiveNotification
                                                  object:nil];
}

-(void)appDidBecomeActive {
    [ScreenRecordingDetector triggerDetectorTimer];
}
-(void)applicationWillResignActive {
    [ScreenRecordingDetector stopDetectorTimer];
}
-(void)screenCaptureStatusChanged {
    [self setupView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
