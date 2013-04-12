//
//  ViewController.m
//  DMXDip
//
//  Created by Clément Raussin on 12/04/13.
//  Copyright (c) 2013 Clément Raussin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    dip = [[DMXDip alloc] initWithNibName:@"DMXDip" bundle:nil];
    [self.view addSubview:dip.view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getAddressButton:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Address DMX :" message:[NSString stringWithFormat:@"%i", dip.address] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert show];
}
@end
