import SwiftUI

extension TossScrollView {
    
    @available(*, deprecated, renamed: "backButton")
    public func showDismiss() -> TossScrollView {
        self.backButton()
    }
    
    public func backButton(action: (() -> ())? = nil) -> TossScrollView {
        TossScrollView(self.title,
                       showsIndicators: self.showsIndicators,
                       backButtonExists: true,
                       backButtonAction: action) {
            self.content
        }
    }
}
