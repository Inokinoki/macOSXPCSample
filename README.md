# XPC demo application on macOS - embedded

The word `embedded` means that the XPC service will be included in the `.app` bundle.

## Objective-C

[XPCCallerUIOBC](XPCCallerUIOBC) is a demo in full Objective-C, with a XPC caller (client) GUI program and an embedded XPC callee (server).

## Swift

[XPCCallerUITest](XPCCallerUITest) is a demo in full Swift, with a XPC caller (client) GUI program and an embedded XPC callee (server).

It's directly called UI Test, because Swift is more widely used at this era :)

## [WIP] Hybrid

[XPCCallerSwift](XPCCallerSwift) is a demo which does not work at the moment. This is a demo where a Swift cli calls XPC on a XPC Service.

At least I can confirm that, a cli program cannot embed a XPC service thus cannot call one.

TODO:

- validate whether Swift and Objective-C XPC can call each other. I've ever met a reply data corruption, probably due to the different signature in Swift and Objective-C.

## C API

[XPCCallerCAPI](XPCCallerCAPI) is a demo in Objective-C, the XPC is implemented with the system C API.

# XPC demo application on macOS - Mach

Mach means that the call is through launchd, with MIG mechanism.

## Swift

[MachSwift](MachSwift) is a demo in full Swift, with a XPC caller program and an external XPC callee based on launchd and Mach MIG.

## C API

[MachC](MachC) is a demo in Objective-C/C, with a XPC caller program and an external XPC callee based on launchd and Mach MIG.

It does not work well - the received Mach message seems to be corrupted. Need fix...
