Class {
	#name : 'FloatingIsland',
	#superclass : 'MenuComponent',
	#instVars : [
		'price'
	],
	#category : 'Composite',
	#package : 'Composite'
}

{ #category : 'accessing' }
FloatingIsland >> getPrice [

	^ price
]

{ #category : 'accessing' }
FloatingIsland >> print [
	^ 'Floating Island'
]

{ #category : 'accessing' }
FloatingIsland >> setPrice: aPrice [

	price := aPrice .
]
