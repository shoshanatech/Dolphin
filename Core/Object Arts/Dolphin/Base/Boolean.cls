﻿"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Boolean
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Boolean guid: (GUID fromString: '{87b4c45c-026e-11d3-9fd7-00a0cc3e4a32}')!
Boolean isAbstract: true!
Boolean comment: 'Boolean is the class which provides the protocol for logical values. The actual logical values, true and false, are represented by Boolean''s subclasses True and False. Boolean itself is abstract.

In Smalltalk many control structures, such as conditional evaluations, are implemented by sending messages to Booleans, rather than by incorporating control flow mechanisms into the syntax of the language. The compiler does, however, inline certain commonly used messages such as #ifTrue:ifFalse: for reasons of performance. For this reason some methods of Boolean are not normally executed unless #perform:''d.

Booleans implement the ANSI protocols <Object> (by inheritance) and <boolean>.'!
!Boolean categoriesForClass!Kernel-Objects! !
!Boolean methodsFor!

& operand
	"Answer whether the receiver and the <boolean> argument, operand,
	are both true. Note that this is the evaluating conjunction, use #and: instead for 
	non-evaluating expressions.
	Implementation Note: The #ifTrue:ifFalse: is present in order to have the 
	VM check that the operand is actually a <Boolean>. The compiler will
	actually optimize a lot of this away and generate quite efficient code (try
	Ctrl+I to inspect the method and view the disassembly listing)."

	^(operand ifTrue: [true] ifFalse: [false]) and: [self]!

| operand
	"Answer whether either the receiver OR the <boolean> argument, operand,
	is true. Note that a logical expression using #| will evaluate both receiver
	and argument - use #or: instead for non-evaluating expressions, which
	are generally more efficient.
	Implementation Note: The #ifTrue:ifFalse: is present in order to have the 
	VM check that the operand is actually a <Boolean>. The compiler will
	actually optimize a lot of this away and generate quite efficient code (try
	Ctrl+I to inspect the method and view the disassembly listing)."

	^(operand ifTrue: [true] ifFalse: [false]) or: [self]!

and: operand 
	"Answer whether the receiver and the result of evaluating the <niladicValuable>,
	 operand, are both true. The argument is only evaluated if the receiver is true."

	"Implementation Note:  The compiler inlines this message if the argument
	is a literal block. The compiler assumes that the receiver will be a boolean,
	so this message cannot be overridden."

	^self subclassResponsibility!

asBoolean
	"Answer the receiver as a Boolean value (true OR false)."

	^self!

asDword
	"Answer the receiver in a form suitable for passing/returning as a
	32-bit integer value."

	^self subclassResponsibility
!

asParameter
	"Answer the value of the receiver in a form suitable for
	passing to an external function call."

	^self subclassResponsibility!

asUIntPtr
	"Answer the receiver in a form suitable for passing/returning as a Windows LRESULT
	(32 or 64-bit, depending on host OS) return value. The default is self (which will cause the
	default window proc. of the window to be called for most objects other than Integers when
	used as a return value)."

	^self subclassResponsibility!

deepCopy
	"Answer the receiver as Booleans are immutable"

	^self!

eqv: operand
	"Answer whether the receiver and <boolean> argument, operand,
	are the same."

	^self == operand!

ifFalse: operand 
	"Evaluate and answer the result of the evaluating the <niladicValuable>
	argument, operand, if the receiver is false, otherwise answer nil."

	"Implementation Note:  The compiler inlines this message if the argument
	is a literal block. The compiler assumes that the receiver will be a boolean,
	so this message cannot be overridden."

	^self subclassResponsibility!

ifFalse: falseOperand ifTrue: trueOperand 
	"Evaluate, and answer the result, of the <niladicValuable>, falseOperand, if 
	the receiver is false, or the <niladicValuable>, trueOperand, if the receiver is 
	true."

	"Implementation Note:  The compiler inlines this message if the arguments
	are literal blocks. The compiler assumes that the receiver will be a boolean,
	so this message cannot be overridden."

	^self subclassResponsibility!

ifTrue: operand
	"Evaluate and answer the result of the evaluating the <niladicValuable>
	argument, operand, if the receiver is true, otherwise answer nil."

	"Implementation Note:  The compiler inlines this message if the argument
	is a literal block. The compiler assumes that the receiver will be a boolean,
	so this message cannot be overridden."

	^self subclassResponsibility!

ifTrue: trueOperand ifFalse: falseOperand 
	"Evaluate, and answer the result, of the <niladicValuable>, falseOperand, if 
	the receiver is false, or the <niladicValuable>, trueOperand, if the receiver is 
	true."

	"Implementation Note:  The compiler inlines this message if the arguments
	are literal blocks. The compiler assumes that the receiver will be a boolean,
	so this message cannot be overridden."

	^self subclassResponsibility!

isAtomic
	"Answer whether or not the receiver has a single unique instance for any individual value it
	can represent."

	"Boolean has two unique instances, identified by the literals true and false."

	^true!

isLiteral
	"Answer whether or not the receiver has a literal representation (probably its
	printString) which is directly recognised by the Compiler."

	^true!

not
	"Answer the logical inverse of the receiver"

	^self subclassResponsibility!

or: operand 
	"Answer whether either the receiver or the result of evaluating the
	<niladicValuable> argument, operand, is true. The argument is only
	evaluated if the receiver is false."

	"Implementation Note:  The compiler inlines this message if the argument
	is a literal block. The compiler assumes that the receiver will be a boolean,
	so this message cannot be overridden."

	^self subclassResponsibility!

shallowCopy
	"Answer the receiver as there are only two Booleans, the manifest constants
	true and false."

	^self!

xor: operand
	"Answer whether either the receiver or the <boolean> argument, operand,
	is true, but not both.
	N.B. Note that this a logical operation, like #eqv:, rather than a controlling
	operation, like and:, #or:, and expects a boolean argument, not a niladic
	valuable.
	This method was incorrectly defined in Dolphin versions pre-dating beta 2f."

	^self ~~ operand! !
!Boolean categoriesFor: #&!logical operations!public! !
!Boolean categoriesFor: #|!logical operations!public! !
!Boolean categoriesFor: #and:!control flow!public! !
!Boolean categoriesFor: #asBoolean!converting!public! !
!Boolean categoriesFor: #asDword!converting!public! !
!Boolean categoriesFor: #asParameter!converting!public! !
!Boolean categoriesFor: #asUIntPtr!converting!public! !
!Boolean categoriesFor: #deepCopy!copying!public! !
!Boolean categoriesFor: #eqv:!logical operations!public! !
!Boolean categoriesFor: #ifFalse:!control flow!public! !
!Boolean categoriesFor: #ifFalse:ifTrue:!control flow!public! !
!Boolean categoriesFor: #ifTrue:!control flow!public! !
!Boolean categoriesFor: #ifTrue:ifFalse:!control flow!public! !
!Boolean categoriesFor: #isAtomic!public!testing! !
!Boolean categoriesFor: #isLiteral!public!testing! !
!Boolean categoriesFor: #not!logical operations!public! !
!Boolean categoriesFor: #or:!control flow!public! !
!Boolean categoriesFor: #shallowCopy!copying!public! !
!Boolean categoriesFor: #xor:!logical operations!public! !

Boolean methodProtocol: #boolean attributes: #(#ansi #readOnly) selectors: #(#& #| #and: #eqv: #ifFalse: #ifFalse:ifTrue: #ifTrue: #ifTrue:ifFalse: #not #or: #xor:)!

!Boolean class methodsFor!

new
	"It is not necessary to instantiate Booleans - use the literals 'true' 
	and 'false'."

	^self shouldNotImplement! !
!Boolean class categoriesFor: #new!instance creation!public! !

