////
////  HomeRepositorySpec.swift
////  PokemonTests
////
////  Created by Fajriharish on 26/10/23.
////
//
//import Foundation
//import Quick
//import Nimble
//
//@testable import Pokemon
//
//final class HomeRepositorySpec: QuickSpec {
//
//    override class func spec() {
//        
//        var urlSession: URLSession
//        var mockJSONDecoder: JSONDecoder
//        var homeRepository: HomeRepository!
//        
//        beforeEach {
//            urlSession = URLSession.shared
//            
//            homeRepository = HomeRepositoryDefault(page: "some-page.com",
//                                                   urlSession: urlSession,
//                                                   jsonDecoder: mockJSONDecoder)
//        }
//        
//        describe("fetch pokemon online") {
//            
//        }
//    }
//}
//
//protocol URLSessionDataTaskProtocol {
//    func resume()
//    func cancel()
//}
//
//extension URLSessionDataTask: URLSessionDataTaskProtocol {}
//
//class MockURLSessionDataTask: URLSessionDataTaskProtocol {
//    
//    typealias callback = () -> Void
//    
//    private let completion: callback
//    
//    init(completion: @escaping callback) {
//        self.completion = completion
//    }
//    
//    func resume() {
//        completion()
//    }
//    
//    func cancel() {
//        completion()
//    }
//    
//}
//
//class MockJSONDecoder: JSONDecoder {
//    
//    override func decode<T>(
//        _ type: T.Type,
//        from data: Data
//    ) throws -> T where T : Decodable {
//        return ListPokemonResponse(count: 1, next: "", previous: "", results: []) as! T
//    }
//}
