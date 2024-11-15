//
//  Timer.swift
//  mainntry
//
//  Created by Palle Supriya on 13/11/24.
//

import SwiftUI
import UserNotifications

struct CreateCardView: View {
    @State private var selectedSchedule = "Daily" // Toggle between Daily, Weekly, and Specific Date
    @State private var selectedDay = "Monday"     // Default day for Weekly
    @State private var leavingHomeTime = Date()   // Date for Leaving Home
    @State private var returningHomeTime = Date() // Date for Returning Home
    @State private var specificDate = Date()      // Date for Specific Date selection
    @State private var isSaved = false            // Track if "Save" has been tapped
    @State private var isSaveButtonDisabled = false // Track if Save button is disabled
    @State private var saveButtonColor = Color.blue // Track button color change
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button("Cancel") {
                        // Cancel action (no action needed in this example)
                    }
                    Spacer()
                    Text("Create a Reminder")
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        // Handle Save Button Tap
                        isSaved = true                  // Set state to true when saved
                        isSaveButtonDisabled = true     // Disable save button after it's tapped
                        saveButtonColor = Color.green   // Change the button color to green
                        scheduleNotifications()         // Call the scheduling function
                        
                        // Reset the indicator after a short delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isSaved = false
                            saveButtonColor = Color.blue
                            dismiss
                        }
                    }) {
                        Text(isSaved ? "Saved" : "Save")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 80, maxHeight: 30)
                            .background(saveButtonColor)
                            .cornerRadius(8)
                    }
                    .disabled(isSaveButtonDisabled)
                }
                .padding(.horizontal)
                .padding(.top)
                
                VStack {
                    Text("Schedule")
                        .font(.title2)
                        .padding(.top)
                    
                    // Schedule Toggle (Daily / Weekly / Specific Date)
                    HStack(spacing: 20) {
                        Button(action: { selectedSchedule = "Daily" }) {
                            Text("Daily")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedSchedule == "Daily" ? Color.blue : Color.blue.opacity(0.3))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        Button(action: { selectedSchedule = "Weekly" }) {
                            Text("Weekly")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedSchedule == "Weekly" ? Color.blue : Color.blue.opacity(0.3))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        Button(action: { selectedSchedule = "Specific Date" }) {
                            Text("Specific Date")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedSchedule == "Specific Date" ? Color.blue : Color.blue.opacity(0.3))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    // Weekly Schedule Picker
                    if selectedSchedule == "Weekly" {
                        Text("Choose your day!")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        
                        Picker("Day", selection: $selectedDay) {
                            ForEach(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"], id: \.self) { day in
                                Text(day).tag(day)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    }
                    
                    // Specific Date Picker
                    if selectedSchedule == "Specific Date" {
                        Text("Choose a specific date!")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        
                        DatePicker("Select Date", selection: $specificDate, displayedComponents: .date)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    
                    // Leaving Home Time Picker
                    Text("Leaving Home")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    DatePicker("Time", selection: $leavingHomeTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .onChange(of: leavingHomeTime) {
                            isSaveButtonDisabled = false
                        }
                    
                    // Returning Home Time Picker
                    Text("Returning Home")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    DatePicker("Time", selection: $returningHomeTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .onChange(of: returningHomeTime) {
                            isSaveButtonDisabled = false
                        }
                    
                    Spacer()
                }
                .background(Color.white.opacity(0.2))
                .cornerRadius(20)
                .padding()
            }
            .background(Color.white.opacity(0.6).edgesIgnoringSafeArea(.all))
        }
    }
    
    // Function to schedule notifications based on the selected times
    func scheduleNotifications() {
        let notificationCenter = UNUserNotificationCenter.current()
        
        // Configure notifications for leaving and returning times
        let contentLeaving = UNMutableNotificationContent()
        contentLeaving.title = "Reminder"
        contentLeaving.body = "Hey, are you leaving? Don't forget to check the things you have to do!"
        contentLeaving.sound = .default
        
        let contentReturning = UNMutableNotificationContent()
        contentReturning.title = "Reminder"
        contentReturning.body = "Hey, did you return? Don't forget to check the things you have to do!"
        contentReturning.sound = .default
        
        let triggerLeaving = createTrigger(for: leavingHomeTime)
        let triggerReturning = createTrigger(for: returningHomeTime)
        
        let requestLeaving = UNNotificationRequest(identifier: UUID().uuidString, content: contentLeaving, trigger: triggerLeaving)
        let requestReturning = UNNotificationRequest(identifier: UUID().uuidString, content: contentReturning, trigger: triggerReturning)
        
        // Schedule the notifications
        notificationCenter.add(requestLeaving) { error in
            if let error = error {
                print("Error scheduling leaving notification: \(error.localizedDescription)")
            } else {
                print("Leaving notification scheduled successfully.")
            }
        }
        
        notificationCenter.add(requestReturning) { error in
            if let error = error {
                print("Error scheduling returning notification: \(error.localizedDescription)")
            } else {
                print("Returning notification scheduled successfully.")
            }
        }
    }
    
    // Function to create notification trigger based on selected schedule type
    func createTrigger(for date: Date) -> UNCalendarNotificationTrigger {
        var triggerDate = Calendar.current.dateComponents([.hour, .minute], from: date)
        
        if selectedSchedule == "Weekly" {
            // Set weekday component for weekly reminders
            triggerDate.weekday = Calendar.current.weekdaySymbols.firstIndex(of: selectedDay)! + 1
        } else if selectedSchedule == "Specific Date" {
            // Set year, month, and day components for specific date
            let specificTriggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: specificDate)
            triggerDate.year = specificTriggerDate.year
            triggerDate.month = specificTriggerDate.month
            triggerDate.day = specificTriggerDate.day
            triggerDate.hour = specificTriggerDate.hour
            triggerDate.minute = specificTriggerDate.minute
        }
        
        return UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: selectedSchedule == "Daily" || selectedSchedule == "Weekly")
    }
}

#Preview {
    CreateCardView()
}

