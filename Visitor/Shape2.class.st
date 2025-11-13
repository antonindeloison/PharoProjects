Class {
	#name : 'Shape2',
	#superclass : 'Object',
	#category : 'Visitor',
	#package : 'Visitor'
}

{ #category : 'visiting' }
Shape2 >> acceptVisitor: aVisitor [

	^ self subclassResponsibility. 
]
