﻿"Filed out from Dolphin Smalltalk 7"!

MethodRefactoring subclass: #TemporaryToInstanceVariableRefactoring
	instanceVariableNames: 'selector temporaryVariableName'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
TemporaryToInstanceVariableRefactoring guid: (GUID fromString: '{c0ad3ff1-c5d3-48f7-9104-4ee2542c6ba6}')!
TemporaryToInstanceVariableRefactoring comment: ''!
!TemporaryToInstanceVariableRefactoring categoriesForClass!Refactory-Refactorings! !
!TemporaryToInstanceVariableRefactoring methodsFor!

checkForValidTemporaryVariable
	| parseTree |
	parseTree := class parseTreeFor: selector.
	(parseTree allTemporaryVariables includes: temporaryVariableName) 
		ifFalse: 
			[self refactoringError: temporaryVariableName 
						, ' isn''t a valid temporary variable name'].
	(parseTree allArgumentVariables includes: temporaryVariableName) 
		ifTrue: 
			[self refactoringError: temporaryVariableName , ' is a block parameter'].
	(RBReadBeforeWrittenTester isVariable: temporaryVariableName
		readBeforeWrittenIn: parseTree) 
			ifTrue: 
				[self 
					refactoringWarning: ('<1s> is read before it is written.<n>Proceed anyway?' 
							expandMacrosWith: temporaryVariableName)]!

class: aClass selector: aSelector variable: aVariableName 
	#rbFix. "Ensure displayString works when model is lazily created for Undo/Redo name (needs inst. vars set up)."
	class := aClass.
	selector := aSelector.
	temporaryVariableName := aVariableName.
	class := self classObjectFor: aClass.
!

preconditions
	^(RBCondition definesSelector: selector in: class) 
		& (RBCondition hierarchyOf: class
				definesVariable: temporaryVariableName asString) not 
			& (RBCondition withBlock: 
						[self checkForValidTemporaryVariable.
						true])!

storeOn: aStream 
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream nextPutAll: ' class: '.
	class storeOn: aStream.
	aStream
		nextPutAll: ' selector: #';
		nextPutAll: selector;
		nextPutAll: ' variable: ''';
		nextPutAll: temporaryVariableName;
		nextPut: $'.
	aStream nextPut: $)!

transform
	| parseTree matcher protocols |
	parseTree := class parseTreeFor: selector.
	parseTree isNil ifTrue: [self refactoringError: 'Could not parse method'].
	protocols := class protocolsFor: selector.
	#rbFix.	"Not necessary to remove the method first - it is not an error to shadow and inst var with a temp"
	"class removeMethod: selector."
	class addInstanceVariable: temporaryVariableName.
	(matcher := ParseTreeRewriter removeTemporaryNamed: temporaryVariableName) executeTree: parseTree.
	class compileTree: matcher tree classified: protocols! !
!TemporaryToInstanceVariableRefactoring categoriesFor: #checkForValidTemporaryVariable!preconditions!public! !
!TemporaryToInstanceVariableRefactoring categoriesFor: #class:selector:variable:!initialize/release!public! !
!TemporaryToInstanceVariableRefactoring categoriesFor: #preconditions!preconditions!public! !
!TemporaryToInstanceVariableRefactoring categoriesFor: #storeOn:!printing!public! !
!TemporaryToInstanceVariableRefactoring categoriesFor: #transform!public!transforming! !

!TemporaryToInstanceVariableRefactoring class methodsFor!

class: aClass selector: aSelector variable: aVariableName 
	^self new 
		class: aClass
		selector: aSelector
		variable: aVariableName!

model: aRBNamespace class: aClass selector: aSelector variable: aVariableName 
	^(self new)
		model: aRBNamespace;
		class: aClass
			selector: aSelector
			variable: aVariableName;
		yourself! !
!TemporaryToInstanceVariableRefactoring class categoriesFor: #class:selector:variable:!instance creation!public! !
!TemporaryToInstanceVariableRefactoring class categoriesFor: #model:class:selector:variable:!instance creation!public! !

