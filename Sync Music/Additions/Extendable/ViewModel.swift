//
//  ViewModel.swift
//  Sync Music
//
//  Created by Maxence Mottard on 05/01/2021.
//

import Foundation
import Combine

struct EmptyParameters: Encodable {}
struct EmptyResponse: Decodable {}

class ViewModel: ObservableObject, Weakable {
    var bag = Set<AnyCancellable>()
    var error: Error?
    
    func executeRequest<T: WebService>(_ serviceSetup: ExecuteServiceSetup<T>, onSuccess: @escaping ((T.DecodedType) -> Void), onError: ((Error) -> Void)? = nil) {
        serviceSetup.service
            .call(serviceSetup.parameters, urlParameters: serviceSetup.urlParameters)
            .sink(receiveCompletion: weakify { strongSelf, result in
                switch result {
                case .finished:
                    break;
                case .failure(let error):
                    guard let executeOnError = onError else {
                        return strongSelf.handleError(error: error)
                    }

                    executeOnError(error)
                }
            }, receiveValue: { value in
                onSuccess(value)
            }).store(in: &bag)
    }
    
    func executeRequestWithoutDecode<T: WebService>(_ serviceSetup: ExecuteServiceSetup<T>, onSuccess: @escaping (() -> Void), onError: ((Error) -> Void)? = nil) {
        serviceSetup.service
            .callWithoutDecode(serviceSetup.parameters, urlParameters: serviceSetup.urlParameters)
            .sink(receiveCompletion: weakify { strongSelf, result in
                switch result {
                case .finished:
                    break;
                case .failure(let error):
                    guard let executeOnError = onError else {
                        return strongSelf.handleError(error: error)
                    }

                    executeOnError(error)
                }
            }, receiveValue: {
                onSuccess()
            }).store(in: &bag)
    }

    private func handleError(error: Error) {
        self.error = error
        print(error)
    }
    
    struct ExecuteServiceSetup<T: WebService> {
        let service: T
        let parameters: T.ServiceParameters
        let urlParameters: [String] = []
    }
}
