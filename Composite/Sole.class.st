Class {
	#name : 'Sole',
	#superclass : 'MenuComponent',
	#instVars : [
		'price'
	],
	#category : 'Composite',
	#package : 'Composite'
}

{ #category : 'printing' }
Sole >> getPrice [

	^ price
]

{ #category : 'printing' }
Sole >> print [

	^ 'Sole meunière'
]

{ #category : 'initialization' }
Sole >> setPrice: aPrice [
	price := aPrice
]
