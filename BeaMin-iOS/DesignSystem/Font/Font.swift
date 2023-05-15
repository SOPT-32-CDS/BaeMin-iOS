//
//  Font.swift
//  TvingCloneCoding
//
//  Created by uiskim on 2023/05/13.
//

import UIKit

public enum Font {
    
    public enum PretendardType {
        case title, h1Headline, h2Headline, h3Headline, body1, bady2, body2Bold, body3, body3Bold, body4, body4Bold
        
        var Wight: Font.Weight {
            switch self {
            case .title, .h1Headline, .h2Headline, .h3Headline, .body2Bold, .body3Bold, .body4Bold: return ._600
            case .body1, .bady2, .body3, .body4: return ._400
            }
        }
        
        var Size: CGFloat {
            switch self {
            case .title: return Font.Size._24.rawValue
            case .h1Headline: return Font.Size._20.rawValue
            case .h2Headline: return Font.Size._18.rawValue
            case .h3Headline, .body1: return Font.Size._16.rawValue
            case .bady2, .body2Bold: return Font.Size._14.rawValue
            case .body3, .body3Bold: return Font.Size._12.rawValue
            case .body4, .body4Bold: return Font.Size._10.rawValue
            }
        }
    }
    
    public enum HannaProType {
        case brandTypeBig
        case brandTypeSmall
        
        var Weight: Font.Weight {
            return ._400
        }
        
        var Size: CGFloat {
            switch self {
            case .brandTypeBig: return Font.Size._20.rawValue
            case .brandTypeSmall: return Font.Size._12.rawValue
            }
        }
    }
    
    public enum Name: String {
        case system
        case pretendard = "Pretendard"
        case bmHannaPro = "BMHANNAPro"
    }
    
    public enum Size: CGFloat {
        case _10 = 10
        case _12 = 12
        case _14 = 14
        case _16 = 16
        case _18 = 18
        case _20 = 20
        case _24 = 24
    }

    public enum Weight: String {
        case _400 = "Regular"
        case _600 = "SemiBold"

        var real: UIFont.Weight {
            switch self {
            case ._400:
                return .regular
            case ._600:
                return .semibold
            }
        }
    }

    public struct PretendardFont {
        private let _name: Name
        private let _weight: Weight

        init(name: Name, weight: Weight) {
            self._name = name
            self._weight = weight
        }

        var name: String {
            "\(_name.rawValue)-\(_weight.rawValue)"
        }

        var `extension`: String {
            "ttf"
        }
    }
    
    public struct HannaProFont {
        private let _name: Name
        private let _weight: Weight
        
        init(_name: Name, _weight: Weight) {
            self._name = _name
            self._weight = _weight
        }
        
        var name: String {
            "\(_name.rawValue)"
        }
        
        var `extension`: String {
            "ttf"
        }
        
    }
    

    public static func registerFonts() {
        pretendardFonts.forEach { font in
            Font.registerFont(fontName: font.name, fontExtension: font.extension)
        }
        hannaProFonts.forEach { font in
            Font.registerFont(fontName: font.name, fontExtension: font.extension)
        }
    }
}

extension Font {
    static var pretendardFonts: [PretendardFont] {
        [
            PretendardFont(name: .pretendard, weight: ._400),
            PretendardFont(name: .pretendard, weight: ._600),
        ]
    }
    
    static var hannaProFonts: [HannaProFont] {
        [
            HannaProFont(_name: .bmHannaPro, _weight: ._400)
        ]
    }

   static func registerFont(fontName: String, fontExtension: String) {
        guard let fontURL = Bundle(identifier: "uikit.BeaMin-iOS")?.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            debugPrint("Couldn't create font from filename: \(fontName) with extension \(fontExtension)")
            return
        }

        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
