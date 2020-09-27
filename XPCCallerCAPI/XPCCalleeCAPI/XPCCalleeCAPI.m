//
//  XPCCalleeCAPI.m
//  XPCCalleeCAPI
//
//  Created by Inoki on 27/09/2020.
//  Copyright © 2020 Inoki Test. All rights reserved.
//

#import "XPCCalleeCAPI.h"

@implementation XPCCalleeCAPI

// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

@end
