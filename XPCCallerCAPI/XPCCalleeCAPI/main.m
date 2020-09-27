//
//  main.m
//  XPCCalleeCAPI
//
//  Created by Inoki on 27/09/2020.
//  Copyright © 2020 Inoki Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <xpc/xpc.h>

static void
peer_event_handler(xpc_connection_t peer, xpc_object_t event)
{
    // xpc_connection_t remote = NULL;
    if (xpc_get_type(event) == XPC_TYPE_DICTIONARY) {
        NSLog(@"XC value: %lld", xpc_dictionary_get_int64(event, "XC"));
        
        // remote = xpc_dictionary_get_remote_connection(event);
        xpc_object_t reply = xpc_dictionary_create_reply(event);
        // This can be ignored
        // xpc_dictionary_set_bool(reply, "reply", true);
        xpc_dictionary_set_int64(reply, "XC", xpc_dictionary_get_int64(event, "XC"));
        
        xpc_connection_send_message(peer, reply);
    } else {
        // Error or invalid format
    }
}

static void
new_connection_handler(xpc_connection_t peer)
{
    xpc_connection_set_event_handler(peer, ^(xpc_object_t event){
        peer_event_handler(peer, event);
    });
    xpc_connection_resume(peer);
}

int main(int argc, const char *argv[])
{
    xpc_main(new_connection_handler);
    return 0;
}
