import SwiftUI

struct ContentView: View {
    @State private var stepperValue = 0
    @State private var selectedSegment = 0
    @State private var textEditorText = ""
    @State private var isToggleOn = false
    @State private var sliderValue = 0.5
    @State private var isProgressBarAnimating = false
    @State private var progress: Double = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
          
            
            Text("Abdul Shaikh")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
            
            Button(action: {
                // Define your button action here
                print("Button tapped")
            }) {
                Text("Press Me")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            TextField("Enter text", text: $textEditorText)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
            
            Toggle(isOn: $isToggleOn) {
                Text("Toggle")
                    .foregroundColor(.black)
                    .padding()
            }
            .padding()
            
            Slider(value: $sliderValue, in: 0...1) {
                Text("Slider")
            }
            .padding()
            
            DatePicker(selection: .constant(Date()), label: {
                Text("Select a Date")
                    .foregroundColor(.black)
                    .padding()
            })
            .padding()
            
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                .padding()
            
            Picker(selection: $selectedSegment, label: Text("Segmented Control")) {
                Text("First").tag(0)
                Text("Second").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            TextEditor(text: $textEditorText)
                .frame(height: 100)
                .padding()
            
            
            ColorPicker("Pick a Color", selection: .constant(Color.red), supportsOpacity: true)
                .padding()
        }
        .onReceive(timer) { _ in
            guard isProgressBarAnimating else { return }
            progress += 0.01
            if progress >= 1.0 {
                progress = 0.0
            }
        }
    }
    
    private func startProgress() {
        isProgressBarAnimating = true
    }
    
    private func stopProgress() {
        isProgressBarAnimating = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

