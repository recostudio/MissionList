//
//  ApiManager.swift
//  MissionList
//
//  Created by Maciej Szostak on 15/11/2021.
//

import Foundation
import Alamofire

class ApiManager {
    
    enum ApiError: Error {
        case unknown
    }
    
    let baseUrl = "https://api.spacexdata.com/"
    
    
    func fetchMissions(_ completion: @escaping (_ result: Result<[Mission], Error>) -> Void) {
        
        let request = AF.request("https://api.spacexdata.com/v3/missions").response {data in
            print(data)
            
            guard let data = data.data else {
                completion(.failure(data.error ?? ApiError.unknown))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let missions = try decoder.decode([Mission].self, from: data)
                print(missions)
                completion(.success(missions))
            } catch {
                print(error)
                completion(.failure(error))
            }
            
            
        } // jak znam strukture/model wtedy uzywam i robimy decodable
        //        let request2 = AF.request("https://api.spacexdata.com/v3/missions").responseJSON{data in print(data) } //deprecated chyba ze nie znamy kluczy do struktury
        //    let request = AF.request("https://api.spacexdata.com/v3/missions").response {response in debugPrint(response)
        //        print(response)
        
    }
    
}
