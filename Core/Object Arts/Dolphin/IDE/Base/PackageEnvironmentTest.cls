﻿"Filed out from Dolphin Smalltalk 7"!

BrowserEnvironmentTest subclass: #PackageEnvironmentTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
PackageEnvironmentTest guid: (GUID fromString: '{4375158a-0238-45ad-86e5-967559575ded}')!
PackageEnvironmentTest comment: 'SUnitBrowser openOnTestCase: self'!
!PackageEnvironmentTest categoriesForClass!Refactory-Testing! !
!PackageEnvironmentTest methodsFor!

classNamesFor: aPackageEnvironment
	"Superclass implementation will fail because PackageEnvironment may contain partial classes
	and therefore some classes will be in both the environment and its negation."

	| classNames allClassNames |
	classNames := aPackageEnvironment classNames asSet
				addAll: aPackageEnvironment not classNames;
				yourself.
	allClassNames := BrowserEnvironment new classNames.
	self assert: classNames equals: allClassNames.
	"	looseClasses := Set new.
	aPackageEnvironment packageNames do: [:eachPak | (Package manager packageNamed: eachPak) methods 
		do: [:each | looseClasses add: each methodClass instanceClass name]].
	self assert: ((aPackageEnvironment & aPackageEnvironment not) classes symmetricDifference: looseClasses. 
				difference: looseClasses)."
	self assert: (aPackageEnvironment | aPackageEnvironment not) classNames equals: allClassNames!

testPackageEnvironment
	| env selectors |
	env := universalEnvironment
				forPackages: (Array with: (Package manager packageNamed: 'Dolphin Common Dialogs')).
	self universalTestFor: env.
	self assert: (env includesClass: Font).
	self deny: (env definesClass: Font).
	selectors := OrderedCollection new.
	env selectorsForClass: Font do: [:each | selectors add: each].
	self assert: selectors size equals: 0.
	self assert: (env includesClass: Font class).
	self deny: (env definesClass: Font class).
	env selectorsForClass: Font class do: [:each | selectors add: each].
	self assert: selectors size equals: 1.
	(Array with: FontDialog with: FontDialog class) do: 
			[:each |
			self assert: (env includesClass: each).
			self assert: (env definesClass: each)].
	self assert: (env includesSelector: #choose in: Font class).
	self deny: (env includesSelector: #icon in: Font class)! !
!PackageEnvironmentTest categoriesFor: #classNamesFor:!BrowserEnvironment tests!public! !
!PackageEnvironmentTest categoriesFor: #testPackageEnvironment!public!unit tests! !

