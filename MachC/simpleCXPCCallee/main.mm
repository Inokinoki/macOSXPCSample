#import <Foundation/Foundation.h>
#include <xpc/xpc.h>

static void
peer_event_handler(xpc_connection_t me, xpc_object_t event)
{
    xpc_connection_t remote = NULL;
    NSLog(@"Event handle");
    if (xpc_get_type(event) == XPC_TYPE_DICTIONARY) {
        NSLog(@"XC value: %lld", xpc_dictionary_get_int64(event, "XC"));
        
        remote = xpc_dictionary_get_remote_connection(event);
        xpc_object_t reply = xpc_dictionary_create_reply(event);
        // This can be ignored
        // xpc_dictionary_set_bool(reply, "reply", true);
        xpc_dictionary_set_int64(reply, "XC", xpc_dictionary_get_int64(event, "XC"));
        
        xpc_connection_send_message(remote, reply);
    } else if (xpc_get_type(event) != XPC_TYPE_ERROR) {
        if (xpc_get_type(event) == XPC_TYPE_ENDPOINT) {
            NSLog(@"ENDPOINT");
        } else if (xpc_get_type(event) == XPC_TYPE_NULL) {
            NSLog(@"NULL");
        } else if (xpc_get_type(event) == XPC_TYPE_BOOL) {
            NSLog(@"BOOL");
        } else if (xpc_get_type(event) == XPC_TYPE_INT64) {
            NSLog(@"INT64");
        } else if (xpc_get_type(event) == XPC_TYPE_UINT64) {
            NSLog(@"UINT64");
        } else if (xpc_get_type(event) == XPC_TYPE_DOUBLE) {
            NSLog(@"DOUBLE");
        } else if (xpc_get_type(event) == XPC_TYPE_DATE) {
            NSLog(@"DATE");
        } else if (xpc_get_type(event) == XPC_TYPE_DATA) {
            NSLog(@"DATA");
        } else if (xpc_get_type(event) == XPC_TYPE_STRING) {
            NSLog(@"STRING");
        } else if (xpc_get_type(event) == XPC_TYPE_UUID) {
            NSLog(@"UUID");
        } else if (xpc_get_type(event) == XPC_TYPE_FD) {
            NSLog(@"FD");
        } else if (xpc_get_type(event) == XPC_TYPE_SHMEM) {
            NSLog(@"SHMEM");
        } else if (xpc_get_type(event) == XPC_TYPE_ARRAY) {
            NSLog(@"ARRAY");
        } else if (xpc_get_type(event) == XPC_TYPE_DICTIONARY) {
            NSLog(@"DICTIONARY");
        } else {
            NSLog(@"Unknown");
        }
    } else {
        // Error
        NSLog(@"Error");
    }
}

int main(int argc, const char *argv[])
{
    xpc_connection_t listener = 
        xpc_connection_create_mach_service("cc.inoki.SimpleCXPC", NULL,
            XPC_CONNECTION_MACH_SERVICE_LISTENER);
    xpc_connection_set_event_handler(listener, ^(xpc_object_t event) {
        NSLog(@"Received an event");
        peer_event_handler(listener, event);
    });
    xpc_connection_resume(listener);

    NSLog(@"Dispatch Queue");

    dispatch_main();

    NSLog(@"Dispatch End");

    return 0;
}
