//
//  main.swift
//  XPCCallerSwift
//
//  Created by Inoki on 26/09/2020.
//  Copyright © 2020 Inoki Test. All rights reserved.
//

import Foundation
import Cocoa

//let connection = NSXPCConnection(serviceName: "cc.inoki.ServiceProviderXPC")
let connection = NSXPCConnection(serviceName: "cc.inoki.XPCCalleeOBC")
connection.remoteObjectInterface = NSXPCInterface(with: ServiceProviderXPCProtocol.self)
connection.resume()

let service = connection.remoteObjectProxyWithErrorHandler { error in
  print("Received error:", error)
} as? ServiceProviderXPCProtocol

print("Calling upperCaseString")
service!.upperCaseString(aString: "abc", withReply: {(texto) in
  DispatchQueue.main.async {
    print(texto)
  }
})

let dispatchGroup = DispatchGroup()

dispatchGroup.notify(queue: DispatchQueue.main) {
    exit(EXIT_SUCCESS)
}
dispatchMain()
