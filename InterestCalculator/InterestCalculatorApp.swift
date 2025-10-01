//
//  InterestCalculatorApp.swift
//  InterestCalculator
//
//  Created by Cenk Bilgen on 2025-09-30.
//

import SwiftUI

@main
struct InterestCalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var principal: Double = 0
    @State private var interestRate: Double = 0
    @State private var duration: Double = 0   // Slider works best with Double
    
    var canCalculate: Bool {
        principal > 0 && interestRate > 0 && duration > 0
    }
    
    var calculatedInterest: Double {
        principal * (interestRate / 100) * duration
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Interest Calculator")
                    .font(.title)
                    .bold()
                
                if canCalculate {
                    Text("Calculated Interest: \(calculatedInterest.formatted(.currency(code: Locale.current.currency?.identifier ?? "USD")))")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.top, 20)
                } else {
                    Text("Enter all values to calculate")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.top, 20)
                }
                
                // Clear button
                Button(role: .destructive) {
                    principal = 0
                    interestRate = 0
                    duration = 0
                } label: {
                    Text("Clear")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .opacity(principal.isZero && interestRate.isZero && duration.isZero ? 0 : 1)
                .padding(.top, 10)
                
                // Principal with locale currency
                TextField("Principal",
                          value: $principal,
                          format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(principal <= 0 ? Color.red : Color.clear, lineWidth: 1))
                
                // Interest Rate as percentage
                TextField("Interest Rate",
                          value: $interestRate,
                          format: .percent.precision(.fractionLength(0...2)))
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(interestRate <= 0 ? Color.red : Color.clear, lineWidth: 1))
                
                // Duration as a slider
                VStack {
                    Text("Duration: \(Int(duration)) years")
                        .font(.subheadline)
                    Slider(value: $duration, in: 0...50, step: 1)
                }
                .padding(.vertical)
              
            }
            .padding()
        }
    }
}
