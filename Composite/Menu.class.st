Class {
	#name : 'Menu',
	#superclass : 'MenuComponent',
	#instVars : [
		'price',
		'menuItem'
	],
	#category : 'Composite',
	#package : 'Composite'
}

{ #category : 'adding' }
Menu >> add: anItem [
	menuItem add: anItem.
]

{ #category : 'printing' }
Menu >> getPrice [

	| aPrice |
	aPrice := 0.
	menuItem do: [ :each | aPrice := aPrice + each getPrice ].
	^ aPrice
]

{ #category : 'initialization' }
Menu >> initialize [

	super initialize.

	menuItem := OrderedCollection new
]

{ #category : 'printing' }
Menu >> print [

	| aStream |
	aStream := ReadWriteStream on: String new.
	aStream nextPutAll: 'Menu : '.
	menuItem do: [ :each | aStream nextPutAll: (each print , ', ' )].
	^ aStream contents
]

{ #category : 'removing' }
Menu >> remove: anItem [

	menuItem remove: anItem.
]

{ #category : 'accessing' }
Menu >> size [
	^ menuItem size.
]
