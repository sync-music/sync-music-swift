//
//  ViewModel.swift
//  Sync Music
//
//  Created by Maxence Mottard on 05/01/2021.
//

import Foundation
import Combine

class ViewModel: ObservableObject, Weakable {
    var bag = Set<AnyCancellable>()
    var error: Error?
    
    func executeRequest<T>(_ publisher: AnyPublisher<T, Error>, onSuccess: @escaping ((T) -> Void), onError: ((Error) -> Void)?) {
        publisher
            .sink(receiveCompletion: weakify { strongSelf, result in
                switch result {
                case .finished:
                    break;
                case .failure(let error):
                    guard let executeOnError = onError else {
                        strongSelf.handleError(error: error)
                        return
                    }

                    executeOnError(error)
                }
            }, receiveValue: { value in
                onSuccess(value)
            }).store(in: &bag)
    }

    func executeRequest<T>(_ publisher: AnyPublisher<T, Error>, onSuccess: @escaping ((T) -> Void)) {
        executeRequest(publisher, onSuccess: onSuccess, onError: nil)
    }

    private func handleError(error: Error) {
        self.error = error
    }
}
