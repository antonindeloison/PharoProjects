Class {
	#name : 'DieTest',
	#superclass : 'TestCase',
	#category : 'Dice',
	#package : 'Dice'
}

{ #category : 'tests' }
DieTest >> testAddingDiceAndDieHandle [

	| hd |
	hd := DieHandle new.
	hd addDie: (Die withFaces: 6).
	hd addDie: (Die withFaces: 6).
	hd := (Die withFaces: 6) + hd.
	
	self assert: hd dice size equals: 3.
]

{ #category : 'tests' }
DieTest >> testAddingTwoDies [

	|hd|
	hd := (Die withFaces: 6) + (Die withFaces: 6).
	self assert: hd dice size equals: 2
]

{ #category : 'tests' }
DieTest >> testCreationIsOk [
	self assert: (Die withFaces: 20) faces equals: 20
]

{ #category : 'tests' }
DieTest >> testInitializeIsOk [
	self assert: Die new faces equals: 6
]

{ #category : 'tests' }
DieTest >> testRolling [
	| d |
	d := Die new.
	10 timesRepeat: [ self assert: (d roll between: 1 and: 6) ]
]

{ #category : 'tests' }
DieTest >> testSummingDieAndDieHandle [

	|hd|
	hd := DieHandle new.
	hd addDie: (Die withFaces: 6).
	hd addDie: (Die withFaces: 6).
	
	hd := (Die withFaces: 6) sumWithDieHandle: hd.
	
	self assert: hd dice size equals: 3
]
