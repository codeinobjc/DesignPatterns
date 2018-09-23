//
//  StrokeSpec.m
//  DesignPatterns
//
//  Created by Keynes Paul on 9/20/18.
//  Copyright 2018 com.codeinobjc. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "Prototype.h"

@interface Stroke()
@property(nonatomic,retain) NSMutableArray *childNodes;
@end

SPEC_BEGIN(StrokeSpec)

describe(@"Prototype", ^{
	__block Stroke *testComposite = nil;
	beforeAll(^{
		testComposite = [[Stroke allocWithZone:nil] initWithLocation:CGPointMake(0, 0)];
		testComposite.strokeSize = CGSizeMake(1.0, 1.0);
		testComposite.strokeColor = [UIColor redColor];
		testComposite.childNodes = [[NSMutableArray allocWithZone:nil] initWithCapacity:0];
	});
	context(@"when initialized", ^{
		it(@"is ready and available", ^{
			[testComposite shouldNotBeNil];
		});
	});
	context(@"conforms to ", ^{
		it(@"Mark protocol", ^{
			[testComposite conformsToProtocol:@protocol(Mark)];
		});
	});
	context(@"has child management  ", ^{
		it(@"to add new child node", ^{
			[testComposite addMark:testComposite];
			[[testComposite.childNodes should] haveCountOf:1];
		});
	});
	context(@"has child management  ", ^{
		it(@"to remove child node", ^{
			[testComposite removeMark:testComposite];
			[[testComposite.childNodes should] haveCountOf:0];
		});
	});
	context(@"has child management  ", ^{
		it(@"to return child node", ^{
			[testComposite addMark:testComposite];
			id<Mark> returnedComposite = [testComposite markAtIndex:0];
			[[testComposite should]equal:returnedComposite];
			
		});
	});
	context(@"has child management  ", ^{
		it(@"to return last child node", ^{
			Stroke *testLastChildNode = [[Stroke allocWithZone:nil] initWithLocation:CGPointMake(1, 1)];
			[testComposite addMark:testLastChildNode];
			id<Mark> returnedComposite = [testComposite markAtIndex:1];
			[[testComposite.childNodes should] haveCountOf:2];
			[[testLastChildNode should]equal:returnedComposite];
		});
	});
	context(@"has child management  ", ^{
		it(@"to return child nodes count", ^{
			[[testComposite.childNodes should] haveCountOf:2];
			[testComposite removeMark:testComposite];
			[[testComposite.childNodes should] haveCountOf:1];
		});
	});
	context(@"clone itself", ^{
		it(@"for copying", ^{
		Stroke *strokeClone = [testComposite copy];
		[[theValue(strokeClone.location) should]equal:theValue(testComposite.location)];
		[[theValue(strokeClone.strokeSize) should]equal:theValue(testComposite.strokeSize)];
		[[strokeClone.strokeColor should] equal:testComposite.strokeColor];
		});
	});
});
SPEC_END

SPEC_BEGIN(VertexSpec)
describe(@"Vertex", ^{
	__block Vertex *testVertex = nil;
	beforeAll(^{
		testVertex = [[Vertex allocWithZone:nil] initWithLocation:CGPointMake(0, 0)];
	});
	context(@"is available", ^{
		it(@"when initialized", ^{
			[[testVertex shouldNot] beNil];
		});
	});
	context(@"sets coordinate location", ^{
		it(@"when available", ^{
			[[theValue(testVertex.location) should] equal:theValue(CGPointMake(0, 0))];
		});
	});
	context(@"clone itself", ^{
		it(@"for copying", ^{
			Vertex *vertexClone = [testVertex copy];
			[[theValue(vertexClone.location) should]equal:theValue(testVertex.location)];
		});
	});
});
SPEC_END

SPEC_BEGIN(DotSpec)
describe(@"Dot", ^{
	__block Dot *testDot = nil;
	beforeAll(^{
		testDot = [[Dot allocWithZone:nil] initWithLocation:CGPointMake(10, 10)];
		testDot.strokeSize = CGSizeMake(1.0, 1.0);
		testDot.strokeColor = [UIColor redColor];
	});
	context(@"is available", ^{
		it(@"when initialized", ^{
			[[testDot shouldNot] beNil];
		});
	});
	context(@"sets coordinate location", ^{
		it(@"when available", ^{
			[[theValue(testDot.location) should] equal:theValue(CGPointMake(10, 10))];
		});
	});
	context(@"clone itself", ^{
		it(@"for copying", ^{
			Dot *dotClone = [testDot copy];
			[[theValue(dotClone.location) should]equal:theValue(testDot.location)];
			[[theValue(dotClone.strokeSize) should]equal:theValue(testDot.strokeSize)];
			[[dotClone.strokeColor should] equal:testDot.strokeColor];
		});
	});
});
SPEC_END

