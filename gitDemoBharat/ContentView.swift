//
//  ContentView.swift
//  gitDemoBharat
//
//  Created by Bharat on 24/01/20.
//  Copyright © 2020 Bharat. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
     @State var name: String = ""
       @State var password: String = ""
       @State var alertIsVisible = false
       @State private var show_modal: Bool = false
       @State var selection : Int? = nil


       var body: some View {
       
               NavigationView{
                   
                   ScrollView(.vertical){
                       ZStack{

                           
                           VStack {
                       Spacer(minLength: 200)
                       Image("Pigeon-PNG-Image")
                           .resizable()
                           .frame(width: 150, height: 150, alignment: .center)
                       
                       VStack(alignment:.leading) {
                           Text("Username")
                                 .font(.callout)
                               .bold()
                           TextField("Enter username...", text: $name)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                       }.padding(10)
                         
                       VStack(alignment:.leading) {
                           Text("Password")
                                 .font(.callout)
                               .bold()
                           SecureField("Enter Password...", text:$password)
                              .font(.system(size: 18))
                              .textFieldStyle(RoundedBorderTextFieldStyle())

                       }.padding(10)
                       
               NavigationLink(destination: Text("hello"),tag: 1,selection: $selection) {
                   
                   Button(action: {
                       print("Delete tapped!")
                       if self.name != "" && self.password != "" {
                           self.selection = 1
                       }else{
                           self.selection = 0
                       }
                       if self.selection == 1 {
                           self.alertIsVisible = false
                       }
                       else{
                           self.alertIsVisible = true
                       }
                       }) {
                               Text("Login")
                                   .fontWeight(.semibold)
                                   .font(.title)
                           .frame(minWidth: 0, maxWidth: .infinity)
                           .padding()
                           .foregroundColor(.black)
                           .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]), startPoint: .leading, endPoint: .trailing))
                           .cornerRadius(40)
                           .padding(.horizontal, 20)
                           }.padding()
                       .alert(isPresented: self.$alertIsVisible) {
                         Alert(title: Text("Error"),
                               message: Text("Please enter required Details"),
                               dismissButton: .default(Text("Ok!")) {
                               }
                         )
                       }
                   }
                       
                       Spacer()

                   
                       HStack(alignment: .center){
                           Text("Have account ?")
                               .font(.headline)
                           NavigationLink(destination: Text("Bhartat")){
                               Text("Sign In")
                               .fontWeight(.semibold)
                                   .font(.body)
                               .cornerRadius(20)
                               .foregroundColor(.black)
                           }
                       }.padding(.bottom,20)

                   }
                   }
                   }.frame(minWidth: 0,maxWidth: .infinity)
                   .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.green]), startPoint: .leading, endPoint: .trailing))
                   .edgesIgnoringSafeArea(.all)
              
                   .navigationViewStyle(StackNavigationViewStyle())
                   .navigationBarTitle("TarakJaan")
               }
               
           }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
