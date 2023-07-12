import SwiftUI

struct ExampleView: View {
    var body: some View {
        TossScrollView("전체") {
            Text("AnyView")
        }
        .showDismiss()
    }
}

struct Example_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
