Class {
	#name : 'SearchByNameVisitor',
	#superclass : 'SearchVisitor',
	#instVars : [
		'searchString'
	],
	#category : 'FileSystemCompositeVisitor',
	#package : 'FileSystemCompositeVisitor'
}

{ #category : 'accessing' }
SearchByNameVisitor >> searchString [

	^ searchString
]

{ #category : 'accessing' }
SearchByNameVisitor >> searchString: aString [
	searchString := aString .
]

{ #category : 'visiting' }
SearchByNameVisitor >> visitFSDirectory: aDirectory [

	| matchedNames |
	matchedNames := OrderedCollection new.

	(aDirectory name beginsWith: searchString) ifTrue: [
		matchedNames add: aDirectory ].

    aDirectory children do: [:child |
        | childMatches |
        childMatches := child acceptVisitor: self.
        matchedNames addAll: childMatches
    ].

	^ matchedNames
]

{ #category : 'visiting' }
SearchByNameVisitor >> visitFSFile: aFile [

	|matchFile|
	matchFile := OrderedCollection new. 
	
	(aFile name beginsWith: searchString) ifTrue: [ matchFile add: aFile. ].
	
	^ matchFile .
]

{ #category : 'visiting' }
SearchByNameVisitor >> visitSymLinks: aSymlinks [

	| childmatch |
	childmatch := aSymlinks target acceptVisitor: self.
	^ childmatch
]

{ #category : 'visiting' }
SearchByNameVisitor >> visitZipFile: aZipFile [

	| matchedChild |
	matchedChild := OrderedCollection new.

	(aZipFile name beginsWith: searchString) ifTrue: [
		matchedChild add: aZipFile ].

	aZipFile children do: [ :child |
			| childMatch |
			childMatch := child acceptVisitor: self.
			matchedChild addAll: childMatch ].

	^ matchedChild
]
