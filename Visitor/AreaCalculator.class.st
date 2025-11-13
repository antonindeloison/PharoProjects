Class {
	#name : 'AreaCalculator',
	#superclass : 'ShapeVisitor',
	#category : 'Visitor',
	#package : 'Visitor'
}

{ #category : 'as yet unclassified' }
AreaCalculator >> visitCircle: aCircle [

	^ Float pi * (aCircle radius squared).
]

{ #category : 'as yet unclassified' }
AreaCalculator >> visitShape: aShape [

	aShape acceptVisitor: self.
]
