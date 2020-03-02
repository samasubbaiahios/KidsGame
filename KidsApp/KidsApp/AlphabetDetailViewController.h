//
//  AlphabetDetailViewController.h
//  KidsApp
//
//  Created by Ajr on 10/8/14.
//  Copyright (c) 2014 Xenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AlphabetsViewController.h"

@interface AlphabetDetailViewController : UIViewController <AVAudioPlayerDelegate>

@property (nonatomic, assign) NSUInteger imagePosition;
@property (nonatomic, assign) NSUInteger position;
@property (nonatomic, strong) NSArray *wordImagesArray;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) NSArray *soundsArray;

@property (weak, nonatomic) IBOutlet UIImageView *wordImageView;

@end
