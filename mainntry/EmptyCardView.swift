//
//  EmptyCardView.swift
//  mainntry
//
//  Created by Palle Supriya on 15/11/24.
//

//
//  EmpyCardView.swift
//  design
//
//  Created by Irem Nur Arslaner on 11/11/24.
//

import SwiftUI

struct EmpyCardView: View {
    var body: some View {
        
            NavigationStack {
                
                VStack{
                    
                   
                    
                    NavigationLink (destination: HomeCardView())  {
                        HStack{
                            
                            
                            Text("Home")
                                .bold()
                            
                            
                            
                            
                            Image(systemName: "chevron.forward")
                                .padding(.trailing, 290)
                            
                            
                        }
                    }
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 360, height: 150)
                            .foregroundStyle(Color.gray)
                            .opacity(0.4)
                        
                        
                        HStack {
                            
                            VStack{
                                
                                Image(systemName: "flame.fill")
                                    .font(.system(size: 35))
                                    .padding(.vertical , 5)
                                Text("Stove")
                            }
                            
                            .padding()
                            
                            VStack{
                                Image(systemName: "window.casement")
                                    .font(.system(size: 35))
                                
                                    .padding(.vertical , 5)
                                Text("Window")
                            }
                            
                            .padding()
                            
                            VStack{
                                
                                
                                Image(systemName: "powerplug.fill")
                                    .font(.system(size: 35))
                                    .padding(.vertical , 5)
                                Text("Plug")
                            }
                            .padding()
                            
                            Image(systemName: "plus")
                                .font(.system(size: 35))
                                .padding(.top,-20)
                            
                        }
                    }
                    
                    NavigationLink (destination: OfficeCardView())  {
                    HStack{
                        
                        
                        Text("Office")
                            .bold()
                        
                        
                        
                        
                        Image(systemName: "chevron.forward")
                            .padding(.trailing, 290)
                        
                        
                    }
                }

                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 360, height: 150)
                            .foregroundStyle(Color.gray)
                            .opacity(0.4)
                   
                        
                HStack {
                       
                    VStack{
                            
                        Image(systemName: "paperplane.fill")
                            .font(.system(size: 35))
                            .padding(.vertical , 5)
                            .padding(.trailing,60)
                           
                        Text("Delivery")
                            .padding(.trailing,50)
                            
                        }
                    
                  
                    
                    VStack{
                        Image(systemName: "square.and.arrow.up.badge.clock.fill")
                        .font(.system(size: 35))
                        .padding(.vertical , 5)
                        .padding(.trailing,50)
                        
                            Text("Badge-in")
                            .padding(.trailing,30)
                        }
                    
                    .padding()
                   
                   
                    
                    Image(systemName: "plus")
                        .font(.system(size: 35))

                    }
                }
                                        
                    HStack{
                    
                    
                    Text("Add new category")
                        .bold()
                       
                        
                        
                        
                        Image(systemName: "chevron.forward")
                            .padding(.trailing, 190)

                    
                }

                  
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 360, height: 150)
                            .foregroundStyle(Color.gray)
                            .opacity(0.4)
                   
                        
                HStack {
                       
                    
                    
                    Image(systemName: "plus")
                        .font(.system(size: 35))
                    
                   
                    }
                }


                    
        .navigationTitle("Choose your cards !")
                }
            }
        
    }
}

#Preview {
    EmpyCardView()
}
