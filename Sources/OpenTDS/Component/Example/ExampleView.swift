import SwiftUI

struct ExampleView: View {
    @State var selection: Int = 0
    var body: some View {
        TossTabView {
            TossScrollView("a") {
                Button {
                    selection = 1
                } label: {
                    Text("btn")
                }
            }
            .toolbarButton {
                TossToolbarButton(Image(systemName: "house.fill"), action: {
                    
                })
            }
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
