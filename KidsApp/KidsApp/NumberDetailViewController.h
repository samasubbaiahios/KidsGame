//
//  NumberDetailViewController.h
//  KidsApp
//
//  Created by Ajr on 10/18/14.
//  Copyright (c) 2014 Xenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface NumberDetailViewController : UIViewController <AVAudioPlayerDelegate>

@property (nonatomic, assign) NSUInteger imagePosition;
@property (nonatomic, assign) NSUInteger position;
@property (nonatomic, strong) NSArray *numbersImagesArray;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) NSArray *soundsArray;
@property (strong, nonatomic) IBOutlet UIImageView *numbersImg;

@end
