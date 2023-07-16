import SwiftUI

struct ExampleView: View {
    var body: some View {
        TossTabView {
            VStack {
                Text("a")
            }
                .tossTabItem("Home", Image(systemName: "house.fill"))
            Text("b")
                .tossTabItem("My", Image(systemName: "person.fill"))
        }
    }
}

struct Example_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
