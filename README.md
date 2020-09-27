# XPC demo application on macOS - embedded

The word `embedded` means that the XPC service will be included in the `.app` bundle.

## Objective-C

[XPCCallerUIOBC](XPCCallerUIOBC) is a demo in full Objective-C, with a XPC caller (client) GUI program and an embedded XPC callee (server).

## Swift

[XPCCallerUITest](XPCCallerUITest) is a demo in full Swift, with a XPC caller (client) GUI program and an embedded XPC callee (server).

It's directly called UI Test, because Swift is more widely used at this era :)

## [WIP] Hybrid

[XPCCallerSwift](XPCCallerSwift) is a demo which does not work at the moment.

At least I can confirm that, a cli program cannot embed a XPC service thus cannot call one.

## C API

[XPCCallerCAPI](XPCCallerCAPI) is a demo in Objective-C, the XPC is implemented with the system C API.

TODO:

- validate whether Swift and Objective-C XPC can call each other. I've ever met a reply data corruption, probably due to the different signature in Swift and Objective-C.

# [WIP] XPC demo application on macOS - Mach

TODO:

- Mach call from Swift to Swift
- Mach call from Objective-C to Objective-C
- Mach call between Swift and Objective-C
- C API
