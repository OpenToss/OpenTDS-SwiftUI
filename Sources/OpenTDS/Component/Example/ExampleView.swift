import SwiftUI

struct ExampleView: View {
    var body: some View {
        TossTabView {
            Text("a")
                .tossTabItem("홈", Image(systemName: "house.fill"))
            Text("b")
                .tossTabItem("마이", Image(systemName: "person.fill"))
        }
    }
}

struct Example_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
