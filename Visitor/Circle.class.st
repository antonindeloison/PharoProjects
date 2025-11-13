Class {
	#name : 'Circle',
	#superclass : 'Shape2',
	#instVars : [
		'radius'
	],
	#category : 'Visitor',
	#package : 'Visitor'
}

{ #category : 'visiting' }
Circle >> acceptVisitor: aVisitor [

	^ aVisitor visitCircle: self
]

{ #category : 'accessing' }
Circle >> radius [

	^ radius
]

{ #category : 'accessing' }
Circle >> radius: aRadius [

	radius := aRadius 
]
