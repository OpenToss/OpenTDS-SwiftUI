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
    
    let content: [any TossTabItemViewProtocol]
    
    public init<C0: TossTabItemViewProtocol,
                C1: TossTabItemViewProtocol>(haptic: UIImpactFeedbackGenerator.FeedbackStyle? = .light,
                                             @ViewBuilder content: @escaping () -> TupleView<(C0, C1)>)
    {
        let cv = content().value
        self.content = [cv.0, cv.1]
    }
    
    public init<C0: TossTabItemViewProtocol,
                C1: TossTabItemViewProtocol,
                C2: TossTabItemViewProtocol>(haptic: UIImpactFeedbackGenerator.FeedbackStyle? = .light,
                                             @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2)>)
    {
        let cv = content().value
        self.content = [cv.0, cv.1, cv.2]
    }
    
    public init<C0: TossTabItemViewProtocol,
                C1: TossTabItemViewProtocol,
                C2: TossTabItemViewProtocol,
                C3: TossTabItemViewProtocol>(haptic: UIImpactFeedbackGenerator.FeedbackStyle? = .light,
                                             @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2, C3)>)
    {
        let cv = content().value
        self.content = [cv.0, cv.1, cv.2, cv.3]
    }
    
    public init<C0: TossTabItemViewProtocol,
                C1: TossTabItemViewProtocol,
                C2: TossTabItemViewProtocol,
                C3: TossTabItemViewProtocol,
                C4: TossTabItemViewProtocol>(haptic: UIImpactFeedbackGenerator.FeedbackStyle? = .light,
                                             @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2, C3, C4)>)
    {
        let cv = content().value
        self.content = [cv.0, cv.1, cv.2, cv.3, cv.4]
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
