import SwiftUI

extension TossScrollView {
    public func showDismiss() -> TossScrollView {
        TossScrollView(self.title, showsIndicators: self.showsIndicators, showsDismiss: true) {
            self.content
        }
    }
}
