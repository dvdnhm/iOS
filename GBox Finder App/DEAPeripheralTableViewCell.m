// 
// Copyright 2013-2014 Yummy Melon Software LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//  Author: Charles Y. Choi <charles.choi@yummymelon.com>
//

#import <CoreBluetooth/CoreBluetooth.h>
#import <AudioToolbox/AudioToolbox.h>
#import "DEAPeripheralTableViewCell.h"
#import "YMSCBPeripheral.h"
#import "YMSCBCharacteristic.h"
#import "DEASensorTag.h"
#import "DEACentralManager.h"
#import "DEATheme.h"
#import "SerialGATT.h"

@implementation DEAPeripheralTableViewCell
{

    NSString *value;
}

@synthesize sensor;

@synthesize nameLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.sensor = [[YMSCBCharacteristic alloc]init];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)connectButtonAction:(id)sender {
    
    if (self.yperipheral.isConnected) {
        [self->connectButton setTitle:@"CANCELLING…" forState:UIControlStateNormal];
        self.peripheralStatusLabel.text = @"Not In Range";
        [self.peripheralStatusLabel setTextColor:[[DEATheme sharedTheme] bodyTextColor]];
        self.peripheralStatusIcon.image = [UIImage imageNamed:@"iconStatusAdvertising"];
        self.rssiLabel.text = @"—";
        [self.yperipheral disconnect];
        
    } else {
        [self->connectButton setTitle:@"PAIRING…" forState:UIControlStateNormal];
        self.peripheralStatusLabel.text = @"PAIRING…";
        [self.peripheralStatusLabel setTextColor:[[DEATheme sharedTheme] pairingColor]];
        self.peripheralStatusIcon.image = [UIImage imageNamed:@"iconStatusPairing"];
        [self.yperipheral connect];
        }
}



- (void)configureWithPeripheral:(YMSCBPeripheral *)yp {
    self.yperipheral = yp;
    [self updateDisplay];
}


- (void)updateDisplay {
    
    
    
    NSString *buttonLabel;
    
    if (self.yperipheral.name) {
        self.nameLabel.text = self.yperipheral.name;
    } else {
        self.nameLabel.text = @"Undisclosed Name";
    }

    
    if (self.yperipheral) //([self.yperipheral isKindOfClass:[DEASensorTag class]])
    
    
    {
        
        //self.peripheralIcon.image = [UIImage imageNamed:@"gboxicon"];
        
        if (self.yperipheral.isConnected)
        {
           
            
            buttonLabel = @"Disconnect";
            self.peripheralStatusLabel.text = @"CONNECTED";
            [self.peripheralStatusLabel setTextColor:[[DEATheme sharedTheme] connectedColor]];
            self.peripheralStatusIcon.image = [UIImage imageNamed:@"iconStatusConnected"];
            self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
            [self->connectButton setTitle:buttonLabel forState:UIControlStateNormal];
            self->connectButton.titleLabel.text = buttonLabel;
            
        }
        else {
            
          
            
            buttonLabel = @"Connect";
            self.peripheralStatusLabel.text = @"Not In Range";
            [self.peripheralStatusLabel setTextColor:[[DEATheme sharedTheme] bodyTextColor]];
            self.peripheralStatusIcon.image = [UIImage imageNamed:@"iconStatusAdvertising"];
            //self.accessoryType = UITableViewCellAccessoryNone;
            self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
            [self->connectButton setTitle:buttonLabel forState:UIControlStateNormal];
            
            //self.rssiLabel.text = @"—";
            
        }
        

    }
    
    else
    {
        //self.peripheralIcon.image = [UIImage imageNamed:@"iconGenericBLE"];
        self->connectButton.hidden = YES;
        self.accessoryType = UITableViewCellAccessoryNone;
    }
        

}


/*
- (IBAction)buzzerButton:(id)sender {
 
    if (buzzerButton.on) {
 
        
        
        self.buzzerStatusIcon.image = [UIImage imageNamed:@"iconBeepOn"];
        
        NSData *beepon = [@"AT+PIO21" dataUsingEncoding:[NSString defaultCStringEncoding]];
        
        
        [self.sensor writeValue:beepon withBlock:nil];
        
        
    }
    
    else
    {
        self.buzzerStatusIcon.image = [UIImage imageNamed:@"iconBeepOff"];
        
        NSData *beepoff = [@"AT+PIO20" dataUsingEncoding:[NSString defaultCStringEncoding]];
        
        [self.sensor writeValue:beepoff withBlock:nil];
        
    }
    
}
*/

@end
