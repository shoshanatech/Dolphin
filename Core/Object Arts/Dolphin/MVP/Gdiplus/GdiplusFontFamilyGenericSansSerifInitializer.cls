﻿"Filed out from Dolphin Smalltalk 7"!

GdiplusFontFamilyInitializer subclass: #GdiplusFontFamilyGenericSansSerifInitializer
	instanceVariableNames: ''
	classVariableNames: 'Default'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GdiplusFontFamilyGenericSansSerifInitializer guid: (GUID fromString: '{f784e19e-0b3b-498c-a5c4-456c191906c7}')!
GdiplusFontFamilyGenericSansSerifInitializer comment: ''!
!GdiplusFontFamilyGenericSansSerifInitializer categoriesForClass!Unclassified! !
!GdiplusFontFamilyGenericSansSerifInitializer methodsFor!

createHandle
	| gpHandle status |
	gpHandle := ExternalHandle new.
	status := self library gdipGetGenericFontFamilySansSerif: gpHandle.
	status == Ok ifFalse: [self gdiplusErrorWith: status].
	^gpHandle! !
!GdiplusFontFamilyGenericSansSerifInitializer categoriesFor: #createHandle!private!realizing/unrealizing! !

!GdiplusFontFamilyGenericSansSerifInitializer class methodsFor!

uninitialize
	GenericSansSerif := nil! !
!GdiplusFontFamilyGenericSansSerifInitializer class categoriesFor: #uninitialize!class hierarchy-removing!private! !

