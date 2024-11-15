//
//  CardBoardView.swift
//  mainntry
//
//  Created by Irem Nur Arslaner on 12/11/24.
//

import SwiftUI

struct CardBoardView: View {
    @Binding var imageData: Data?
    @State var textItem: String
    @State var iconName: String
    @State var date: Date?
    @Binding var notes: String

    var body: some View {
        VStack {
            
            
            
            HStack {
                Text("Check the \(textItem)")
                    .font(.title)
                    .fontWeight(.bold)
                Image(systemName: iconName)
            }
            .padding()
            
            HStack {
                Text("Proof")
                    .font(.title2)
                    .fontWeight(.thin)
                    .padding(.horizontal)
                Spacer()
            }
            
            if let imageData, let uiImage = UIImage(data: imageData) {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .fill(Color.gray.opacity(0.7))
                            .frame(width: 350, height: 350)
                            .padding(.trailing,-150)
                            .padding(.top, 150)
                        
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: 350, height: 350)
                            .padding(.trailing,-150)
                            .padding(.top, 150)
                    }
                    .frame(width: 200, height: 200)
                    .padding()
                    Spacer()
                }
                
                HStack {
                    if let date = date {
                        Text("Taken on \(formatDate(date))")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top, 4)
                            .padding(.horizontal)
                        
                    }
                    Spacer()
                }
            } else {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .fill(Color.gray.opacity(0.7))
                            .frame(width: 350, height: 350)
                            .padding(.trailing,-150)
                            .padding(.top, 150)
                        
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .padding(.trailing,-150)
                            .padding(.top, 150)
                    }
                    .frame(width: 200, height: 200)
                    .padding()
                    
                  
                 Spacer()
                }
            }
            
            Spacer()
            
            if imageData != nil {
                HStack {
                    Text("Notes")
                        .font(.title2)
                        .fontWeight(.thin)
                        .padding(.horizontal)
                    Spacer()
                }
                
                TextEditor(text: $notes)
                    .frame(width: 300, height: 100)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
                    .padding()
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                hideKeyboard()
                            }
                        }
                    }
            }
        }
        
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
