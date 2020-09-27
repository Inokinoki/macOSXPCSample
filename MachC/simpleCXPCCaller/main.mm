#include <xpc/xpc.h>
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    xpc_object_t dictObj = xpc_dictionary_create(NULL, NULL, 0);
    xpc_object_t intX = xpc_int64_create(114514), intY = xpc_int64_create(250);
    xpc_object_t boolB = xpc_bool_create(true);

    xpc_dictionary_set_value(dictObj, "X", intX);
    xpc_dictionary_set_value(dictObj, "Y", intY);
    xpc_dictionary_set_value(dictObj, "B", boolB);

    xpc_dictionary_set_int64(dictObj, "XC", 12580);
    xpc_dictionary_set_bool(dictObj, "BC", true);
    xpc_dictionary_set_double(dictObj, "DC", 114.514);
    xpc_dictionary_set_string(dictObj, "SC", "114514");

    xpc_connection_t c = xpc_connection_create_mach_service("cc.inoki.SimpleCXPC", NULL, 0);

    xpc_connection_set_event_handler(c, ^(xpc_object_t event) {
        // Always keep this
    });
    xpc_connection_resume(c);

    // xpc_connection_send_message(c, dictObj);
    xpc_connection_send_message_with_reply(c, dictObj, NULL, ^(xpc_object_t reply){
        if (xpc_get_type(reply) == XPC_TYPE_DICTIONARY) {
            NSLog(@"XC value: %lld", xpc_dictionary_get_int64(reply, "XC"));
        } else if (xpc_get_type(reply) != XPC_TYPE_ERROR) {
            NSLog(@"Invalid value in reply");
        } else {
            NSLog(@"Error");
        }
    });

    NSLog(@"Dispatch Queue");

    dispatch_main();

    NSLog(@"Dispatch End");

    return 0;
}
