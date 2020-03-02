//
//  AlphabetsViewController.h
//  KidsApp
//
//  Created by Ajr on 10/8/14.
//  Copyright (c) 2014 Xenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlphabetsViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, assign) NSUInteger position;

@property (weak, nonatomic) IBOutlet UIImageView *bg;
@property (nonatomic, strong) NSArray *alphabetArray;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;

- (IBAction)returnButton:(id)sender;
@end
