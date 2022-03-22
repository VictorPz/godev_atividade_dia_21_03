//
//  ApiService.swift
//  consumo_api_aula_21_03
//
//  Created by Victor Pizetta on 21/03/22.
//

import UIKit

enum apiError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvailable
}

protocol getService {
    func getPersons(completion: @escaping (Result<[Persons], apiError >) -> Void)
}

class ApiService: getService {
    
    let session = URLSession.shared
    let url = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    
    static var shared: ApiService {
        let apiInstance = ApiService()
        return apiInstance
    }
    
    func getPersons(completion: @escaping (Result<[Persons], apiError>) -> Void) {
        
        guard let url = URL(string: url) else {return completion(.failure(.urlInvalid))}
        
        let dataTask = session.dataTask(with: url) { data, _ , _ in
            
            do {
                
                guard let jsonData = data else { return completion(.failure(.noDataAvailable)) }
                
                let decoder = JSONDecoder()
                let userResponse = try decoder.decode([Persons].self, from: jsonData)
                
                completion(.success(userResponse))
                
                
            } catch {
                completion(.failure(.noProcessData))
            }
            
        }
        
        dataTask.resume()
    }
}
