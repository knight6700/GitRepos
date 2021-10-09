//
//  NetworkClient.swift
//  GitReposSearch
//
//  Created by Mahmoud on 8/10/2021.
//

import Foundation
import RxSwift
import Moya

class NetworkClient {
    
    private init() {}
    
    // MARK: - Properties
    static let shared = NetworkClient()
    lazy var provider = MoyaProvider<ReposService>(plugins: [NetworkLoggerPlugin.init()])
    
    func sendRequest<ResponseType: Decodable>(endPoint: ReposService, decodingType: ResponseType.Type) -> PublishSubject<ResponseType> {
        let responseSubject = PublishSubject<ResponseType>()
        provider.request(endPoint) { result in
            switch result {
            case .success(let moyaResponse):
                do {
                    let model: ResponseType =  try JSONDecoder().decode(decodingType.self, from: moyaResponse.data)
                    responseSubject.onNext(model)
                } catch let error {
                    responseSubject.onError(error)
                }
            case .failure(let error):
                responseSubject.onError(error)
            }
        }
        return responseSubject
    }
    
}
