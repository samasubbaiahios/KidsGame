//
//  AlphabetsViewController.m
//  KidsApp
//
//  Created by Ajr on 10/8/14.
//  Copyright (c) 2014 Xenvoice. All rights reserved.
//

#import "AlphabetsViewController.h"
#import "AlphabetDetailViewController.h"

@interface AlphabetsViewController ()

@end

@implementation AlphabetsViewController

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
    
//    [_bg setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
//    [self.view addSubview:_bg];

    _alphabetArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"a.png"],
                      [UIImage imageNamed:@"b.png"], [UIImage imageNamed:@"c.png"],
                      [UIImage imageNamed:@"d.png"], [UIImage imageNamed:@"e.png"],
                      [UIImage imageNamed:@"f.png"], [UIImage imageNamed:@"g.png"],
                      [UIImage imageNamed:@"h.png"], [UIImage imageNamed:@"i.png"],
                      [UIImage imageNamed:@"j.png"], [UIImage imageNamed:@"k.png"],
                      [UIImage imageNamed:@"l.png"], [UIImage imageNamed:@"m.png"],
                      [UIImage imageNamed:@"n.png"], [UIImage imageNamed:@"o.png"],
                      [UIImage imageNamed:@"p.png"], [UIImage imageNamed:@"q.png"],
                      [UIImage imageNamed:@"r.png"], [UIImage imageNamed:@"s.png"],
                      [UIImage imageNamed:@"t.png"], [UIImage imageNamed:@"u.png"],
                      [UIImage imageNamed:@"v.png"], [UIImage imageNamed:@"w.png"],
                      [UIImage imageNamed:@"x.png"], [UIImage imageNamed:@"y.png"],
                      [UIImage imageNamed:@"z.png"], nil];
    
    [self.scrollView setContentSize:CGSizeMake(self.alphabetArray.count * self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setDelegate:self];
    
    [self.pageController setNumberOfPages:self.alphabetArray.count];
	[self.pageController addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
    
    for (_position = 0; _position < self.alphabetArray.count; _position++)
    {
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(_position * self.scrollView.frame.size.width, 10, self.scrollView.frame.size.width, self.scrollView.frame.size.height - 30)];
        
        [image setImage:[self.alphabetArray objectAtIndex:_position]];
        image.contentMode = UIViewContentModeScaleToFill;
        
        [self.scrollView addSubview:image];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextView:)];
        tap.numberOfTapsRequired = 1;
        [image setUserInteractionEnabled:YES];
        tap.cancelsTouchesInView=YES;
        [image addGestureRecognizer:tap];
        
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    AlphabetDetailViewController *wVC = [[AlphabetDetailViewController alloc] initWithNibName:@"AlphabetDetailViewController" bundle:nil];
    wVC.position = self.pageController.currentPage;
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
    
    if (_position == 25)
    {
        _rightButton.hidden = YES;
        return;
    }
    else
    {
        _leftButton.hidden = NO;
        _rightButton.hidden = NO;
    }
    
    _position = _position+1;
    [_alphabetImageBtn setImage:[_alphabetArray objectAtIndex:_position] forState:UIControlStateNormal];
    
    //    _alphabetImageView.image = [alphabetArray objectAtIndex:position];
    
}

- (void)leftArrowButtonAction:(id)sender
{
    
    if (_position == 0)
    {
        _leftButton.hidden = YES;
        return;
    }
    else
    {
        _rightButton.hidden = NO;
        _leftButton.hidden = NO;
    }
    
    _position = _position-1;
    [_alphabetImageBtn setImage:[_alphabetArray objectAtIndex:_position] forState:UIControlStateNormal];
    
    //    _alphabetImageView.image = [alphabetArray objectAtIndex:position];
    
}
*/
- (IBAction)returnButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
