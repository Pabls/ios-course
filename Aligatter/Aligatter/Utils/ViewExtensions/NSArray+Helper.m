//
//  NSArray+Helper.m
//  Aligatter
//
//  Created by Павел Семин on 3/3/22.
//

#import "NSArray+Helper.h"

@implementation NSArray (Helper)
- (BOOL)isNullOrEmpty {
    return self == nil || self.count <= 0;
}
@end
