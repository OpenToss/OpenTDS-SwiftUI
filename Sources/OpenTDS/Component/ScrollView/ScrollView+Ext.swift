import SwiftUI

extension TossScrollView {
    
    @available(*, deprecated, renamed: "backButton")
    public func showDismiss() -> TossScrollView {
        self.backButton()
    }
    
    public func backButton(action: (() -> Void)? = nil) -> TossScrollView {
        TossScrollView(self.title,
                       showsIndicators: self.showsIndicators,
                       backButtonExists: true,
                       backButtonAction: action,
                       toolbarButton: self.toolbarButton) {
            self.content()
        }
    }
    
    public func toolbarButton(_ condition: Bool = true,
                              @TossToolbarButtonBuilder content: () -> [TossToolbarButton]) -> TossScrollView {
        TossScrollView(self.title,
                       showsIndicators: self.showsIndicators,
                       backButtonExists: self.backButtonExists,
                       backButtonAction: self.backButtonAction,
                       toolbarButton: condition ? content() : nil) {
            self.content()
        }
    }
}
