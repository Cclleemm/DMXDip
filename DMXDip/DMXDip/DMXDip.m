//
//  DMXDip.m
//  DMXDip
//
//  Created by Clément Raussin on 12/04/13.
//  Copyright (c) 2013 Clément Raussin. All rights reserved.
//

#import "DMXDip.h"


@interface DMXDip ()


@end


@implementation DMXDip

@synthesize address;

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
    address = 0;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dipTouched:(id)sender {
    UIButton * dip = (UIButton*) sender;
    [dip setSelected:!dip.selected];
    [self updateBinary];
}

-(void)updateBinary
{
    address = 0;
    for(int i=1;i<10;i++)
    {
        UIButton *dip = (UIButton *)[self.view viewWithTag:i];
        
        if (dip.selected) {
            int add = pow(2,i-1);
            address+=add;
        }
    }
_addressLabel.text=[NSString stringWithFormat:@"%i", address];

}


#define MAX_LENGTH 3 // Whatever your limit is
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    NSUInteger newLength = (textField.text.length - range.length) + string.length;
    
    if(newLength <= MAX_LENGTH)
    {
        return YES;
    } else {
        NSUInteger emptySpace = MAX_LENGTH - (textField.text.length - range.length);
        textField.text = [[[textField.text substringToIndex:range.location]
                          stringByAppendingString:[string substringToIndex:emptySpace]]
                         stringByAppendingString:[textField.text substringFromIndex:(range.location + range.length)]];
        return NO;
    }
}


- (IBAction)decimalValueChanged:(id)sender {
    
    if([_addressLabel.text integerValue]>511)
        _addressLabel.text = [NSString stringWithFormat:@"511"];
    
    address = [_addressLabel.text integerValue];
    int last = address;
    for(int i=1; i<10; i++)
    {
        UIButton *dip = (UIButton *)[self.view viewWithTag:i];
        if(last % 2 == 1)
        {
            [dip setSelected:YES];
        }else{
            [dip setSelected:NO];
        }
        last = last/2;
    }
}
@end
