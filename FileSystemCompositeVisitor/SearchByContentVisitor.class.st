Class {
	#name : 'SearchByContentVisitor',
	#superclass : 'SearchVisitor',
	#instVars : [
		'searchString'
	],
	#category : 'FileSystemCompositeVisitor',
	#package : 'FileSystemCompositeVisitor'
}

{ #category : 'accessing' }
SearchByContentVisitor >> searchString [

	 ^ searchString
]

{ #category : 'accessing' }
SearchByContentVisitor >> searchString: aString [
	searchString := aString .
]

{ #category : 'visiting' }
SearchByContentVisitor >> visitFSDirectory: aDirectory [

	| matchedChild |
	matchedChild := OrderedCollection new.

	aDirectory children do: [ :child |
			| childMatch |
			childMatch := child acceptVisitor: self.
			matchedChild addAll: childMatch ].

	^ matchedChild
]

{ #category : 'visiting' }
SearchByContentVisitor >> visitFSFile: aFile [

	| matchedChild |
	matchedChild := OrderedCollection new.

	(aFile content beginsWith: searchString) ifTrue: [
		matchedChild add: aFile ].

	^ matchedChild
]
