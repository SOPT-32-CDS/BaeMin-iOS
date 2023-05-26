//
//  HomeManager.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/13.
//

import UIKit

import Alamofire

import CustomExtension

final class HomeManager {
    static let homeShared = HomeManager()
    private init() {}
    
    let header: HTTPHeaders = ["Content-Type" : "application/json",
                               "Authorization" : Constant.HomeNetworkConstant.bearer]
    private func makeHomeUrl() -> String {
        return Constant.HomeNetworkConstant.baseURL
    }
    
    func homeData (completion: @escaping (NetworkResult<Any>) -> Void) {

        let dataRequest = AF.request(makeHomeUrl(),
                                     method: .get,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success :
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                print("✅✅✅✅✅Home정보조회API호출성공✅✅✅✅✅")
                completion(networkResult)
            case .failure :
                completion(.networkErr)
            }
        }
        
    }
    
    func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200..<300:
            
            return isValidData(data: data)
        case 500..<600: return .serverErr
        default: return .networkErr
        }
    }

    func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(Home.self, from: data) else { fatalError("decode error") }
        return .success(decodedData)
    }
    
}
