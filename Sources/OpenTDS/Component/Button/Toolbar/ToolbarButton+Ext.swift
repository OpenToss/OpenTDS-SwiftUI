import SwiftUI

@resultBuilder
public struct TossToolbarButtonBuilder {
    
    public static func buildBlock(_ components: TossToolbarButton...) -> [TossToolbarButton] {
        components
    }
    
    public static func buildOptional(_ components: [TossToolbarButton]?) -> [TossToolbarButton]? {
        return components ?? nil
    }
}
