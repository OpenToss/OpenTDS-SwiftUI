import SwiftUI
import Combine

/**
    Animated Tab View of Toss.
 
    Between 2 and 5 Views are recommended.
    Every single View should have `.tossTabItem` Modifier.
 
        TossTabView {
            HomeView()
                .tossTabItem("Home", Image(systemName: "house.fill"))
            MyView()
                .tossTabItem("My", Image(systemName: "person.fill"))
        }
 */
@available(macOS 11, iOS 14, *)
public struct TossTabView: View {
    
    @State var selection: Binding<Int>?
    @State var selected: Int
    
    let content: [TossTabItem]
    
    public init(selection: Binding<Int>? = nil,
                haptic: UIImpactFeedbackGenerator.FeedbackStyle? = .light,
                @TossTabViewBuilder content: () -> [TossTabItem]) {
        self.selection = selection
        self.selected = selection?.wrappedValue ?? 0
        self.content = content()
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                ZStack {
                    ForEach(content.indices, id: \.self) { idx in
                        content[idx].content
                            .offset(x: { () -> CGFloat in
                                if idx == selected {
                                    return 0
                                } else if idx < selected {
                                    return -10
                                } else {
                                    return 10
                                }
                            }())
                            .opacity(idx == selected ? 1 : 0)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(TossColor.background)
                
                HStack {
                    Spacer()
                    ForEach(content.indices, id: \.self) { idx in
                        TossTabViewButton(content[idx].title,
                                          content[idx].image,
                                          idx == selected) {
                            if selection != nil {
                                selection?.wrappedValue = idx
                            }
                            if selected != idx {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    selected = idx
                                }
                            }
                        }
                        Spacer()
                    }
                }
                .padding(.vertical, 3)
                .padding(.bottom, 100)
                .background(TossColor.background)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(TossColor.stripe, lineWidth: 0.3))
                .padding(.bottom, geometry.safeAreaInsets.bottom <= 20 ? -100 : -113)
            }
        }
        .background(TossColor.background.ignoresSafeArea())
        .onReceive(Just(selection)) { newValue in
            if let newValue, selected != newValue.wrappedValue {
                withAnimation(.easeInOut(duration: 0.2)) {
                    selected = newValue.wrappedValue
                }
            }
        }
    }
}
