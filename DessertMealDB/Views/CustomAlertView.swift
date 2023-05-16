//
//  CustomAlertView.swift
//  DessertMealDB
//
//  Created by Parshva Shah on 5/16/23.
//

import SwiftUI

struct CustomAlertView: View {
    var title: String
    var message: String
    @Binding var showAlert: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black.opacity(0.4))
                .ignoresSafeArea()
            
            // Alert box
            VStack(spacing: 20) {
                Text("Custom Alert")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("This is a custom alert view.")
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    showAlert = false
                }) {
                    Text("OK")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 10)
        }
    }
}
