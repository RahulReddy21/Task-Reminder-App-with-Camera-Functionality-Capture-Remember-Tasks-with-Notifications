//
//  AddNewCategory.swift
//  mainntry
//
//  Created by Palle Supriya on 15/11/24.
//

//
//  AddNewCategory.swift
//  design
//
//  Created by Irem Nur Arslaner on 12/11/24.
//

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
