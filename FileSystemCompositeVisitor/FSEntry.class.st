Class {
	#name : 'FSEntry',
	#superclass : 'Object',
	#instVars : [
		'parent'
	],
	#category : 'FileSystemCompositeVisitor',
	#package : 'FileSystemCompositeVisitor'
}

{ #category : 'visiting' }
FSEntry >> acceptVisitor: aVisitor [

	^ self subclassResponsibility .
]

{ #category : 'accessing' }
FSEntry >> name [

	^ self subclassResponsibility .
]

{ #category : 'accessing' }
FSEntry >> name: aName [
	^ self subclassResponsibility .
]

{ #category : 'accessing' }
FSEntry >> parent [

	^ parent 
]

{ #category : 'accessing' }
FSEntry >> parent: aParent [
	parent := aParent .
]
