//
//  CAGradientLayer+Convenience.swift
//  
//  This is a convenience class used for simple implementation
//	of color gradients to views.
//
//  Created by Yasha Walker-Illing on 2015-01-19.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

extension CAGradientLayer
{
	
	// Adds a white to gray gradient to a background
	func grayColor() -> CAGradientLayer
	{
		
		let topColor = UIColor (red: (254/255.0), green: (254/255.0), blue: (254/255.0), alpha: 1)
		let bottomColor = UIColor (red: (186/255.0), green: (186/255.0), blue: (185/255.0), alpha: 1)
		
		let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
		let gradientLocations: [Float] = [0.0, 1.0]
		
		let gradientLayer: CAGradientLayer = CAGradientLayer()
		gradientLayer.colors = gradientColors
		gradientLayer.locations = gradientLocations
		
		return gradientLayer
		
	}

}

