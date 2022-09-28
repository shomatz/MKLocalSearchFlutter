//
//  MklocalSearchResonse.swift
//  mklocal_search
//
//  Created by Jonathan Eduardo Garcia Garcia on 27/09/22.
//

import Foundation
import MapKit

public struct MklocalSearchResonse: Codable
{
    var mapItems: [MKMapItem?];
    var boundingRegion: MKCoordinateRegion;

    init(mapItems: [MapKit.MKMapItem], boundingRegion:MapKit.MKCoordinateRegion) {
        self.boundingRegion = MKCoordinateRegion(boundingRegion: boundingRegion);
        self.mapItems = [MKMapItem?](repeating:nil,count:mapItems.count);
        for i in 0..<mapItems.count{
            let mapItem=mapItems[i];
            self.mapItems[i]=MKMapItem(mapItem: mapItem);
        }
    }
}
