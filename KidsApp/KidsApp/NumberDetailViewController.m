//
//  NumberDetailViewController.m
//  KidsApp
//
//  Created by Ajr on 10/18/14.
//  Copyright (c) 2014 Xenvoice. All rights reserved.
//

#import "NumberDetailViewController.h"

@interface NumberDetailViewController ()

@end

@implementation NumberDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _numbersImagesArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"1.png"], [UIImage imageNamed:@"2.png"], [UIImage imageNamed:@"3.png"], [UIImage imageNamed:@"4.png"], [UIImage imageNamed:@"5.png"], [UIImage imageNamed:@"6.png"], [UIImage imageNamed:@"7.png"], [UIImage imageNamed:@"8.png"], [UIImage imageNamed:@"9.png"], [UIImage imageNamed:@"10.png"], nil];
    
    _imagePosition = _position;
    _numbersImg.image = [_numbersImagesArray objectAtIndex:_imagePosition];
    [self.view addSubview:_numbersImg];
    
    //        _soundsArray = [[NSArray alloc] initWithObjects:@"galaxy_s3_sms_tone",@"galaxy_s3_sms_tone",@"galaxy_s3_sms_tone", nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.8f * NSEC_PER_SEC),
                   dispatch_get_main_queue(), ^{
                       
                       [self playSound];
                   });

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
