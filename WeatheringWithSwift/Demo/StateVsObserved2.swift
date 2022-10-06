//
//  RandomNumberView.swift
//  WeatheringWithSwift
//
//  Created by aldo.wahyudi on 06/10/22.
//

import SwiftUI

struct RandomNumberView2: View {
    @State var randomNumber = 0
    @StateObject var viewModel = CounterViewModel2()
    
    var body: some View {
        VStack {
            Text("Random number is: \(randomNumber)")
            Button("Randomized number") {
                randomNumber = (0..<1_000).randomElement()!
            }.padding(.bottom, 30)
            CounterView2(viewModel: viewModel)
        }.padding(.bottom)
    }
}

struct RandomNumberView_Previews2: PreviewProvider {
    static var previews: some View {
        RandomNumberView2()
    }
}

struct CounterView2: View {
    @ObservedObject var viewModel: CounterViewModel2
    
    var body: some View {
        VStack {
            Text("Count is: \(viewModel.count)")
            Button("Increment Counter") {
                viewModel.incrementCounter()
            }
        }
    }
}

final class CounterViewModel2: ObservableObject {
    @Published var count = 0
    
    func incrementCounter() {
        count += 1
    }
}
