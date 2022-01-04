//
//  GangaShareActivity .swift
//  CannaShareGroupActivity
//
//  Created by Wylan L Neely on 1/1/22.
//

import Foundation
import GroupActivities

struct GangaShare: GroupActivity {
    
    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.title = NSLocalizedString("Grow Together",
                                           comment: "Examine next top cannabis strains")
        metadata.type = .generic
        return metadata
    }
    
}


struct GanjaMessage: Codable {
    let type: String
    func cannabisType() -> CannabisType?{
        if type == CannabisType.Indica.rawValue {
            return .Indica
        }
        if type == CannabisType.Sativa.rawValue {
            return .Sativa
        }
        if type == CannabisType.Hybrid.rawValue {
            return .Hybrid
        } else {
            return nil
        }
    }
}
