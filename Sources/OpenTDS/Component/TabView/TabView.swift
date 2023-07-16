import SwiftUI

/**
    Animated Tab View of Toss.
 
    The number of Views must be between 2 and 5.
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
    
    @State var selected: Int = 0
    
    let content: [TossTabItem]
    
    public init(haptic: UIImpactFeedbackGenerator.FeedbackStyle? = .light,
                @TossTabViewBuilder content: () -> [TossTabItem])
    {
        self.content = content()
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                ZStack {
                    ForEach(0..<content.count, id: \.self) { idx in
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
                    ForEach(0..<content.count, id: \.self) { idx in
                        TossTabViewButton(content[idx].title,
                                          content[idx].image,
                                          idx == selected) {
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
                .background(Color(.systemBackground))
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(TossColor.stripe, lineWidth: 0.3))
                .padding(.bottom, geometry.safeAreaInsets.bottom <= 20 ? -100 : -113)
            }
        }
        .background(TossColor.background.ignoresSafeArea())
    }
}
