//
//  XPCCalleeUIOBC.h
//  XPCCalleeUIOBC
//
//  Created by Inoki on 26/09/2020.
//  Copyright © 2020 Inoki Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XPCCalleeUIOBCProtocol.h"

// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@interface XPCCalleeUIOBC : NSObject <XPCCalleeUIOBCProtocol>
@end
