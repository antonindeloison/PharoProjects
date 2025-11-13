Class {
	#name : 'MenuComponent',
	#superclass : 'Object',
	#category : 'Composite',
	#package : 'Composite'
}

{ #category : 'printing' }
MenuComponent >> getPrice [

	^ self subclassResponsibility
]

{ #category : 'printing' }
MenuComponent >> print [
	^ self subclassResponsibility.
]
