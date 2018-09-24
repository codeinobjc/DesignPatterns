//
//  SingletonSpec.m
//  DesignPatterns
//
//  Created by Keynes Paul on 9/24/18.
//  Copyright 2018 com.codeinobjc. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "Singleton.h"


SPEC_BEGIN(SingletonSpec)

describe(@"Singleton", ^{
	__block Singleton *testSingleton = nil;
	beforeAll(^{
		testSingleton = [Singleton getSharedInstance];
	});
	context(@"is initialized ", ^{
		it(@" and available", ^{
			[[testSingleton shouldNot] beNil];
		});
		it(@" responds to shared static method", ^{
			[[Singleton should] respondToSelector:@selector(getSharedInstance)];
		});
	});
	context(@" instance check", ^{
		it(@"returned from clone is the same", ^{
			Singleton *clonedSingleton = [testSingleton copy];
			[[clonedSingleton should] equal:testSingleton];
		});
	});
});

SPEC_END
