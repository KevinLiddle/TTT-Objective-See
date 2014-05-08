//
//  Board.h
//  TTT
//
//  Created by Kevin Liddle on 5/7/14.
//  Copyright (c) 2014 wat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Board : NSObject

{
  NSInteger dimension;
  NSMutableArray *cells;
}

+(Board *) newWithDimension: (NSInteger) d;
-(Board *) initWithDimension: (NSInteger) d;

-(NSString *) getSpaceAtRow:(NSInteger) row column:(NSInteger) column;
-(void) makeMoveAtRow:(NSInteger) r column:(NSInteger) c forPlayer:(NSString *) player;
-(NSInteger) getDimension;

@end
