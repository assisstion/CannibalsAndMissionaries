//
//  main.m
//  CannibalsAndMissionaries
//
//  Created by Markus Feng on 12/14/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CannibalsAndMissionaries.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        int cannibals;
        int missionaries;
        
        printf("Cannibals: ");
        scanf("%i", &cannibals);
        
        printf("Missionaries: ");
        scanf("%i", &missionaries);
        
        CannibalsAndMissionaries * candm = [[CannibalsAndMissionaries alloc] init];
        CannibalMissionaryState * start = [[CannibalMissionaryState alloc] init];
        start.leftBoat = 2;
        start.leftCannibal = cannibals;
        start.leftMissionary = missionaries;
        CannibalMissionaryState * end =[[CannibalMissionaryState alloc] init];
        end.rightBoat = 2;
        end.rightCannibal = cannibals;
        end.rightMissionary = missionaries;
        NSArray <NSString *> * solution = [candm getSolution:start toTarget:end boatSize:2];
        if(solution == nil){
            NSLog(@"No solution exists!");
        }
        else{
            NSLog(@"Output format: Left Cannibals - Left Missionaries - Left Boats - Right Cannibals - Right Missionaries - Right Boats");
            for(NSString * str in solution){
                NSLog(@"%@", str);
            }
        }
    }
    return 0;
}
