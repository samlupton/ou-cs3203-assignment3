import SwiftUI

struct ContentView: View {
    @State private var numbersInput: String = ""
    @State private var sumResult: Int? = nil
    @State private var productResult: Int? = nil
    @State private var reversedNumbers: [Int] = []

    var body: some View {
        VStack {
            Text("Enter numbers separated by commas (e.g., 1,2,3):")
                .padding()

            TextField("1,2,3", text: $numbersInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            HStack {
                Button(action: calculateSum) {
                    Text("Calculate Sum")
                        .padding()
                }
                .disabled(numbersInput.isEmpty)

                Button(action: calculateProductAndReverse) {
                    Text("Calculate Product and Reverse")
                        .padding()
                }
                .disabled(numbersInput.isEmpty)
            }

            if let sumResult = sumResult {
                Text("Sum: \(sumResult)")
                    .padding()
            }

            if let productResult = productResult {
                Text("Product: \(productResult)")
                    .padding()
            }

            if !reversedNumbers.isEmpty {
                Text("Reversed Numbers: \(reversedNumbers.map(String.init).joined(separator: ","))")
                    .padding()
            } // button add for part 6
        }
    }

    func calculateSum() {
        let numberStrings = numbersInput.split(separator: ",").map { String($0) }
        let numbers = numberStrings.compactMap { Int($0) }
        let sum = numbers.reduce(0, +)
        sumResult = sum
        reverseNumbers()
    }

    func calculateProductAndReverse() {
        let numberStrings = numbersInput.split(separator: ",").map { String($0) }
        let numbers = numberStrings.compactMap { Int($0) }
        let product = numbers.reduce(1, *)
        productResult = product
        reverseNumbers()
    }

    func reverseNumbers() {
        let numberStrings = numbersInput.split(separator: ",").map { String($0) }
        let numbers = numberStrings.compactMap { Int($0) }
        reversedNumbers = numbers.reversed()
    }
}
