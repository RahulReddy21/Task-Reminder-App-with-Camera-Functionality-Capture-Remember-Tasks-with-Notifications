//
//  onboarding.swift
//  mainntry
//
//  Created by Palle Supriya on 15/11/24.
//

//
//  onboarding.swift
//  design
//
//  Created by Irem Nur Arslaner on 11/11/24.
//

import SwiftUI

struct onboarding: View {
    var body: some View {
        
        VStack {
            
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 350, height: 90)
                    .foregroundStyle(Color.label)
                
                Text("Set your schedule for your tasks")
                 .italic()
            }
            
            
            
            
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 25, height: 25)
                .foregroundStyle(Color.label)
                .padding(.leading, 220)
                .padding(.top, -15)
            
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 25, height: 25)
                .foregroundStyle(Color.label)
                .padding(.leading, 150)
                .padding(.top, -20)
            
            
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 25, height: 25)
                .foregroundStyle(Color.label)
                .padding(.leading, 70)
                .padding(.top, -20)
            
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 350, height: 90)
                    .foregroundStyle(Color.apppurple)
                
                Text("Chose your card and edit it")
                 .italic()
            }
            
            
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 25, height: 25)
                .foregroundStyle(Color.apppurple)
                .padding(.trailing, 220)
                .padding(.top, -15)
            
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 25, height: 25)
                .foregroundStyle(Color.apppurple)
                .padding(.trailing, 150)
                .padding(.top, -20)
            
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 25, height: 25)
                .foregroundStyle(Color.apppurple)
                .padding(.trailing, 70)
                .padding(.top, -20)
            
           
            
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 350, height: 90)
                    .foregroundStyle(Color.green)
                
                Text("Complete your tasks with proofs")
                 .italic()
            }
            
            
            
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 25, height: 25)
                .foregroundStyle(Color.green)
                .padding(.leading, 220)
                .padding(.top, -15)
            
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 25, height: 25)
                .foregroundStyle(Color.green)
                .padding(.leading, 150)
                .padding(.top, -20)
            
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 25, height: 25)
                .foregroundStyle(Color.green)
                .padding(.leading, 70)
                .padding(.top, -20)
            
           
            
        ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 370, height: 90)
                    .foregroundStyle(Color.apporange)
                
                Text("Be sure YOU DID it and relax !")
                 .italic()
            }
      
       
        
            ZStack {
                
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 150, height: 50)
                    .foregroundStyle(Color.label)
              
                NavigationLink (destination: EmpyCardView())  {
                    Text("Start")
                        .bold()
                        .foregroundStyle(Color.blue)
                    
                }
                
            }
            .padding()
            
        }
    }
}

#Preview {
    onboarding()
}
