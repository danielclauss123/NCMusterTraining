import SwiftUI

struct ContentView: View {
    @State private var exerciseIndexes = Exercise.randomIndexArray()
    
    @State private var showingExplanation = false
    
    var exercise: Exercise {
        // Careful, exerciseIndexes should never be empty, otherwise CRASH.
        Exercise.exercises[exerciseIndexes.first!]
    }
    
    @State private var highlightingCorrect = false
    
    @State private var successTrigger = 0
    @State private var failureTrigger = 0
    
    var body: some View {
        VStack {
            topBar
            
            Image(exercise.questionImage)
                .resizable()
                .scaledToFit()
            
            Divider()
            
            Grid {
                GridRow() {
                    ForEach(exercise.answerImages[0 ..< 3], id: \.self) { imageName in
                        answerButton(imageName: imageName)
                    }
                }
                
                GridRow() {
                    ForEach(exercise.answerImages[3 ..< 5], id: \.self) { imageName in
                        answerButton(imageName: imageName)
                    }
                }
            }
        }
        .padding(.horizontal, 5)
        .sensoryFeedback(.success, trigger: successTrigger)
        .sensoryFeedback(.error, trigger: failureTrigger)
    }
    
    private func answerButton(imageName: String) -> some View {
        let isSolution = exercise.solution == String(imageName.last!)
        
        return Button {
            if isSolution {
                successTrigger += 1
                withAnimation {
                    highlightingCorrect = true
                }
                
                Task {
                    try? await Task.sleep(nanoseconds: 1_000_000_000)
                    
                    withAnimation {
                        highlightingCorrect = false
                    }
                    
                    if exerciseIndexes.count > 1 {
                        exerciseIndexes.removeFirst()
                    } else {
                        exerciseIndexes = Exercise.randomIndexArray()
                    }
                }
            } else {
                failureTrigger += 1
            }
        } label: {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .blur(radius: (highlightingCorrect && !isSolution) ? 5 : 0)
                .shadow(color: (isSolution && highlightingCorrect) ? .green : .clear, radius: 5)
        }
        .disabled(highlightingCorrect)
    }
    
    private var topBar: some View {
        HStack {
            ToolbarButtonIcon(systemName: "questionmark", color: .secondary)
                .opacity(0)
            
            Spacer()
            
            Text("Muster")
                .font(.title3.bold())
            
            Spacer()
            
            Button {
                showingExplanation = true
            } label: {
                ToolbarButtonIcon(systemName: "questionmark", color: .secondary)
            }
            .sheet(isPresented: $showingExplanation) {
                VStack(alignment: .leading) {
                    Text("Anleitung")
                        .font(.headline)
                    
                    Text("Die fünf kleinen Bilder sind Ausschnitte des grossen Bildes. Vier davon haben einen oder mehrere Unterschiede, eines hat keinen Unterschied. Finde heraus, welches dieses ist.")
                }
                .padding()
                .presentationDetents([.height(150)])
                .presentationDragIndicator(.visible)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
