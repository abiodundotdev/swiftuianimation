//
//  NetworkCall.swift
//  animationinswift
//
//  Created by Qazeem Abiodun on 02/08/2023.
//

import Foundation
import SwiftUI

struct NetworkCallView :  View {
    @State private var product : Product?
    
    var body : some View {
        VStack{
            Text("WELCOME TO THE FIEST SCREEN")
            Text(product?.description ?? "N/A")
            Text(product?.price ?? "N/A")
            Text(product?.title ?? "N/A")
            Button("Tap me to make a call"){
                Task{
                    do{
                        let _product = try await getProducts()
                        product = _product
                    } catch NetworkError.invalidData {
                        print("Invalid data type")
                    } catch NetworkError.reponseError {
                        print("repomse error")
                    } catch NetworkError.urlError {
                        print("url error")
                    }
                }
            }
        }
        
    }
    
    
    func getProducts() async throws -> Product {
        
        guard let url = URL(string: Endpoints.baseUrl) else {
            throw NetworkError.urlError
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.reponseError
        }
        
        do{
            let decoder = JSONDecoder()
            return try decoder.decode(Product.self, from: data)
        } catch{
            throw NetworkError.invalidData
        }
    }
    
    func getPicture(_ imageUrl : String) async throws -> Picture{
        guard let url = URL(string: imageUrl) else { throw NetworkError.urlError}
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.reponseError
        }
        
        do{
            let decoder = JSONDecoder()
            return try decoder.decode(Picture.self, from: data)
        } catch{
            throw NetworkError.invalidData
        }
        
    }
    
    func getGroupOfPictures(_ pictures : [String]) async throws -> [Picture]{
        let calender = Calendar.current
}



struct NetworkCallViewPreview : PreviewProvider {
    static var previews: some View {
        NetworkCallView()
    }
}


enum NetworkError : Error{
    case urlError
    case reponseError
    case invalidData
}

struct Product : Codable{
    var id : Int
    var title : String
    var price : String
    var category : String
    var description : String
    var image : String
}


struct Picture : Codable{
    var id : Int
    var name : String
    var description : String
    var image : String
}
