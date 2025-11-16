Class {
	#name : 'FSZipFile',
	#superclass : 'FSEntry',
	#instVars : [
		'content',
		'name',
		'children'
	],
	#category : 'FileSystemCompositeVisitor',
	#package : 'FileSystemCompositeVisitor'
}

{ #category : 'visiting' }
FSZipFile >> acceptVisitor: aVisitor [

	^ aVisitor visitZipFile: self.
]

{ #category : 'accessing' }
FSZipFile >> add: aChild [

	children add: aChild .
]

{ #category : 'accessing' }
FSZipFile >> children [

	^ children 
]

{ #category : 'accessing' }
FSZipFile >> content [

	^ content
]

{ #category : 'accessing' }
FSZipFile >> content: aContent [

	content := aContent 
]

{ #category : 'initialization' }
FSZipFile >> initialize [ 

	super initialize .
	
	children := OrderedCollection new.
]

{ #category : 'accessing' }
FSZipFile >> name [

	^ name
]

{ #category : 'accessing' }
FSZipFile >> name: aName [

	name := aName .
]
