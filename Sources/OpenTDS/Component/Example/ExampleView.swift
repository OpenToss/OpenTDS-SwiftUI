import SwiftUI

struct ExampleView: View {
    var body: some View {
        TossTabView {
            Text("View1")
                .tossTabItem("View1", Image(systemName: "house.fill"))
            Text("View2")
                .tossTabItem("View2", Image(systemName: "person.fill"))
        }
        .font(.system(size: 30))
    }
}

#Preview {
    ExampleView()
}
