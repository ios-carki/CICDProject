//
//  CICDProjectUITests.swift
//  CICDProjectUITests
//
//  Created by Carki on 2022/11/29.
//

import XCTest

final class CICDProjectUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        //테스트 중간에 실패했는데도 계속 테스트 할 것인지
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication() //앱의 실행과 종료
        app.launch()
        
        app.textFields["emailTextField"].tap()
        app.textFields["emailTextField"].typeText("carki@carki.com")
        
    }
    
    func testLoginExample() throws {
        let app = XCUIApplication() //앱의 실행과 종료
        app.launch()
        
        app.textFields["emailTextField"].tap()
        app.textFields["emailTextField"].typeText("carki@carki.com")
        
        app.textFields["passwordTextField"].tap()
        app.textFields["passwordTextField"].typeText("12345678")
        
        app.textFields["checkTextField"].tap()
        app.textFields["checkTextField"].typeText("1234123")
        
        app.staticTexts["로그인하기"].tap()
        
        let label = app.staticTexts.element(matching: .any, identifier: "desceiptionLabel").label
        XCTAssertEqual(label, "로그인 버튼을 눌렀습니다.")
        
        //테스트가 성공했는지 유무 keyword
        //XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>) -> 1, 2가 같은값인지 테스트
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
