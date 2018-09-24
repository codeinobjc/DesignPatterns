//
//  Singleton.m
//  DesignPatterns
//
//  Created by Keynes Paul on 9/24/18.
//  Copyright © 2018 com.codeinobjc. All rights reserved.
//

#import "Singleton.h"
static Singleton *sharedInstance = nil;

@interface Singleton()
@end

@implementation Singleton
/*!
 *@brief locks static sharedInstance within @synchronized block and initializes with super if not nil.
 */
+(instancetype)getSharedInstance
{
//	if (sharedInstance == nil) {
//		@synchronized (self) {
//			sharedInstance = [[super allocWithZone:nil] init];
//		}
//	}
	/*!
	 *@brief alternate approach, using dispatch queue
	 */
	if (sharedInstance == nil) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			sharedInstance = [[super allocWithZone:nil] init];
		});
	}

	return sharedInstance;
}

+(id)allocWithZone:(struct _NSZone *)zone
{
	return [[self class] getSharedInstance];
}

/*!
 *@brief clone returns self
 */
-(id) copyWithZone:(NSZone*)zone
{
	return self;
}

@end
