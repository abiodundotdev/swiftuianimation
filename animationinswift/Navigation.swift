//
//  Navigation.swift
//  animationinswift
//
//  Created by Qazeem Abiodun on 27/07/2023.
//

import Foundation
import SwiftUI

struct Navigation : View {
    @State private var isOn : Bool = true
    @State private var showingCredits = false
    
    var pages : [String] = ["Page 1", "Page Two", "Page three"]
    var body  : some View {
        NavigationStack(){
            LazyVStack(){
                NavigationLink("Page one"){
                    PageOne()
                }
                NavigationLink("Page two"){
                    PageTwoo()
                }
                NavigationLink("Page three"){
                    PageThree()
                }
                Toggle("Wi-Fi", isOn: $isOn)
                
                Button("Show Credits") {
                           showingCredits.toggle()
                       }
                       .sheet(isPresented: $showingCredits) {
                           Text("This app was brought to you by Hacking with Swift")
                               .presentationDetents([.medium, .large])
                       }
                Spacer().frame(height: 20.0)
                
                VStack {
                    NavigationLink("Go to screen 1", value: "1")
                    Spacer().frame(height: 10)
                    NavigationLink("Go to screen 2", value: "2")
                   }.navigationDestination(for: String.self) { value in
                    Text("This is screen number \(value)")
                   }
               
            }.navigationTitle("Home screen")
        }.navigationViewStyle(.stack)
    }
    
    func getUser () -> [String]{
        return ["hello"]
    }
}


struct NavigationPreview : PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}





struct PageOne : View {
    var body  : some View {
        Text("Page one").navigationTitle("Page one")
    }
}



struct PageTwoo : View {
    var body  : some View {
            Text("Page Two").navigationTitle("Page two")
    }
}


struct PageThree : View {
    var body  : some View {
            Text("Page three").navigationTitle("Page three")
    }
}



struct Person: Hashable, Identifiable{
    var name : String
    var id : Int
    var age : Int
    var schoolName : String
}
