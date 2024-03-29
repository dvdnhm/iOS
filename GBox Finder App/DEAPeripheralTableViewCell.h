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

#import <UIKit/UIKit.h>
#import "SerialGATT.h"

@class YMSCBPeripheral;
@class YMSCBCharacteristic;
@class CBPeripheral;
@class DEABaseButton;


@interface DEAPeripheralTableViewCell : UITableViewCell
{


    
    
    IBOutlet UIButton *connectButton;
   
    
    NSTimer *BuzzOnTimer, *BuzzOffTimer;
  

}

@property (weak, nonatomic) YMSCBPeripheral *yperipheral;
@property (strong, nonatomic) YMSCBCharacteristic *sensor;

        
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *rssiLabel;
@property (strong, nonatomic) IBOutlet UILabel *signalLabel;

@property (strong, nonatomic) IBOutlet UILabel *dbLabel;
@property (strong, nonatomic) IBOutlet UILabel *peripheralStatusLabel;
@property (strong, nonatomic) IBOutlet UIImageView *peripheralIcon;
@property (strong, nonatomic) IBOutlet UIImageView *signalIcon;
@property (strong, nonatomic) IBOutlet UIImageView *peripheralStatusIcon;
@property (strong, nonatomic) IBOutlet UIImageView *buzzerStatusIcon;

@property (strong, nonatomic) IBOutlet UIProgressView *distanceProgress;

@property (strong, nonatomic) IBOutlet UISlider *distanceSlider;




- (IBAction)connectButtonAction:(id)sender;


- (void)configureWithPeripheral:(YMSCBPeripheral *)yp;

- (void)updateDisplay;







@end
