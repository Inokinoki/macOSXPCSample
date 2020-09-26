//
//  main.swift
//  XPCCalleeUITest
//
//  Created by Inoki on 26/09/2020.
//  Copyright © 2020 Inoki Test. All rights reserved.
//

import Foundation

let listener = NSXPCListener.service()
let delegate = ServiceDelegate()
listener.delegate = delegate;
listener.resume()
RunLoop.main.run()
