//
//  FirstPage.swift
//  mainntry
//
//  Created by Palle Supriya on 15/11/24.
//

//
//  ContentView.swift
//  design
//
//  Created by Irem Nur Arslaner on 11/11/24.
//

import SwiftUI

struct FirstPage: View {
    var body: some View {
        VStack {
            
            NavigationStack {
                
                ZStack{
                    
                    Image(.boy)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 900, height: 350)
                        .padding()
                    
                    Image(systemName: "circle.dotted")
                        .foregroundStyle(Color.label)
                        .font(.system(size: 350))
                    
                    Image(systemName: "house.fill")
                        .foregroundStyle(Color.red)
                        .font(.system(size: 50))
                        .padding(.trailing, 290)
                        .padding(.top, -100)
                    
                    Image(systemName: "pawprint.circle.fill")
                        .foregroundStyle(Color.green)
                        .font(.system(size: 50))
                        .padding(.leading, 290)
                        .padding(.top, 140)
                    
                    Image(systemName: "figure.run.circle.fill")
                        .foregroundStyle(Color.orange)
                        .font(.system(size: 50))
                        .padding(.leading, 260)
                        .padding(.top, -130)
                    
                    
                    Image(systemName: "desktopcomputer")
                        .foregroundStyle(Color.blue)
                        .font(.system(size: 50))
                        .padding(.trailing, 260)
                        .padding(.top, 190)
                    
                    
                    
                    
                }
                Spacer()
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 150, height: 50)
                        .foregroundStyle(Color.label)
                   
                    NavigationLink (destination: onboarding())  {
                    
                    Text("Start")
                        .bold()
                        .foregroundStyle(Color.blue)
                    
                }
                    
                }
                    
                ZStack{
                 
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 370, height: 90)
                        .foregroundStyle(Color.label)
                    
                    Text("Check your responsibitiles with proofs to remember and relax !")
                        .italic()
                    
                }
                
                .padding(.top, -230)
                .navigationTitle("Did I ?")
            }
        }
        
        .padding()
    }
}

#Preview {
    FirstPage()
}
