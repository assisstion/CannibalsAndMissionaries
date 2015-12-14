//
//  CannibalMissionaryState.h
//  CannibalsAndMissionaries
//
//  Created by Markus Feng on 12/14/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CannibalMissionaryState : NSObject

@property int leftCannibal;
@property int leftMissionary;
@property int leftBoat;
@property int rightCannibal;
@property int rightMissionary;
@property int rightBoat;

-(NSString *)stringRepresentation;
-(CannibalMissionaryState *)modifyFromLeft:(bool)left missionaries:(int)changeMissionary cannibals:(int)changeCannibals;

@end
