//
//  OfficeCardView.swift
//  mainntry
//
//  Created by Palle Supriya on 15/11/24.
//

//
//  OfficeCardView.swift
//  design
//
//  Created by Irem Nur Arslaner on 11/11/24.
//

import SwiftUI

struct OfficeCardView: View {
    
    @State private var isSelecting = false
    @State private var selectedCards = Set<Int>()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ForEach(0..<3, id: \.self) { index in
                    OfficeCard(
                        title: cardTitle(for: index),
                        iconName: cardIconName(for: index),
                        isSelected: selectedCards.contains(index),
                        isSelecting: isSelecting
                    )
                    .onTapGesture {
                        if isSelecting {
                           
                            if selectedCards.contains(index) {
                                selectedCards.remove(index)
                            } else {
                                selectedCards.insert(index)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Office")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(isSelecting ? "Done" : "Select") {
                        
                        isSelecting.toggle()
                        if !isSelecting {
                            selectedCards.removeAll()
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    
    func cardTitle(for index: Int) -> String {
        switch index {
        case 0: return "Check Delivery"
        case 1: return "Check badge-in"
        case 2: return "Create your card.."
        default: return ""
        }
    }
    
    func cardIconName(for index: Int) -> String {
        switch index {
        case 0: return "paperplane.fill"
        case 1: return "square.and.arrow.up.badge.clock.fill"
        case 2: return ""
        default: return ""
        }
    }
}

struct OfficeCard: View {
    let title: String
    let iconName: String
    let isSelected: Bool
    let isSelecting: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("apporange"))
                .frame(width: 360, height: 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
                )
            
            HStack {
                if isSelecting {
                    Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(isSelected ? .blue : .gray)
                        .padding(.leading, 10)
                }
                
                Text(title)
                    .bold()
                    .opacity(title == "Create your card.." ? 0.4 : 1.0) // Grey out last card text
                
                Spacer()
                
                if !iconName.isEmpty {
                    Image(systemName: iconName)
                        .foregroundColor(.black)
                        .padding(.trailing, 10)
                }
            }
            .padding()
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    OfficeCardView()
}
