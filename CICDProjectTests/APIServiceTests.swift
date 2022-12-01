//
//  APIServiceTests.swift
//  CICDProjectTests
//
//  Created by Carki on 2022/12/01.
//

import XCTest

@testable import CICDProject

final class APIServiceTests: XCTestCase {
    
    var sut: APIService!

    override func setUpWithError() throws {
        sut = APIService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    //테스트 코드는 비동기에 대한 응답을 기다리지 않는다
    //동기적으로 다음 코드를 실행하고 그냥 테스트 종료
    func testExample() throws {
        print("testEample Start")
        
        sut.number = 100
        
        sut.callRequest { value in
            //같거나 작냐
            XCTAssertLessThanOrEqual(value, 45)
            //1보다 크다
            XCTAssertGreaterThanOrEqual(value, 1)
            
            print("callRequest!")
        }
        print("testEample End")
    }
    
    //비동기: expectation, fulfill, wait
    /*
     네트워크: 아이폰 네트워크 응답X, API 서버 점검, API 지연...? >>
     효율적 / 속도 / 같은 조건에서 테스트를 해야 하는데 그 조건이 깨짐.
     테스트 대상이 외부와 격리가 되어있지 않은 상태. -> 예측 불가능한 상황을 만들면 안된다.
     => 실제 네트워크 동작이 되는 것 처럼 보이게 별개의 객체를 만듦
     => 테스트 더블(Test Double): 테스트 코드랑 상호작용 할 수 있는 가짜 객체 생성(ex. 스턴트맨 더블 -> 리얼 토르, 스턴트 장면용 가짜 토르)
            ex. dummy, mock, fake, stub, spy...
     
     FIRST
     1.Fast - 테스트는 빨라야됨
     2.Isolated - 테스트가 서로 영향받지 않고 독립적이여야됨 => tearDown nil
     3.Repeatable - 여러번 반복하더라도 같은 결과가 나와야 됨, 가짜 객체(원칙달성을 위한)
     4.Self-validation - 스스로 검증을 해야됨 -> XCTest써야된다
     5.Timely - 즉시, 철저하고 적절한 때에 작성이 되어야 한다
     
     quick, nimble -> 테스트용 오픈 소스
     */
    func test_APILottoResponse_AsyncCover() throws {
        
        let promise = expectation(description: "waiting lotto number, completion handler invoked")
        
        print("testEample Start")
        
        sut.number = 33
        
        sut.callRequest { value in
            //같거나 작냐
            XCTAssertLessThanOrEqual(value, 45)
            //1보다 크다
            XCTAssertGreaterThanOrEqual(value, 1)
            
            print("callRequest!")
            promise.fulfill() //expectation으로 정의된 테스트 조건을 충족!
        }
        print("testEample End")
        
        wait(for: [promise], timeout: 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
