Class {
	#name : 'FSDirectory',
	#superclass : 'FSEntry',
	#instVars : [
		'children',
		'name'
	],
	#category : 'FileSystemComposite',
	#package : 'FileSystemComposite'
}

{ #category : 'accessing' }
FSDirectory >> add: aFSFile [

	children add: aFSFile 
]

{ #category : 'as yet unclassified' }
FSDirectory >> beginWith: aString [

	| childMatch |
	childMatch := OrderedCollection new.

	children do: [ :each |
			(each isKindOf: FSDirectory)
				ifTrue: [ childMatch addAll: (each searchByContents: aString) ]
				ifFalse: [
						(each content beginsWith: aString ) ifTrue: [
							childMatch add: each ] ] ].

	^ childMatch
]

{ #category : 'accessing' }
FSDirectory >> children [

	^ children
]

{ #category : 'initialization' }
FSDirectory >> initialize [ 

	super initialize .
	children := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
FSDirectory >> matchedPrefix: aString [ 

	^ self searchMatching: [ :each | each content beginsWith: aString ]
]

{ #category : 'accessing' }
FSDirectory >> name [

	^ name
]

{ #category : 'accessing' }
FSDirectory >> name: aName [
	name := aName .
]

{ #category : 'accessing' }
FSDirectory >> path [
    parent ifNil: [ ^ '/' ].
    ^ parent path = '/' 
        ifTrue: [ '/' , name ]
        ifFalse: [ parent path , '/' , name ]

]

{ #category : 'as yet unclassified' }
FSDirectory >> searchByContents: aString [
    ^ self searchMatching: [:each |
        (each isKindOf: FSFile) and: [ each content includesSubstring: aString ]
    ]

]

{ #category : 'accessing' }
FSDirectory >> searchByName: aString [

	^ self searchMatching: [ :each | (each name notNil) and: [ each name beginsWith: aString ] ]
]

{ #category : 'as yet unclassified' }
FSDirectory >> searchMatching: aBlock [

	| matches |
	matches := OrderedCollection new.


    (aBlock value: self) ifTrue: [ matches add: self ].
	children do: [ :each |
			(each isKindOf: FSDirectory)
				ifTrue: [ matches addAll: (each searchMatching: aBlock) ]
				ifFalse: [ (aBlock value: each) ifTrue: [ matches add: each ] ] ].

	^ matches
]
