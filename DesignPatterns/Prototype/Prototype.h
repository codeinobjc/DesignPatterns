//
//  Prototype.h
//  DesignPatterns
//
//  Created by Keynes Paul on 9/20/18.
//  Copyright © 2018 com.codeinobjc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol Mark <NSObject>
@required
/*!
 *@brief Child node management
 */
-(void)addMark:(id<Mark>)markToAdd;
- (void)removeMark:(nonnull id<Mark>)markToRemove;
-(id<Mark>)markAtIndex:(NSUInteger)markIndex;
/*!
 *@brief initialize with coordinate location
 */
-(instancetype)initWithLocation:(CGPoint)strokeLocation;
@optional
@property(nonatomic,assign) UIColor *strokeColor;
@property(nonatomic,assign) CGSize strokeSize;
@property(nonatomic,assign) CGPoint location;
-(id<Mark>)lastMarkChild;
-(NSUInteger)childCount;
@end

/*!
 *@brief Composite for mark objects
 */
@interface Stroke : NSObject<Mark,NSCopying>
@end

@interface Vertex:NSObject<Mark,NSCopying>
@end
@interface Dot:Vertex
@end
NS_ASSUME_NONNULL_END
