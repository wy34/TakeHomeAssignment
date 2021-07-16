//
//  WilliamYeung_Virtusa_TakeHomeTests.swift
//  WilliamYeung_Virtusa_TakeHomeTests
//
//  Created by William Yeung on 7/15/21.
//

import XCTest
@testable import WilliamYeung_Virtusa_TakeHome

class UserViewModelTests: XCTestCase {
    var sut: UserViewModel!

    override func setUpWithError() throws {
        sut = UserViewModel(user: createSampleUser())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    private func createSampleUser() -> User {
        let name = "Miss Dennis Schulist"
        let username = "Leopoldo_Corkery"
        let email = "Karley_Dach@jasper.info"
        let address = Address(street: "Norberto Crossing", suite: "Apt. 950", city: "South Christy", zipcode: "23505-1337")
        return User(name: name, username: username, email: email, address: address)
    }
    
    func testFirstNameIsWithoutPrefix() {
        XCTAssertEqual(sut.firstName, "Dennis")
    }
    
    func testCorrectFullName() {
        XCTAssertEqual(sut.fullName, "Miss Dennis Schulist")
    }
    
    func testCorrectUsername() {
        XCTAssertEqual(sut.userName, "Leopoldo_Corkery")
    }
    
    func testCorrectEmail() {
        XCTAssertEqual(sut.email, "Karley_Dach@jasper.info")
    }
    
    func testCorrectAddress() {
        XCTAssertEqual(sut.address, "Norberto Crossing, Apt. 950, South Christy, 23505-1337")
    }
}
