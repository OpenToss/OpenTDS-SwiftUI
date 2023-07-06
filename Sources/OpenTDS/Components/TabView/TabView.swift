import SwiftUI

@available(macOS 11, iOS 14, *)
public struct TossTabView<Content: TossTabItemViewProtocol>: View {
    
    @State var selected: Int = 0
    let content: [Content]
    
    init(@ViewBuilder content: @escaping () -> TupleView<(Content, Content)>)
    {
        let cv = content().value
        self.content = [cv.0, cv.1]
    }
    
    init(@ViewBuilder content: @escaping () -> TupleView<(Content, Content, Content)>)
    {
        let cv = content().value
        self.content = [cv.0, cv.1, cv.2]
    }
    
    init(@ViewBuilder content: @escaping () -> TupleView<(Content, Content, Content, Content)>)
    {
        let cv = content().value
        self.content = [cv.0, cv.1, cv.2, cv.3]
    }
    
    init(@ViewBuilder content: @escaping () -> TupleView<(Content, Content, Content, Content, Content)>)
    {
        let cv = content().value
        self.content = [cv.0, cv.1, cv.2, cv.3, cv.4]
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                ZStack {
                    ForEach(0..<content.count, id: \.self) { idx in
                        content[idx]
                            .tossTransition(idx, selected)
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Background"))
                
                HStack {
                    Spacer()
                    ForEach(0..<content.count, id: \.self) { idx in
                        TossTabViewButton(content[idx].title, content[idx].image, idx == selected) {
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
                    .strokeBorder(Color("Stripe"), lineWidth: 0.3))
                .padding(.bottom, geometry.safeAreaInsets.bottom <= 20 ? -100 : -113)
            }
        }
        .background(Color("Background"))
    }
}
