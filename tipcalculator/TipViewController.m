//
//  TipViewController.m
//  tipcalculator
//
//  Created by Lucas Welti on 6/4/14.
//  Copyright (c) 2014 Yahoo!. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *BillTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void) updatevalues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updatevalues];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    
    [self.view endEditing:YES];
    [self updatevalues];
}

- (void) updatevalues {
    float billAmount = [self.BillTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.1),@(0.15),@(0.20)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f",tipAmount];
    self.totalLabel.text =[NSString stringWithFormat:@"$%0.2f",totalAmount];
    
    
}
@end
