

import SwiftUI

struct AddNewCategory: View {
    var body: some View {
        
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.purple))
                    .frame(width: 360, height: 80)
                
                Image(systemName: "plus")
                    .font(.system(size: 40))
                
            }
                .padding(.top, -300)
                .navigationTitle("Title")
        }
    }
}

#Preview {
    AddNewCategory()
}
