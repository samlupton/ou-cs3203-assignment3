import SwiftUI

struct ContentView: View {
    @State private var numbersInput: String = ""
    @State private var result: Int? = nil

    var body: some View {
        VStack {
            Text("Enter numbers separated by commas (e.g., 1,2,3):")
                .padding()

            TextField("1,2,3", text: $numbersInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: calculateSum) {
                Text("Calculate Sum")
                    .padding()
            }

            if let result = result {
                Text("Sum: \(result)")
                    .padding()
            }
        }
    }

    func calculateSum() {
        let numberStrings = numbersInput.split(separator: ",").map { String($0) }
        let numbers = numberStrings.compactMap { Int($0) }
        let sum = numbers.reduce(0, +)
        result = sum
    }
}
