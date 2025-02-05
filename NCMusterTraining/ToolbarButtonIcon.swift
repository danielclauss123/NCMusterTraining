import SwiftUI

struct ToolbarButtonIcon: View {
    let systemName: String
    var color: Color = .accentColor
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .foregroundStyle(color)
            .fontWeight(.bold)
            .frame(width: 18, height: 18)
            .padding(5)
            .background(Circle().fill(color).opacity(0.2))
    }
}

#Preview {
    ToolbarButtonIcon(systemName: "plus")
}
