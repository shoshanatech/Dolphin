﻿"Filed out from Dolphin Smalltalk 7"!

ListControlTest subclass: #ListBoxTest
	instanceVariableNames: 'lbnSelChange'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ListBoxTest guid: (GUID fromString: '{0cceab03-640d-4bd6-8e8c-1da96bf288d2}')!
ListBoxTest isAbstract: true!
ListBoxTest comment: ''!
!ListBoxTest categoriesForClass!Unclassified! !
!ListBoxTest methodsFor!

classToTest
	^ListBox!

newSelectionAfterLeftClickOutsideList: anArrayOfInteger 
	^anArrayOfInteger!

setupClickIntercept
	| anonClass method |
	"Convert the ListBox to an instance of an anonymous subclass with an override of lbnSelChange handler that allows us to intercept the notifications."
	anonClass := ListBox newAnonymousSubclass.
	presenter view becomeA: anonClass.
	method := anonClass
				compile: 'lbnSelChange
		#placeholder value.
		^super lbnSelChange'.
	self assert: (method literalAt: 1) equals: #placeholder.
	lbnSelChange := [clicks addLast: #()].
	method whileMutableDo: 
			[method literalAt: 1 put: [lbnSelChange value]]!

testNewSelectionsClickOutsideListWithModifiers
	| event selection expected |
	self setUpForSelectionTesting.
	selection := #(1).
	"Behaviour of the ListBox in multi-select mode differs from the ListView in that clicking past the end is the same as clicking at the end."
	OrderedCollection new
		add: #(#(#control) #(1 10));
		add: {#(#shift). 1 to: 10};
		add: {#(#control #shift). 1 to: 10};
		do: 
				[:pair |
				presenter selectionsByIndex: selection.
				event := self mouseDownEventOnItem: 0 buttons: (pair first copyWith: #left).
				expected := self isMultiSelect ifTrue: [pair second] ifFalse: [selection].
				self verifySelectionsFromMouseDown: event equals: expected]!

verifyClicks: anArray
	self assert: clicks size equals: anArray size! !
!ListBoxTest categoriesFor: #classToTest!helpers!private! !
!ListBoxTest categoriesFor: #newSelectionAfterLeftClickOutsideList:!helpers!private! !
!ListBoxTest categoriesFor: #setupClickIntercept!private! !
!ListBoxTest categoriesFor: #testNewSelectionsClickOutsideListWithModifiers!public!unit tests! !
!ListBoxTest categoriesFor: #verifyClicks:!helpers!private! !

