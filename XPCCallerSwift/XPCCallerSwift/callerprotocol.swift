//
//  callerprotocol.swift
//  XPCCallerSwift
//
//  Created by Inoki on 26/09/2020.
//  Copyright © 2020 Inoki Test. All rights reserved.
//

import Foundation

@objc(ServiceProviderXPCProtocol) protocol ServiceProviderXPCProtocol {
    func upperCaseString(aString: String, withReply reply: @escaping (String) -> Void)
}
