//
//  XPCCalleeUIOBC.m
//  XPCCalleeUIOBC
//
//  Created by Inoki on 26/09/2020.
//  Copyright © 2020 Inoki Test. All rights reserved.
//

#import "XPCCalleeUIOBC.h"

@implementation XPCCalleeUIOBC

// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

@end
