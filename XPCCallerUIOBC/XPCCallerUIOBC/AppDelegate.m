//
//  AppDelegate.m
//  XPCCallerUIOBC
//
//  Created by Inoki on 26/09/2020.
//  Copyright © 2020 Inoki Test. All rights reserved.
//

#import "AppDelegate.h"
#import "XPCCalleeUIOBCProtocol.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (retain, nonatomic) NSXPCConnection* c;
@end

@implementation AppDelegate

@synthesize c;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    c = [[NSXPCConnection alloc] initWithServiceName:@"cc.inoki.XPCCalleeUIOBC"];
    c.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol: @protocol(XPCCalleeUIOBCProtocol)];
    [c resume];
    NSLog(@"Resuming");
    
    /*[[c remoteObjectProxy] upperCaseString:@"abc" withReply:^(NSString *aString) {
            // We have received a response. Update our text field, but do it on the main thread.
            NSLog(@"Result string was: %@", aString);
        }];*/

    [[c remoteObjectProxyWithErrorHandler:^(NSError *error) {
        NSLog(@"%@", error);
    }] upperCaseString:@"abc" withReply:^(NSString *aString) {
               // We have received a response. Update our text field, but do it on the main thread.
               NSLog(@"Result string was: %@", aString);
           }];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    
    // After all use
    [c invalidate];
}


@end
