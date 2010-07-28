//
//  GBIvarData.m
//  appledoc
//
//  Created by Tomaz Kragelj on 26.7.10.
//  Copyright (C) 2010, Gentle Bytes. All rights reserved.
//

#import "GBIvarData.h"

@implementation GBIvarData

#pragma mark Initialization & disposal

+ (id)ivarDataWithComponents:(NSArray *)components {
	return [[[self alloc] initWithDataFromComponents:components] autorelease];
}

- (id)initWithDataFromComponents:(NSArray *)components {
	NSParameterAssert(components != nil);
	NSParameterAssert([components count] >= 2);
	self = [super init];
	if (self) {
		NSMutableArray *types = [NSMutableArray arrayWithArray:components];
		[types removeLastObject];
		self.ivarTypes = types;
		self.nameOfIvar = [components lastObject];
	}
	return self;
}

#pragma mark Helper methods

- (void)mergeDataFromIvar:(GBIvarData *)source {
	NSParameterAssert([source.nameOfIvar isEqualToString:self.nameOfIvar]);
	NSParameterAssert([source.ivarTypes isEqualToArray:self.ivarTypes]);
	[self mergeDataFromModelBase:source];
}

#pragma mark Overriden methods

- (NSString *)description {
	return self.nameOfIvar;
}

#pragma mark Properties

@synthesize nameOfIvar;
@synthesize ivarTypes;

@end
