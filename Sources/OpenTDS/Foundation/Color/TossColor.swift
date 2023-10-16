import SwiftUI

@available(macOS 11, iOS 14, *)
public enum TossColor {
    
    public static func hexToColor(hex: String) -> UIColor {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        return UIColor(red: CGFloat(int >> 16) / 255,
                       green: CGFloat(int >> 8 & 0xFF) / 255,
                       blue: CGFloat(int & 0xFF) / 255,
                       alpha: 1)
    }
    
    public static func dynamicColor(_ light: String, dark: String? = nil) -> Color {
        let lightColor = hexToColor(hex: light)
        if dark == nil {
            return Color(lightColor)
        } else {
            let darkColor = hexToColor(hex: dark!)
            return Color(UIColor { $0.userInterfaceStyle == .dark ? darkColor : lightColor })
        }
    }
}

extension TossColor {

    public static let homeBackground: Color = dynamicColor("#F3F4F6", dark: "#101013")
    public static let tabViewButtonIcon: Color = dynamicColor("#B1B8C0", dark: "#62626D")
    public static let tabViewButtonLabel: Color = dynamicColor("#6D7582", dark: "#9E9EA4")
    public static let background: Color = dynamicColor("#FFFFFF", dark: "#17171C")
    public static let label: Color = dynamicColor("#1A1E27", dark: "#FFFFFF")
    public static let stripe: Color = dynamicColor("#E4E8EB", dark: "#3C3C47")
    public static let secondaryBackground: Color = dynamicColor("#F2F3F5", dark: "#2C2C35")
}
