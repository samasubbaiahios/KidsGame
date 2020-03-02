//
//  AlphabetDetailViewController.m
//  KidsApp
//
//  Created by Ajr on 10/8/14.
//  Copyright (c) 2014 Xenvoice. All rights reserved.
//

#import "AlphabetDetailViewController.h"

@interface AlphabetDetailViewController ()

@end

@implementation AlphabetDetailViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _wordImagesArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"APPLE.png"],
                        [UIImage imageNamed:@"BOY.png"], [UIImage imageNamed:@"CAT.png"],
                        [UIImage imageNamed:@"DOG.png"], [UIImage imageNamed:@"ELEPHANT.png"],
                        [UIImage imageNamed:@"FOX.png"], [UIImage imageNamed:@"GOAT.png"],
                        [UIImage imageNamed:@"HORSE.png"], [UIImage imageNamed:@"ICECREAM.png"],
                        [UIImage imageNamed:@"JAM.png"], [UIImage imageNamed:@"KITE.png"],
                        [UIImage imageNamed:@"LION.png"], [UIImage imageNamed:@"MONKEY.png"],
                        [UIImage imageNamed:@"NEST.png"], [UIImage imageNamed:@"OWL.png"],
                        [UIImage imageNamed:@"Pen.png"], [UIImage imageNamed:@"QUEEN.png"],
                        [UIImage imageNamed:@"RABBIT.png"], [UIImage imageNamed:@"SUN.png"],
                        [UIImage imageNamed:@"TIGER.png"], [UIImage imageNamed:@"UMBRELLA.png"],
                        [UIImage imageNamed:@"VAN.png"], [UIImage imageNamed:@"WHEEL.png"],
                        [UIImage imageNamed:@"XMAS.png"], [UIImage imageNamed:@"YAK.png"],
                        [UIImage imageNamed:@"ZEBRA.png"], nil];
    
    _imagePosition = _position;
    _wordImageView.image = [_wordImagesArray objectAtIndex:_imagePosition];
    [self.view addSubview:_wordImageView];

//        _soundsArray = [[NSArray alloc] initWithObjects:@"galaxy_s3_sms_tone",@"galaxy_s3_sms_tone",@"galaxy_s3_sms_tone", nil];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.8f * NSEC_PER_SEC),
                   dispatch_get_main_queue(), ^{
                       
                       [self playSound];
                   });
    
}

-(void)playSound
{

//            NSString *path = [[NSBundle mainBundle] pathForResource:[_soundsArray objectAtIndex:_position] ofType:@"mp3"];
//            NSURL *url = [NSURL fileURLWithPath:path];
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"galaxy_s3_sms_tone" ofType:@"mp3"]];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    _audioPlayer.delegate = self;
    [_audioPlayer play];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -AudioPLayer-

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag;
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0f * NSEC_PER_SEC),
                   dispatch_get_main_queue(), ^{

    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];

                         [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:NO];
                     }];
    [self.navigationController popViewControllerAnimated:YES];
});
    
}

-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    NSLog(@"Error: %@",[error localizedDescription]);
}

-(void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
    NSLog(@"Audio file playing is begin interrupted");
}

-(void)audioPlayerEndInterruption:(AVAudioPlayer *)player
{
    NSLog(@"Audio file playing is begin interrupted");
}

@end