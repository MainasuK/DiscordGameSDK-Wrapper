//
//  WrapperTests.swift
//  
//
//  Created by MainasuK on 2022/11/17.
//

import XCTest
import Combine
@testable import Wrapper
import DiscordGameSDK

final class WrapperTests: XCTestCase {
    
    func testSmoke() { }

}

extension WrapperTests {
    func testDiscordCreate() {
        var app = Application()
        
        var params = DiscordCreateParams()
        params.client_id = 123456 // replace me!
        params.flags = UInt64(DiscordCreateFlags_Default.rawValue)
        
        let createResult = DiscordCreate(DISCORD_VERSION, &params, &app.core)
        
        while true {
            guard app.core?.pointee.run_callbacks(app.core) == DiscordResult_Ok else {
                XCTFail()
                break
            }
            print("run loop working...")
        }
    }
}
