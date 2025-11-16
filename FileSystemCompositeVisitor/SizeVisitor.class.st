Class {
	#name : 'SizeVisitor',
	#superclass : 'SearchVisitor',
	#instVars : [
		'searchString'
	],
	#category : 'FileSystemCompositeVisitor',
	#package : 'FileSystemCompositeVisitor'
}

{ #category : 'visiting' }
SizeVisitor >> visitFSDirectory: aDirectory [

	| size |
	size := 0.
	aDirectory children do: [ :each |
		size := size + (each acceptVisitor: self) ].

	^ size
]

{ #category : 'visiting' }
SizeVisitor >> visitFSFile: aFile [

	^ aFile content size.
]

{ #category : 'visiting' }
SizeVisitor >> visitSymLinks: aSymlinks [


	^ aSymlinks target acceptVisitor: self.
]

{ #category : 'visiting' }
SizeVisitor >> visitZipFile: aZipFile [

	| size |	
	size := 0.
	
	size := size + aZipFile content size.
	
	aZipFile children do: [ :each |
		size := size + (each acceptVisitor: self) ].

	^ size
]
