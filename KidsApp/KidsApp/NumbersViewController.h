//
//  NumbersViewController.h
//  KidsApp
//
//  Created by Ajr on 10/8/14.
//  Copyright (c) 2014 Xenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumbersViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, assign) NSUInteger position;
@property (nonatomic, strong) NSArray *numbersArray;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;

- (IBAction)homeBtn:(id)sender;
@end
