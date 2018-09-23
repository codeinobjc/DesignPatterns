//
//  Prototype.m
//  DesignPatterns
//
//  Created by Keynes Paul on 9/20/18.
//  Copyright © 2018 com.codeinobjc. All rights reserved.
//

#import "Prototype.h"

@interface Stroke()
@property(nonatomic,retain) NSMutableArray *childNodes;
@end

@implementation Stroke

@synthesize location = _location;
@synthesize strokeColor = _strokeColor;
@synthesize strokeSize = _strokeSize;

-(instancetype)initWithLocation:(CGPoint)strokeLocation
{
	if (self == [super init]) {
		self.childNodes = [[NSMutableArray alloc] initWithCapacity:5];
	}
	return self;
}

#pragma - mark Child nodes management

- (void)addMark:(nonnull id<Mark>)markToAdd {
	if ([markToAdd conformsToProtocol:@protocol(Mark)]) {
		[self.childNodes addObject:markToAdd];
	}
}

- (nonnull id<Mark>)markAtIndex:(NSUInteger)markIndex {
	if (self.childNodes.count < markIndex) {
		return nil;
	}
	return [self.childNodes objectAtIndex:markIndex];
}

- (void)removeMark:(nonnull id<Mark>)markToRemove {
	if ([self.childNodes containsObject:markToRemove]) {
		[self.childNodes removeObject:markToRemove];
	}
	for (id<Mark> child in self.childNodes) {
		[child performSelector:@selector(removeMark:) withObject:markToRemove];
	}
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
	Stroke *strokeClone = [[[self class] allocWithZone:zone] initWithLocation:_location];
	strokeClone.strokeSize = _strokeSize;
	strokeClone.strokeColor = _strokeColor;
	for (id<Mark> child in self.childNodes) {
		[strokeClone addMark:child];
	}
	return strokeClone;
}
@end

@implementation Vertex
@synthesize location = _location;

-(instancetype)initWithLocation:(CGPoint)strokeLocation
{
	if (self == [super init]) {
		self.location = strokeLocation;
	}
	return self;
}
- (void)addMark:(nonnull id<Mark>)markToAdd {
}

- (nonnull id<Mark>)markAtIndex:(NSUInteger)markIndex {
	return nil;
}

- (void)removeMark:(nonnull id<Mark>)markToRemove {
	}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
	Vertex *vertexClone = [[[self class] allocWithZone:nil] initWithLocation:_location];
	return vertexClone;
}

@end

@implementation Dot
@synthesize strokeColor = _strokeColor;;
@synthesize strokeSize = _strokeSize;
-(instancetype)initWithLocation:(CGPoint)strokeLocation
{
	if (self == [super initWithLocation:strokeLocation]) {
		self.location =strokeLocation;
	}
	return self;
}
- (nonnull id)copyWithZone:(nullable NSZone *)zone {
	Dot *dotClone = [[[self class] allocWithZone:nil] initWithLocation:self.location];
	dotClone.strokeColor = _strokeColor;
	dotClone.strokeSize = _strokeSize;
	return dotClone;
}
@end
