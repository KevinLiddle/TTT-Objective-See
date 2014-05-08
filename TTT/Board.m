//
//  Board.m
//  TTT
//
//  Created by Kevin Liddle on 5/7/14.
//  Copyright (c) 2014 wat. All rights reserved.
//

#import "Board.h"

@implementation Board

+(Board *) newWithDimension:(NSInteger)d {
  return [[Board alloc] initWithDimension: d];
}

-(Board *) initWithDimension: (NSInteger) d {
  dimension = d;
  cells = [[NSMutableArray alloc] init];

  for (NSInteger i = 0; i < d; i++) {
    NSMutableArray *row = [[NSMutableArray alloc] init];
    for (NSInteger j = 0; j < d; j++) {
      [row addObject: @""];
    }
    [cells addObject: row];
  }
  return self;
}

-(NSString *) getSpaceAtRow:(NSInteger) row column: (NSInteger) column {
  return [[cells objectAtIndex: row] objectAtIndex: column];
}

-(void) makeMoveAtRow:(NSInteger)r column:(NSInteger)c forPlayer:(NSString *)player {
  NSMutableArray *row = [cells objectAtIndex: r];
  NSString *marker = [row objectAtIndex: c];
  if ([marker length] == 0) {
    [row replaceObjectAtIndex: c withObject: player];
  } else {
    [NSException raise:@"DuplicateMoveException" format:@"Space already taken at row %i, column %i", r, c];
  }
}

-(NSInteger) getDimension {
  return dimension;
}

@end
