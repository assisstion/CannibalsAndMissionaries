//
//  CannibalMissionaryState.m
//  CannibalsAndMissionaries
//
//  Created by Markus Feng on 12/14/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import "CannibalMissionaryState.h"

@implementation CannibalMissionaryState

-(NSString *)stringRepresentation{
    return [NSString stringWithFormat:@"%i-%i-%i-%i-%i-%i", self.leftCannibal, self.leftMissionary, self.leftBoat,
            self.rightCannibal, self.rightMissionary, self.rightBoat];
}

-(CannibalMissionaryState *)modifyFromLeft:(bool)left missionaries:(int)changeMissionary cannibals:(int)changeCannibals{
    if(left){
        if(self.leftBoat == 0 || changeCannibals > self.leftCannibal || changeMissionary > self.leftMissionary){
            return nil;
        }
        CannibalMissionaryState * newState = [[CannibalMissionaryState alloc] init];
        newState.leftBoat = self.leftBoat - 1;
        newState.rightBoat = self.rightBoat + 1;
        newState.leftCannibal = self.leftCannibal - changeCannibals;
        newState.rightCannibal = self.rightCannibal + changeCannibals;
        newState.leftMissionary = self.leftMissionary - changeMissionary;
        newState.rightMissionary = self.rightMissionary + changeMissionary;
        if(![newState validState]){
            return nil;
        }
        return newState;
    }
    else{
        if(self.rightBoat == 0 || changeCannibals > self.rightCannibal || changeMissionary > self.rightMissionary){
            return nil;
        }
        CannibalMissionaryState * newState = [[CannibalMissionaryState alloc] init];
        newState.leftBoat = self.leftBoat + 1;
        newState.rightBoat = self.rightBoat - 1;
        newState.leftCannibal = self.leftCannibal + changeCannibals;
        newState.rightCannibal = self.rightCannibal - changeCannibals;
        newState.leftMissionary = self.leftMissionary + changeMissionary;
        newState.rightMissionary = self.rightMissionary - changeMissionary;
        if(![newState validState]){
            return nil;
        }
        return newState;
    }
}

-(bool)validState{
    if((self.leftCannibal > self.leftMissionary && self.leftMissionary > 0) ||
       (self.rightCannibal > self.rightMissionary && self.rightMissionary > 0)){
        //NSLog(@"%@ is invalid!" , [self stringRepresentation]);
        return false;
    }
    return true;
}

@end
