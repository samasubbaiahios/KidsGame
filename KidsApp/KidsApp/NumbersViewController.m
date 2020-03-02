//
//  NumbersViewController.m
//  KidsApp
//
//  Created by Ajr on 10/8/14.
//  Copyright (c) 2014 Xenvoice. All rights reserved.
//

#import "NumbersViewController.h"
#import "NumberDetailViewController.h"

@interface NumbersViewController ()

@end

@implementation NumbersViewController

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
    
    _numbersArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"1.png"], [UIImage imageNamed:@"2.png"], [UIImage imageNamed:@"3.png"], [UIImage imageNamed:@"4.png"], [UIImage imageNamed:@"5.png"], [UIImage imageNamed:@"6.png"], [UIImage imageNamed:@"7.png"], [UIImage imageNamed:@"8.png"], [UIImage imageNamed:@"9.png"], [UIImage imageNamed:@"10.png"], nil];

    [self.scrollView setContentSize:CGSizeMake(self.numbersArray.count * self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setDelegate:self];
 
    [self.pageController setNumberOfPages:self.numbersArray.count];
	[self.pageController addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
    for (_position = 0; _position < self.numbersArray.count; _position++)
    {
 
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(_position * self.scrollView.frame.size.width, 10, self.scrollView.frame.size.width, self.scrollView.frame.size.height - 30)];
 
        [image setImage:[self.numbersArray objectAtIndex:_position]];
        image.contentMode = UIViewContentModeScaleToFill;
        
        [self.scrollView addSubview:image];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextView:)];
        tap.numberOfTapsRequired = 1;
        [image setUserInteractionEnabled:YES];
        tap.cancelsTouchesInView=YES;
        [image addGestureRecognizer:tap];

}
/*
    [_numberBtn setImage:[_numbersArray objectAtIndex:_position] forState:UIControlStateNormal];
    [_numberBtn addTarget:self action:@selector(nextView:) forControlEvents:UIControlEventTouchUpInside];
    

    
    [_rightArrow setImage:[UIImage imageNamed:@"arrowright.png"] forState:UIControlStateNormal];
    [_rightArrow addTarget:self action:@selector(rightArrowButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_rightArrow];
    
    [_leftArrow setImage:[UIImage imageNamed:@"arrowleft.png"] forState:UIControlStateNormal];
    [_leftArrow addTarget:self action:@selector(leftArrowButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_leftArrow];
    
    
    //    [_alphabetPage sendAction:@selector(rightArrowButtonAction:) to:nil forEvent:normal];
    
    _leftArrow.hidden = YES;
*/
    
}

#pragma mark -UIScrollView-
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView)
    {
        CGPoint point = scrollView.contentOffset;
        self.pageController.currentPage = point.x/scrollView.frame.size.width;
//        NSLog(@"%d",self.pageController.currentPage);

    }
}

#pragma mark -UIPageControl-
-(void)pageTurn:(UIPageControl *)aPageControl
{
    _position = self.pageController.currentPage;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.5];
	[self.scrollView setContentOffset:CGPointMake(_position *self.scrollView.frame.size.width, 0)];
	[UIView commitAnimations];
}

- (void)nextView:(id)sender
{
    
    NumberDetailViewController *wVC = [[NumberDetailViewController alloc] initWithNibName:@"NumberDetailViewController" bundle:nil];
    wVC.position = self.pageController.currentPage;
//    NSLog(@"%d",wVC.position);
    //    [self.navigationController presentViewController:wVC animated:YES completion:NULL];
    [UIView animateWithDuration:0.7
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [self.navigationController pushViewController:wVC animated:NO];
                         [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:NO];
                     }];
    
}

/*
- (void)rightArrowButtonAction:(id)sender
{
//    NSLog(@"%d",__FUNCTION__);

    if (_position == 9)
    {
        _rightArrow.hidden = YES;
        return;
    }
    else
    {
        _leftArrow.hidden = NO;
        _rightArrow.hidden = NO;
    }
    
    _position = _position+1;
    [_numberBtn setImage:[_numbersArray objectAtIndex:_position] forState:UIControlStateNormal];
//    _numberImage.image = [_numbersArray objectAtIndex:_position];

    
}

- (void)leftArrowButtonAction:(id)sender
{
    
    if (_position == 0)
    {
        _leftArrow.hidden = YES;
        return;
    }
    else
    {
        _rightArrow.hidden = NO;
        _leftArrow.hidden = NO;
    }
    _position = _position-1;

    [_numberBtn setImage:[_numbersArray objectAtIndex:_position] forState:UIControlStateNormal];
    
//    _numberImage.image = [_numbersArray objectAtIndex:_position];
    
}
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)homeBtn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
