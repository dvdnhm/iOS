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
#import <AVFoundation/AVFoundation.h>
#import "DEACentralManager.h"
#import "DEABaseViewController.h"
#import "SerialGATT.h"
#import "YMSCBCharacteristic.h"


@class DEAPeripheralTableViewCell;
@class YMSCBCharacteristic;



/**
 View Controller for listing of Bluetooth LE Peripherals available.
 */
@interface DEAPeripheralsViewController : DEABaseViewController <UITableViewDataSource, UITableViewDelegate, CBPeripheralDelegate,BTSmartSensorDelegate>

{

    IBOutlet UIButton *Back;
    
 
}


/** @name Properties */
/// TableViewCell for a connectable peripheral.
@property (strong, nonatomic) IBOutlet DEAPeripheralTableViewCell *tvCell;

/// TableView for found peripherals
@property (strong, nonatomic) IBOutlet UITableView *peripheralsTableView;

/// Button to enable Bluetooth scanner
@property (strong, nonatomic) IBOutlet UIBarButtonItem *scanButton;
@property (strong, nonatomic) IBOutlet UIButton *editButton;
- (IBAction)editButtonAction:(id)sender;
- (IBAction)Back:(id)sender;


@end
