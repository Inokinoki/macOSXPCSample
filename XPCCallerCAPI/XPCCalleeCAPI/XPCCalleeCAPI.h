//
//  XPCCalleeCAPI.h
//  XPCCalleeCAPI
//
//  Created by Inoki on 27/09/2020.
//  Copyright © 2020 Inoki Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XPCCalleeCAPIProtocol.h"

// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@interface XPCCalleeCAPI : NSObject <XPCCalleeCAPIProtocol>
@end
