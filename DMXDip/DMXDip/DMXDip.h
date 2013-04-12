//
//  DMXDip.h
//  DMXDip
//
//  Created by Clément Raussin on 12/04/13.
//  Copyright (c) 2013 Clément Raussin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMXDip : UIViewController

- (IBAction)dipTouched:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *addressLabel;
@property (nonatomic) int address;
- (IBAction)decimalValueChanged:(id)sender;

@end
