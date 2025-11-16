Class {
	#name : 'FSSymLinks',
	#superclass : 'FSEntry',
	#instVars : [
		'target'
	],
	#category : 'FileSystemCompositeVisitor',
	#package : 'FileSystemCompositeVisitor'
}

{ #category : 'visiting' }
FSSymLinks >> acceptVisitor: aVisitor [

	^ aVisitor visitSymLinks: self.
]

{ #category : 'accessing' }
FSSymLinks >> target [

	^ target.
]

{ #category : 'accessing' }
FSSymLinks >> target: aTarget [

	target := aTarget .
]
