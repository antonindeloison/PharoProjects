Class {
	#name : 'FSDirectoryTest',
	#superclass : 'FSEntryTest',
	#category : 'FileSystemComposite',
	#package : 'FileSystemComposite'
}

{ #category : 'tests' }
FSDirectoryTest >> testPath [

	| root usr bin file |
	
	root := FSDirectory new.
	root name: ''.
	
	usr := FSDirectory new.
	usr name: 'usr'.
	usr parent: root.

	bin := FSDirectory new.
	bin name: 'bin'.
	bin parent: usr.

	file := FSFile new.
	file name: 'data.bin'.
	file parent: bin.

	self assert: file path equals: '/usr/bin/data.bin'
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByContentsIsOkToFindAChildContentInASubDirectory [

	| directory res subDirectory |
	subDirectory := FSDirectory new.
	subDirectory add: (FSFile new content: 'FileSub1').

	directory := FSDirectory new.
	directory add: (FSFile new content: 'File1').
	directory add: subDirectory.
	directory add: (FSFile new content: 'File2').
	directory add: (FSFile new content: 'File3').
	directory add: (FSFile new content: 'Dir1').
	directory add: (FSFile new content: 'File5').



	res := directory searchByContents: 'FileSub1'.

	self assert: res size equals: 1
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByContentsIsOkToFindASameFileContentInDiffrentContentInThreeTreeNodes [

	| directory res subDirectory1 subDirectory2 |
	subDirectory1 := FSDirectory new name: 'Dir1'.
	subDirectory1 add: (FSFile new content: 'ReportWeek098821 eoofezofez ReportWeek07').
	subDirectory1 add: (FSFile new content: 'SubFile2').
	subDirectory1 add: (FSFile new content: 'SubFile3').
	subDirectory1 add: (FSFile new content: 'SubFile4').
	subDirectory1 add: (FSFile new content: 'ReportWeek07').

	subDirectory2 := FSDirectory new.
	subDirectory2 add: (FSFile new content: 'SubFile1').
	subDirectory2 add: (FSFile new content: 'SubFile2').
	subDirectory2 add: (FSFile new content: 'ReportWeek07').
	subDirectory2 add: (FSFile new content: 'ReportWeek098821 eooezfzefezofez ReportWeek07 zadazoapzo dpazpad aaapddo ko kodo ').
	subDirectory2 add: (FSFile new content: 'SubFile4').


	directory := FSDirectory new.
	directory add: (FSFile new content: 'File1').
	directory add: subDirectory1.
	directory add: (FSFile new content: 'File2').
	directory add: (FSFile new content: ' Report dzaodza Week 02 ReportWeek07 fefezopopf ReportWeek07').
	directory add: (FSFile new content: 'File3').
	directory add: subDirectory2.
	directory add: (FSFile new content: 'File5').



	res := directory searchByContents: 'ReportWeek07'.

	self assert: res size equals: 5
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByContentsIsOkToFindASameFileContentInThreeTreeNodes [

	| directory res subDirectory1 subDirectory2 |
	subDirectory1 := FSDirectory new name: 'ReportWeek07'.
	subDirectory1 add: (FSFile new content: 'SubFile1').
	subDirectory1 add: (FSFile new content: 'SubFile2').
	subDirectory1 add: (FSFile new content: 'SubFile3').
	subDirectory1 add: (FSFile new content: 'SubFile4').
	subDirectory1 add: (FSFile new content: 'ReportWeek07').

	subDirectory2 := FSDirectory new.
	subDirectory2 add: (FSFile new content: 'SubFile1').
	subDirectory2 add: (FSFile new content: 'SubFile2').
	subDirectory2 add: (FSFile new content: 'ReportWeek07').
	subDirectory2 add: (FSFile new content: 'SubFile3').
	subDirectory2 add: (FSFile new content: 'SubFile4').


	directory := FSDirectory new.
	directory add: (FSFile new content: 'File1').
	directory add: subDirectory1.
	directory add: (FSFile new content: 'File2').
	directory add: (FSFile new content: 'ReportWeek07').
	directory add: (FSFile new content: 'File3').
	directory add: subDirectory2.
	directory add: (FSFile new content: 'File5').



	res := directory searchByContents: 'ReportWeek07'.

	self assert: res size equals: 3
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByContentsIsOkWithNotMatchedName [

	| directory res |
	directory := FSDirectory new.
	directory add: (FSFile new content: 'File1').
	directory add: (FSFile new content: 'File2').
	directory add: (FSFile new content: 'File3').
	directory add: (FSFile new content: 'File4').
	directory add: (FSFile new content: 'File5').



	res := directory searchByContents: 'File6'.

	self assert: res size equals: 0
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByContentsIsOkWithOneFile [

	| directory file res |
	directory := FSDirectory new.
	file := FSFile new.
	file content: 'File1'.
	directory add: file.

	res := directory searchByContents: 'File1'.

	self assert: res size equals: 1
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByNameIsOkToFindAChildInASubDirectory [

	| directory res subDirectory |
	subDirectory := FSDirectory new.
	subDirectory add: (FSFile new name: 'FileSub1').

	directory := FSDirectory new.
	directory add: (FSFile new name: 'File1').
	directory add: subDirectory.
	directory add: (FSFile new name: 'File2').
	directory add: (FSFile new name: 'File3').
	directory add: (FSFile new name: 'Dir1').
	directory add: (FSFile new name: 'File5').



	res := directory searchByName: 'FileSub1'.

	self assert: res size equals: 1
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByNameIsOkToFindADirectoryName [

	| directory res |
	directory := FSDirectory new.
	directory add: (FSFile new name: 'File1').
	directory add: (FSDirectory new name: 'Dir1').
	directory add: (FSFile new name: 'File2').
	directory add: (FSFile new name: 'File3').
	directory add: (FSFile new name: 'File1').
	directory add: (FSFile new name: 'File5').



	res := directory searchByName: 'Dir1'.

	self assert: res size equals: 1
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByNameIsOkToFindASameFileAndDirectorynameInThreeTreeNodes [

	| directory res subDirectory1 subDirectory2 |
	subDirectory1 := FSDirectory new name: 'ReportWeek07'.
	subDirectory1 add: (FSFile new name: 'SubFile1').
	subDirectory1 add: (FSFile new name: 'SubFile2').
	subDirectory1 add: (FSFile new name: 'SubFile3').
	subDirectory1 add: (FSFile new name: 'SubFile4').
	subDirectory1 add: (FSFile new name: 'ReportWeek07').

	subDirectory2 := FSDirectory new.
	subDirectory2 add: (FSFile new name: 'SubFile1').
	subDirectory2 add: (FSFile new name: 'SubFile2').
	subDirectory2 add: (FSFile new name: 'ReportWeek07').
	subDirectory2 add: (FSFile new name: 'SubFile3').
	subDirectory2 add: (FSFile new name: 'SubFile4').


	directory := FSDirectory new.
	directory add: (FSFile new name: 'File1').
	directory add: subDirectory1.
	directory add: (FSFile new name: 'File2').
	directory add: (FSFile new name: 'ReportWeek07').
	directory add: (FSFile new name: 'File3').
	directory add: subDirectory2.
	directory add: (FSFile new name: 'File5').



	res := directory searchByName: 'ReportWeek07'.

	self assert: res size equals: 4
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByNameIsOkToFindASameFilenameInThreeTreeNodes [

	| directory res subDirectory1 subDirectory2|
	subDirectory1 := FSDirectory new.
	subDirectory1 add: (FSFile new name: 'SubFile1').
	subDirectory1 add: (FSFile new name: 'SubFile2').
	subDirectory1 add: (FSFile new name: 'SubFile3').
	subDirectory1 add: (FSFile new name: 'SubFile4').
	subDirectory1 add: (FSFile new name: 'ReportWeek07').
	
	subDirectory2 := FSDirectory new.
	subDirectory2 add: (FSFile new name: 'SubFile1').
	subDirectory2 add: (FSFile new name: 'SubFile2').
	subDirectory2 add: (FSFile new name: 'ReportWeek07').
	subDirectory2 add: (FSFile new name: 'SubFile3').
	subDirectory2 add: (FSFile new name: 'SubFile4').


	directory := FSDirectory new.
	directory add: (FSFile new name: 'File1').
	directory add: subDirectory1.
	directory add: (FSFile new name: 'File2').
	directory add: (FSFile new name: 'ReportWeek07').
	directory add: (FSFile new name: 'File3').
	directory add: subDirectory2.
	directory add: (FSFile new name: 'File5').



	res := directory searchByName: 'ReportWeek07'.

	self assert: res size equals: 3
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByNameIsOkToFindTooDirectoryWithTheSameName [

	| directory res |
	directory := FSDirectory new.
	directory add: (FSFile new name: 'File1').
	directory add: (FSDirectory new name: 'Dir1').
	directory add: (FSFile new name: 'File2').
	directory add: (FSFile new name: 'File3').
	directory add: (FSFile new name: 'Dir1').
	directory add: (FSFile new name: 'File5').



	res := directory searchByName: 'Dir1'.

	self assert: res size equals: 2
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByNameIsOkToFindTwoChildInASubDirectory [

	| directory res subDirectory |
	subDirectory := FSDirectory new.
	subDirectory add: (FSFile new name: 'FileSub1').
	subDirectory add: (FSFile new name: 'FileSub1').

	directory := FSDirectory new.
	directory add: (FSFile new name: 'File1').
	directory add: subDirectory.
	directory add: (FSFile new name: 'File2').
	directory add: (FSFile new name: 'File3').
	directory add: (FSFile new name: 'Dir1').
	directory add: (FSFile new name: 'File5').



	res := directory searchByName: 'FileSub1'.

	self assert: res size equals: 2
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByNameIsOkWithManyFiles [

	| directory res |
	directory := FSDirectory new.
	directory add: (FSFile new name: 'File1').
	directory add: (FSFile new name: 'File2').
	directory add: (FSFile new name: 'File3').
	directory add: (FSFile new name: 'File4').
	directory add: (FSFile new name: 'File5').
	


	res := directory searchByName: 'File1'.

	self assert: res size equals: 1
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByNameIsOkWithManyFilesAndTooFilesHaveTheSameName [

	| directory res |
	directory := FSDirectory new.
	directory add: (FSFile new name: 'File1').
	directory add: (FSFile new name: 'File2').
	directory add: (FSFile new name: 'File3').
	directory add: (FSFile new name: 'File1').
	directory add: (FSFile new name: 'File5').
	


	res := directory searchByName: 'File1'.

	self assert: res size equals: 2
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByNameIsOkWithNotMatchedName [

	| directory res |
	directory := FSDirectory new.
	directory add: (FSFile new name: 'File1').
	directory add: (FSFile new name: 'File2').
	directory add: (FSFile new name: 'File3').
	directory add: (FSFile new name: 'File4').
	directory add: (FSFile new name: 'File5').



	res := directory searchByName: 'File6'.

	self assert: res size equals: 0
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByNameIsOkWithOneFile [

	| directory file res |
	directory := FSDirectory new.
	file := FSFile new.
	file name: 'File1'.
	directory add: file.
	
	res := directory searchByName: 'File1'.

	self assert: res size equals: 1
]

{ #category : 'tests' }
FSDirectoryTest >> testSearchByNameIsOkWithPrefixFile [

	| directory file res |
	directory := FSDirectory new.
	file := FSFile new.
	file name: 'File1'.
	directory add: file.

	res := directory searchByName: 'Fi'.

	self assert: res size equals: 1
]
