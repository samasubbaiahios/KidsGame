//
//  MenuViewController.m
//  KidsApp
//
//  Created by Ajr on 10/8/14.
//  Copyright (c) 2014 Xenvoice. All rights reserved.
//

#import "MenuViewController.h"
#import "AlphabetsViewController.h"
#import "NumbersViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

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
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alphabetButton:(id)sender
{
    AlphabetsViewController *alphabetVC = [[AlphabetsViewController alloc] initWithNibName:@"AlphabetsViewController" bundle:nil];
    
//    [UIView animateWithDuration:0.7
//                     animations:^{
//                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//                         [self.navigationController pushViewController:alphabetVC animated:NO];
//                         [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.navigationController.view cache:NO];
//                     }];

    [self.navigationController pushViewController:alphabetVC animated:YES];
}

- (IBAction)numericalsButton:(id)sender
{
    NumbersViewController *numbersVC = [[NumbersViewController alloc] initWithNibName:@"NumbersViewController" bundle:nil];
    [self.navigationController pushViewController:numbersVC animated:YES];
}
@end
