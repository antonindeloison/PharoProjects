Class {
	#name : 'Oysters',
	#superclass : 'MenuComponent',
	#instVars : [
		'price'
	],
	#category : 'Composite',
	#package : 'Composite'
}

{ #category : 'printing' }
Oysters >> getPrice [
	^ price.
]

{ #category : 'printing' }
Oysters >> print [
	^ 'Oysters'.
]

{ #category : 'printing' }
Oysters >> setPrice: aPrice [

	price := aPrice
]
