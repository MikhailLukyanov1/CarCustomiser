//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by MIKHAEL LUKYANOV on 16/01/2023.
//

import XCTest

final class CarCustomiserTests: XCTestCase {

    func testNewCarGivesMeACarWithAllAttributesSet() {
        //arrange
        //act
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        //assert
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
    }
    
    func testThatTheDislpayFunctionDisplaysInformationCorrectly() {
        //arrange
        //act
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)

        //assert

        XCTAssertEqual(car.displayStats(), "Make: Mazda\nModel: MX-5\nTop speed: 125\nAcceleration (0-60 in): 7.7\nHandling: 5")

    }

}

    
