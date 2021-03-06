﻿"Filed out from Dolphin Smalltalk 7"!

StTagNode subclass: #StAnnotationNode
	instanceVariableNames: 'selector'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
StAnnotationNode guid: (GUID fromString: '{e65cb014-8373-4447-9994-f337d37f7544}')!
StAnnotationNode comment: ''!
!StAnnotationNode categoriesForClass!System-Compiler! !
!StAnnotationNode methodsFor!

acceptVisitor: aProgramNodeVisitor
	^aProgramNodeVisitor visitAnnotationNode: self!

arguments
	"In future we may provide generic support for method annotations, with literal arguments."

	^#()!

selector
	^selector!

selector: aString
	selector := aString asSymbol! !
!StAnnotationNode categoriesFor: #acceptVisitor:!public!visitor! !
!StAnnotationNode categoriesFor: #arguments!public! !
!StAnnotationNode categoriesFor: #selector!accessing!public! !
!StAnnotationNode categoriesFor: #selector:!accessing!public! !

!StAnnotationNode class methodsFor!

selector: aString
	^self new
		selector: aString;
		yourself! !
!StAnnotationNode class categoriesFor: #selector:!accessing!public! !

