//
//  Singleton.h
//  DesignPatterns
//
//  Created by Keynes Paul on 9/24/18.
//  Copyright © 2018 com.codeinobjc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Singleton : NSObject
+(instancetype)getSharedInstance;
@end

NS_ASSUME_NONNULL_END
