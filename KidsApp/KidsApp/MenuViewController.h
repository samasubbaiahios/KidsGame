//
//  MenuViewController.h
//  KidsApp
//
//  Created by Ajr on 10/8/14.
//  Copyright (c) 2014 Xenvoice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *alphabetScreenBtn;

@property (weak, nonatomic) IBOutlet UIButton *numericalsScreenBtn;
- (IBAction)alphabetButton:(id)sender;
- (IBAction)numericalsButton:(id)sender;
@end
