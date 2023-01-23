//
//  ContentView.swift
//  CarCustomiser
//
//  Created by MIKHAEL LUKYANOV on 16/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var  selectedCar: Int = 0

    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var nitroPackage = false
    @State private var enginePackage = false
    @State private var remainingFunds = 1000
    @State private var remainingTime = 30
    
    var exhaustPackageEnabled: Bool {
        return remainingTime <= 0 ? false : exhaustPackage ? true : remainingFunds >= 500 ? true: false
    }
    var tiresPackageEnabled: Bool {
        return remainingTime <= 0 ? false :tiresPackage ? true : remainingFunds >= 350 ? true: false
    }
    var nitroPackageEnabled: Bool {
        return remainingTime <= 0 ? false :nitroPackage ? true : remainingFunds >= 750 ? true: false
    }
    var enginePackageEnabled: Bool {
        return remainingTime <= 0 ? false :enginePackage ? true : remainingFunds >= 1500 ? true: false
    }

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
        var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (
            get: {self.exhaustPackage},
            set: {newValue in self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 1
                    remainingFunds -= 500
                }
                else {
                    starterCars.cars[selectedCar].acceleration += 1
                    remainingFunds += 500
                }
            }
        )
        let tiresPackageBinding = Binding<Bool> (
            get: {self.tiresPackage},
            set: {newValue in self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 350
                }
                else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 350
                }
            }
        )
        let nitroPackageBinding = Binding<Bool> (
            get: {self.nitroPackage},
            set: {newValue in self.nitroPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 20
                    remainingFunds -= 750
                }
                else {
                    starterCars.cars[selectedCar].topSpeed -= 20
                    remainingFunds += 750
                }
            }
        )
        let enginePackageBinding = Binding<Bool> (
            get: {self.enginePackage},
            set: {newValue in self.enginePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 1.2
                    remainingFunds -= 1500
                }
                else {
                    starterCars.cars[selectedCar].acceleration += 1.2
                    remainingFunds += 1500
                }
            }
        )
            VStack {
                Text("\(remainingTime)")
                    .onReceive(timer) { _ in
                        if self.remainingTime > 0 {
                            self.remainingTime -= 1
                        }

                                
                    }
                    .foregroundColor(.red)
                Form {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("\(starterCars.cars[selectedCar].displayStats())")
                        
                        Button("Next Car", action: {
                            if selectedCar >= starterCars.cars.count-1 {
                                selectedCar = 0
                                resetDisplay()
                            }
                            else {
                                selectedCar += 1
                                resetDisplay()
                            }
                        })
                        .disabled(remainingTime <= 0)
                    }
                    Section {
                        Toggle("Exhaust Package (Cost: 500)", isOn: exhaustPackageBinding)
                            .disabled(!exhaustPackageEnabled)
                        Toggle("Tires Package (Cost: 350)", isOn: tiresPackageBinding)
                            .disabled(!tiresPackageEnabled)
                        Toggle("Nitro Package (Cost: 750)", isOn: nitroPackageBinding)
                            .disabled(!nitroPackageEnabled)
                        Toggle("Engine Package (Cost: 1500)", isOn: enginePackageBinding)
                            .disabled(!enginePackageEnabled)
                    }
                }
                Text("Remaining Funds: \(remainingFunds)")
                    .foregroundColor(.red)
                    .baselineOffset(20)
            }
    }
    
    func resetDisplay() {
        remainingFunds = 100
        exhaustPackage = false
        tiresPackage = false
        nitroPackage = false
        enginePackage = false
        starterCars = StarterCars()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
