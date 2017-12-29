//
//  ViewController.h
//  ScreenCaptureDetector
//
//  Created by Apple on 29/12/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScreenRecordingDetector.h"
@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *recordingStatusLabel;
@end

