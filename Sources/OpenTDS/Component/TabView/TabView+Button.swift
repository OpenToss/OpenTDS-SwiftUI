import SwiftUI

/**
    Toss 탭뷰의 버튼입니다.
 
        TossTabViewButton("홈", Image(systemName: "house.fill"), idx == selected) {
            anyMethod()
        }
 */
@available(macOS 11, iOS 14, *)
public struct TossTabViewButton: View {
    
    let label: String
    let image: Image
    let action: () -> ()
    var selected: Bool
    @State var buttonRect: CGRect = CGRect.zero
    @State var animationState: Int = 0
    @State var touchdownState: Bool = false
    @State var rectangleState: Bool = false
    
    /**
        탭뷰 버튼을 반환합니다.
            
        - Parameters:
           - label: 버튼 레이블입니다.
           - image: 버튼 이미지입니다.
           - selected: 버튼 하이라이트 여부입니다.
           - action: 버튼을 눌렀을 때 실행할 액션입니다.
     */
    public init(_ label: String,
                _ image: Image,
                _ selected: Bool,
                action: @escaping () -> ())
    {
        self.label = label
        self.image = image
        self.selected = selected
        self.action = action
    }
    
    public var head: some View {
        ZStack {
            if rectangleState {
                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(TossColor.generalBackground)
            }
            VStack(spacing: 3) {
                image
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .scaleEffect(x: animationState == 2 ? 1.1 : 1, y: 1)
                    .scaleEffect(x: 1, y: animationState == 3 ? 1.05 : 1)
                Text(label)
                    .font(.system(size: 11, weight: .medium))
                    .scaleEffect(animationState == 2 ? 1.05 : 1)
            }
            .foregroundColor(selected || touchdownState ? TossColor.general : TossColor.secondary)
        }
        .frame(width: 56, height: 56)
        .scaleEffect(animationState == 1 ? 0.9 : 1)
    }
    
    public var body: some View {
        head
            .background(
                GeometryReader { (geometry) -> Color in
                    let rect = geometry.frame(in: .global)
                    DispatchQueue.main.async {
                        buttonRect = rect
                    }
                    return .clear
                }
            )
            .simultaneousGesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .global)
                    .onChanged { newValue in
                        touchdownState = buttonRect.contains(newValue.location)
                        rectangleState = true
                        withAnimation(.linear(duration: 0.1)) {
                            animationState = 1
                        }
                    }
                    .onEnded { _ in
                        if touchdownState {
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            action()
                        }
                        for i in 2..<5 {
                            withAnimation(
                                .linear(duration: 0.1)
                                .delay(Double(i - 2)/10*2)
                            ) {
                                animationState = i == 4 ? 0 : i
                                if i == 2 {
                                    touchdownState = false
                                    rectangleState = false
                                }
                            }
                        }
                    }
            )
    }
}
