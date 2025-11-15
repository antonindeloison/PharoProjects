Class {
	#name : 'SearchVisitor',
	#superclass : 'Object',
	#category : 'FileSystemCompositeVisitor',
	#package : 'FileSystemCompositeVisitor'
}

{ #category : 'as yet unclassified' }
SearchVisitor >> searchMatching: aBlock with: aFSEntry [

	| matches |
	matches := OrderedCollection new.


	(aBlock value: self) ifTrue: [ matches add: self ].
	aFSEntry children do: [ :each |
			(each isKindOf: FSDirectory)
				ifTrue: [ matches addAll: (each searchMatching: aBlock) ]
				ifFalse: [ (aBlock value: each) ifTrue: [ matches add: each ] ] ].

	^ matches
]

{ #category : 'visiting' }
SearchVisitor >> visit: aFSEntry [

	^ aFSEntry acceptVisitor: self
]

{ #category : 'visiting' }
SearchVisitor >> visitFSDirectory: aDirectory [

	^ self subclassResponsibility
]

{ #category : 'visiting' }
SearchVisitor >> visitFSFile: aFile [

	^ self subclassResponsibility
]
