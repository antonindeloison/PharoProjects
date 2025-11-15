Class {
	#name : 'FSFile',
	#superclass : 'FSEntry',
	#instVars : [
		'content',
		'name'
	],
	#category : 'FileSystemComposite',
	#package : 'FileSystemComposite'
}

{ #category : 'accessing' }
FSFile >> content [
	^ content.
]

{ #category : 'accessing' }
FSFile >> content: aContent [

	content := aContent 
]

{ #category : 'accessing' }
FSFile >> name [

	^ name 
]

{ #category : 'accessing' }
FSFile >> name: aName [
	name := aName .
]

{ #category : 'accessing' }
FSFile >> path [
    parent ifNil: [ ^ '/' ].
    ^ parent path = '/' 
        ifTrue: [ '/' , name ]
        ifFalse: [ parent path , '/' , name ]

]
