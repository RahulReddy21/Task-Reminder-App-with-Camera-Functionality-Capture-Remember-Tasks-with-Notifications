import SwiftUI

struct HomeCardView: View {
    
    @State private var isSelecting = false
    @State private var selectedCards = Set<Int>()
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(0..<4, id: \.self) { index in
                    CardView(
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
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if isSelecting {
                        NavigationLink(destination: CreateCardView()) {
                            Text("Done")
                        }
                    } else {
                        Button("Select") {
                            isSelecting.toggle()
                            if !isSelecting {
                                selectedCards.removeAll()
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    func cardTitle(for index: Int) -> String {
        switch index {
        case 0: return "Check the stove"
        case 1: return "Check the window"
        case 2: return "Lock the door"
        case 3: return "Check the plug"
        default: return ""
        }
    }
    
    func cardIconName(for index: Int) -> String {
        switch index {
        case 0: return "flame"
        case 1: return "window.casement"
        case 2: return "door.right.hand.closed"
        case 3: return "powerplug"
        default: return ""
        }
    }
}

struct SchedulePage: View {
    var body: some View {
        Text("Schedule Page")
            .font(.largeTitle)
            .navigationTitle("Schedule")
    }
}

struct CardView: View {
    let title: String
    let iconName: String
    let isSelected: Bool
    let isSelecting: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.purple))
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
                
                Spacer()
                
                Image(systemName: iconName)
                    .foregroundStyle(Color.red)
                    .padding(.trailing, 10)
            }
            .padding()
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    HomeCardView()
}
