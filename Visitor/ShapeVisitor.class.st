Class {
	#name : 'ShapeVisitor',
	#superclass : 'Object',
	#category : 'Visitor',
	#package : 'Visitor'
}

{ #category : 'visiting' }
ShapeVisitor >> visitCircle: aCircle [

	^ self subclassResponsibility 
]

{ #category : 'visiting' }
ShapeVisitor >> visitShape: aShape [

	^ self subclassResponsibility
]
