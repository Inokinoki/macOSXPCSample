//
//  AppDelegate.swift
//  XPCCallerUITest
//
//  Created by Inoki on 26/09/2020.
//  Copyright © 2020 Inoki Test. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let connection = NSXPCConnection(serviceName: "cc.inoki.XPCCalleeUITest")
        connection.remoteObjectInterface = NSXPCInterface(with: XPCCalleeUITestProtocol.self)
        connection.resume()

        let service = connection.remoteObjectProxyWithErrorHandler { error in
          print("Received error:", error)
        } as? XPCCalleeUITestProtocol

        print("Calling upperCaseString")
        service!.upperCaseString(aString: "abc") {(texto) in
          DispatchQueue.main.async {
            print(texto)
          }
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

