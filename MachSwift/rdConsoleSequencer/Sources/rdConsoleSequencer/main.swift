import Foundation

let delegate = ServiceDelegate()
let listener = NSXPCListener(machServiceName: "cc.inoki.ConsoleSequencerXPC" )
listener.delegate = delegate;
listener.resume()
RunLoop.main.run()

