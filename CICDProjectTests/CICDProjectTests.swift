//
//  CICDProjectTests.swift
//  CICDProjectTests
//
//  Created by Carki on 2022/11/29.
//

import XCTest
@testable import CICDProject //target이 다르니까 가져올 수 있음 -> framework import와 비슷 // 접근제어자 (private)는 어떻게? -> @testable

final class CICDProjectTests: XCTestCase {
    
    var sut: LoginViewController! //system under test 테스트를 하고자하는 클래스를 정의할 때 사용!

    override func setUpWithError() throws {
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        
        sut.loadViewIfNeeded() //스토리보드 및 @IBOutlet 시에 필요
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil // 파일에대한 영향력 때문에 초기화
    }

    //이메일 유효성 테스트
    //TDD
    //BDD
    //앞에 test는 냅두고 타겟파일 -> 검사항목 매서드 , 기능, 결과로 스테이크 케이스를 주로 사용
    func testLoginViewController_validEmail_returnTrue() throws {
        //테스트 객체:GIVEN, Arrange
        sut.emailTextField.text = "carki@carki.com"
        //테스트 조건/행동:When, Act
        let valid = sut.isValidEmail()
        //테스트 결과:Then, Assert
        XCTAssertTrue(valid) //valid가 true면 테스트 성공
    }
    
    func testLoginViewController_inValidPassword_ReturnFalse() throws {
        sut.passwordTextField.text = "1234"
        
        let valid = sut.isValidPassword()
        
        XCTAssertFalse(valid)
    }
    
    func testLoginViewController_emailTextField_ReturnNil() throws {
        
        sut.emailTextField = nil
        
        let value = sut.emailTextField
        
        XCTAssertNil(value)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
