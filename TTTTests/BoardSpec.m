#import "Kiwi.h"
#import "Board.h"

SPEC_BEGIN(BoardSpec)

describe(@"Board", ^{

  let(board, ^{
    return [Board newWithDimension: 3];
  });

  it(@"can be initialized with any number of spaces", ^{
    [[theValue([board getDimension]) should] equal:theValue(3)];
    [[theValue([[Board newWithDimension: 5] getDimension]) should] equal:theValue(5)];
  });

  it(@"can make a move for the given player", ^{
    [board makeMoveAtRow: 2 column: 1 forPlayer: @"X"];
    [board makeMoveAtRow: 1 column: 0 forPlayer: @"O"];
    [[[board getSpaceAtRow: 2 column: 1] should] equal:@"X"];
    [[[board getSpaceAtRow: 1 column: 0] should] equal:@"O"];
  });

  it(@"does not make a move on a space that is taken", ^{
    [board makeMoveAtRow: 2 column: 1 forPlayer: @"X"];

    [[theBlock(^{
      [board makeMoveAtRow: 2 column: 1 forPlayer: @"X"];
    }) should] raiseWithName:@"DuplicateMoveException" reason: @"Space already taken at row 2, column 1"];
  });
});

SPEC_END
