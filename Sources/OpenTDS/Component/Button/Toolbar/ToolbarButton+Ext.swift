import SwiftUI

@resultBuilder
public struct TossToolbarButtonBuilder {
    
    public static func buildBlock(_ components: TossToolbarButton...) -> [TossToolbarButton] {
        components
    }
    
    static func buildOptional(_ component: TossToolbarButton?) -> TossToolbarButton? {
        return component ?? nil
    }
}
