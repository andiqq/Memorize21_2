//
//  Pie.swift
//  Memorize
//
//  Created by Dr. Andreas Plagens on 18.09.21.
//

import SwiftUI

struct Pie: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = true
    
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians),     // no type conversion necessary here
            y: center.y + radius * sin(startAngle.radians)
        )
        
        var p = Path()
        
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise
        )

        return p
    }
    
    
}