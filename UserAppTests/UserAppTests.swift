//
//  UserAppTests.swift
//  UserAppTests
//
//  Created by Sergio pinilla on 12/11/22.
//

import XCTest
@testable import UserApp

final class UserAppTests: XCTestCase {

    
    func testUser(){
        
        let expectationTest = expectation(description: "Llamado asincrono")
        
        let userViewModel = UserViewModel()
        
        userViewModel.getUsers = { response in
            
            XCTAssertNotNil(response)
            XCTAssertFalse(response.isEmpty)
        }
        
        wait(for: [expectationTest], timeout: 20)
        
    }
    
    

}
