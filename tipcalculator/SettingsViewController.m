//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Lucas Welti on 6/4/14.
//  Copyright (c) 2014 Yahoo!. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *TipSettingsControl;

- (IBAction)onTap:(id)sender;
- (void) updateSettings;

- (void) getSettings;

@end

@implementation SettingsViewController

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
    [self getSettings];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    
    NSLog(@"going to update settings");
    [self updateSettings];
}

- (void) updateSettings {
    
    NSLog(@"In Update Settings");

    
    NSArray *tipValues = @[@(0),@(1),@(2)];
    
    int tipIndex = [tipValues[self.TipSettingsControl.selectedSegmentIndex] intValue];
    NSLog(@"%d",tipIndex);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:tipIndex forKey:@"t_n_index"];
    [defaults synchronize];
    
    
    
}

- (void) getSettings {
    
    NSLog(@"Loading settings");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int IntValue = [defaults floatForKey:@"t_n_index"] ? [defaults floatForKey:@"t_n_index"] : 0;
    
    NSLog(@"%d",IntValue);
    
    self.TipSettingsControl.selectedSegmentIndex = IntValue;


}
@end
