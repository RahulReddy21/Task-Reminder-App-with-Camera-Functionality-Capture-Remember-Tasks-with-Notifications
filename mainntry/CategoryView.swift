//
//  CategoryView.swift
//  mainntry
//
//  Created by Palle Supriya on 15/11/24.
//

//
//  CategoryView.swift
//  design
//
//  Created by Irem Nur Arslaner on 12/11/24.
//

                
                
                
                
                
import SwiftUI

struct CategoryView: View {
    @State private var selectedTab: CategoryTab = .all
    @State private var isShowingAddCategoryModal = false

    enum CategoryTab {
        case all, completed
    }

    var body: some View {
        NavigationStack {
            VStack {
                // Custom Tab Switcher for "All Categories" and "Completed Categories"
                HStack {
                    Button(action: {
                        selectedTab = .all
                    }) {
                        Text("All Categories")
                            .bold()
                            .padding()
                            .foregroundColor(selectedTab == .all ? .blue : .gray)
                            .background(selectedTab == .all ? Color.gray.opacity(0.2) : Color.clear)
                            .cornerRadius(8)
                    }

                    Button(action: {
                        selectedTab = .completed
                    }) {
                        Text("Completed Tasks")
                            .bold()
                            .padding()
                            .foregroundColor(selectedTab == .completed ? .blue : .gray)
                            .background(selectedTab == .completed ? Color.gray.opacity(0.2) : Color.clear)
                            .cornerRadius(8)
                    }
                }
                .padding(.top)

                // Display content based on selected tab
                if selectedTab == .all {
                    AllCategoriesContent(isShowingAddCategoryModal: $isShowingAddCategoryModal)
                } else {
                    CompletedCategoriesContent()
                }

                Spacer()
            }
            .sheet(isPresented: $isShowingAddCategoryModal) {
                AddNewCategory()
            }
            .navigationTitle("Categories")
            .toolbar {
                // "+" button in the navigation bar
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingAddCategoryModal = true
                    })
                    {
                        Image(systemName: "plus")
                            .font(.system(size: 20))
                            
                        
                            
                    }
                }
            }
        }
    }
}

// Content for "All Categories" tab
struct AllCategoriesContent: View {
    @Binding var isShowingAddCategoryModal: Bool

    var body: some View {
        VStack {
            // Home Category Section
            NavigationLink(destination: HomeCardView()) {
                HStack {
                    Text("Home").bold()
                   
                    Image(systemName: "chevron.forward")
                }
                .padding(.trailing,250)
               
                
            }
            .foregroundColor(.blue)

            CategoryCardView(backgroundColor: .purple.opacity(0.2), items: [
                ("flame.fill", "Stove", .red),
                ("window.casement", "Window", .red),
                ("powerplug.fill", "Plug", .red)
            ], isShowingAddCategoryModal: $isShowingAddCategoryModal)

            // Office Category Section
            NavigationLink(destination: OfficeCardView()) {
                HStack {
                    Text("Office").bold()
                    
                    Image(systemName: "chevron.forward")
                }
                .padding(.trailing,250)
            }
            .foregroundColor(.blue)

            CategoryCardView(backgroundColor: .orange.opacity(0.3), items: [
                ("paperplane.fill", "Delivery", .black),
                ("square.and.arrow.up.badge.clock.fill", "Badge-in", .black)
            ], isShowingAddCategoryModal: $isShowingAddCategoryModal)

            // Add New Category Section
    

            
            
        }
    }
}

// Content for "Completed Categories" tab
struct CompletedCategoriesContent: View {
    var body: some View {
        VStack {
            Text("Completed tasks will appear here.")
                .font(.headline)
                .foregroundColor(.gray)
                .padding()

            Spacer()
        }
    }
}

// Reusable category card view
struct CategoryCardView: View {
    var backgroundColor: Color
    var items: [(image: String, title: String, color: Color)]
    @Binding var isShowingAddCategoryModal: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .fill(backgroundColor)
                .frame(width: 360, height: 170)

            HStack {
                ForEach(items, id: \.title) { item in
                    VStack {
                        Image(systemName: item.image)
                            .font(.system(size: 35))
                            .foregroundColor(item.color)
                        if !item.title.isEmpty {
                            Text(item.title)
                        }
                    }
                    .padding()
                }

                Image(systemName: "plus")
                    .font(.system(size: 35))
                    .padding(.top, -20)
                    .onTapGesture {
                        isShowingAddCategoryModal = true
                    }
            }
        }
        .padding(.horizontal)
    }
}

// Detail view for each category
struct CategoryDetailView: View {
    let category: String

    var body: some View {
        Text("\(category) Details")
            .navigationTitle(category)
    }
}

// Modal for adding a new category
struct NewCategoryModal: View {
    @Environment(\.dismiss) var dismiss
    @Binding var categories: [String]
    @State private var newCategoryName = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Category Name", text: $newCategoryName)
            }
            .navigationTitle("Add New Category")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if !newCategoryName.isEmpty {
                            categories.append(newCategoryName)
                        }
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    CategoryView()
}
