//
// Copyright © 2017 Gabrieloc. All rights reserved.
//

import ClockKit

enum GioTexts: String {
    case TitleLeft = "Gio"
    case TitleRight = ""
    case SubtitleLeft = "GBA"
    case SubtitleRight = "Emulator"
}
class ComplicationDataSource: NSObject, CLKComplicationDataSource {

    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler(CLKComplicationTimeTravelDirections.backward)
    }

    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        let entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: constructTemplate(for: complication))
        handler(entry)
    }

    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        handler(constructTemplate(for: complication))
    }

    private func constructTemplate(for complication: CLKComplication) -> CLKComplicationTemplate {
        switch complication.family {
            case .modularSmall:
                let template = CLKComplicationTemplateModularSmallSimpleText()
                let provider = CLKSimpleTextProvider(text: GioTexts.TitleLeft.rawValue)
                template.textProvider = provider

                return template
        case .modularLarge:
            let t = CLKComplicationTemplateModularLargeStandardBody()
            t.headerImageProvider = CLKImageProvider(onePieceImage: UIImage(named: "Complication/Circular")!)
            t.headerTextProvider = CLKSimpleTextProvider(text: GioTexts.TitleLeft.rawValue)
            t.body1TextProvider = CLKSimpleTextProvider(text: GioTexts.SubtitleLeft.rawValue)
            t.body2TextProvider = CLKSimpleTextProvider(text: GioTexts.SubtitleRight.rawValue)
            return t
        case .extraLarge:
            let t = CLKComplicationTemplateExtraLargeColumnsText()
            t.row1Column2TextProvider = CLKSimpleTextProvider(text: GioTexts.TitleLeft.rawValue)
            t.row1Column1TextProvider = CLKSimpleTextProvider(text: "")
            t.row2Column2TextProvider = CLKSimpleTextProvider(text: GioTexts.SubtitleLeft.rawValue)
            t.row2Column1TextProvider = CLKSimpleTextProvider(text: GioTexts.SubtitleRight.rawValue)
            t.column2Alignment = .trailing
            return t
        case .utilitarianSmallFlat, .utilitarianSmall:
            let t = CLKComplicationTemplateUtilitarianSmallFlat()
            t.imageProvider = CLKImageProvider(onePieceImage: UIImage(named: "Complication/Circular")!)
            t.textProvider = CLKSimpleTextProvider(text: GioTexts.TitleLeft.rawValue)
            return t
        case .utilitarianLarge:
            let t = CLKComplicationTemplateUtilitarianLargeFlat()
            t.textProvider = CLKSimpleTextProvider(text: GioTexts.TitleLeft.rawValue)
            return t
        case .circularSmall:
            let t = CLKComplicationTemplateCircularSmallStackImage()
            t.line1ImageProvider = CLKImageProvider(onePieceImage: UIImage(named: "Complication/Circular")!)
            t.line2TextProvider = CLKSimpleTextProvider(text: GioTexts.TitleLeft.rawValue)
            return t
        case .graphicCorner:
            let t = CLKComplicationTemplateCircularSmallStackImage()
            t.line1ImageProvider = CLKImageProvider(onePieceImage: UIImage(named: "Complication/Circular")!)
            t.line2TextProvider = CLKSimpleTextProvider(text: GioTexts.TitleLeft.rawValue)
            return t
        case .graphicBezel:
            let t = CLKComplicationTemplateCircularSmallStackImage()
            t.line1ImageProvider = CLKImageProvider(onePieceImage: UIImage(named: "Complication/Circular")!)
            t.line2TextProvider = CLKSimpleTextProvider(text: GioTexts.TitleLeft.rawValue)
            return t
        case .graphicCircular:
            let t = CLKComplicationTemplateCircularSmallStackImage()
            t.line1ImageProvider = CLKImageProvider(onePieceImage: UIImage(named: "Complication/Circular")!)
            t.line2TextProvider = CLKSimpleTextProvider(text: GioTexts.TitleLeft.rawValue)
            return t
        case .graphicRectangular:
            let t = CLKComplicationTemplateCircularSmallStackImage()
            t.line1ImageProvider = CLKImageProvider(onePieceImage: UIImage(named: "Complication/Circular")!)
            t.line2TextProvider = CLKSimpleTextProvider(text: GioTexts.TitleLeft.rawValue)
            return t
        }
    }
}
