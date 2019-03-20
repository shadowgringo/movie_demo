//
//  DataProvider.swift
//  Movies
//
//  Created by Mathieu Villeneuve on 2019-03-19.
//  Copyright © 2019 none. All rights reserved.
//

import RxSwift

class DataProvider {

    // MARK: - Private Properties
    private let baseURL = URL(string: "https://api.themoviedb.org/")!
    
    // MARK: - Function
    func send<T: Codable>(apiRequest: APIRequest, entityType: T.Type) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: self.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observer.onNext(model)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
