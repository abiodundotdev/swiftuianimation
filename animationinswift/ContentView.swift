//  ContentView.swift
//  animationinswift
//  Created by Qazeem Abiodun on 01/07/2023.

import SwiftUI

struct ContentView: View {
    @State private var isEnabled = false
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button(isEnabled ?  "press me" : "Unpress me"){
                isEnabled.toggle()
            }.animation(.easeInOut(duration: 1))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct User : Codable {
    var name : String
    var age : Int
}

//
//func fetchFilms(completionHandler: @escaping ([Film]) -> Void) {
//    let url = URL(string: "domainUrlString" + "films/")!
//    var request = URLRequest(url: url)
//    request.httpMethod = "GET"
//    request.httpBody =  Data()
//
//    let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
//      if let error = error {
//        print("Error with fetching films: \(error)")
//        return
//      }
//
//      guard let httpResponse = response as? HTTPURLResponse,
//            (200...299).contains(httpResponse.statusCode) else {
//        print("Error with the response, unexpected status code: \(response)")
//        return
//      }
//
//      if let data = data,
//        let filmSummary = try? JSONDecoder().decode(FilmSummary.self, from: data) {
//        completionHandler(filmSummary.results ?? [])
//      }
//    })
//    task.resume()
//  }
//
//
//struct Film : Codable, Hashable, Identifiable{
//    var id: Int
//
//}


