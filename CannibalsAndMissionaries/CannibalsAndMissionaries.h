//
//  CannibalsAndMissionaries.h
//  CannibalsAndMissionaries
//
//  Created by Markus Feng on 12/14/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CannibalMissionaryState.h"

@interface CannibalsAndMissionaries : NSObject

-(NSArray <NSString *> *) getSolution: (CannibalMissionaryState *) begin toTarget:(CannibalMissionaryState *)target
boatSize:(int)boatSize;

@end
