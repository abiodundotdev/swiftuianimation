//
//  Animation.swift
//  animationinswift
//
//  Created by Qazeem Abiodun on 06/07/2023.
//

import Foundation
import SwiftUI

struct AnimationView : View {
    @State private var isChange: Bool = false
    var body: some View {
        return NavigationView {
            HomePage().navigationTitle("Navigation")
        }.navigationBarItems(
            leading:
                Button("Add 1") {
                   print("Welcome")
                }, trailing: Button("Add 2"){
                    print("Tab2")
                }

            )
    }
}

struct HomePage : View  {
            var body: some View {
                VStack(alignment: HorizontalAlignment.leading, spacing: 30) {
                        Text("You're going to flip a coin – do you want to choose heads or tails?")
                        NavigationLink(destination: PageTwo(choice: "Heads")) {
                            Image(AppImages.appImage).resizable().frame(width: 100, height: 100, alignment: Alignment.topLeading)
                        }
                        NavigationLink(destination: PageTwo(choice: "Tails")) {
                            Text("Choose Tails")
                        }
                }.navigationTitle("Home page")
            }
}

struct PageTwo : View {
    var choice : String
    @State private var showBottomSheet: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body : some  View {
        VStack{
            Text("Welcome on board").animation(.easeIn)
            Button("Go back"){
                showBottomSheet.toggle()
               // presentationMode.wrappedValue.dismiss()
            }.sheet(isPresented: $showBottomSheet){
                Text("This app was brought to you by Hacking with Swift").presentationDetents([.medium, .large])
            }
            NavigationLink(destination: HomePage()) {
                Text("Back to homepage \(choice)")
            }
        }.navigationTitle("Page Two")
    }
    
func handleSubmit() -> Void {
            let name =  sayMyName(person: "Qazeem"){
                "WELCOME TO OUR MINI MART"
            }
            print(name)
            let name2 = MyClass.sayHi("Adelnai");
            print(name2)
        
    }
}



struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
       AnimationView()
    }
}


func sayMyName(person: String,  _ name: () -> String) -> String {
    print(name())
    
     return "Welcome \(person) your name i"
}

class MyClass{
  static func sayHi(_ name: String) ->  String{
      var shape = Shape(name: "Volume")
      var volume :  Volume  = .name
      var cat : Category = Category.nanny(con: true)
      shape.name = "Hello name"
      print(shape.volume)
      return  "I am saying Hi to \(name)"
  }
}


@propertyWrapper
struct ValueWrapper{
    private var number : Int = 0
    var wrappedValue: Int {
        get {12}
        set{number = min(newValue, number)}}
    
}


struct Volume{
    var width : Int
    var height :Int
    var depth : Int
    static var name: Volume  =  Volume(width: 2, height: 2, depth: 2)
}


struct Shape{
    var name : String
    var volume: Volume {
        print(name)
            return Volume(width: 2, height: 3, depth: 4)
    }
}

enum Category{
    case food, name, house
    case nanny(con : Bool)
    func getcat() -> Category {
        Category.food
    }
}
