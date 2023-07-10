Class {
	#name : #FamixJavaParametricInterface,
	#superclass : #FamixJavaInterface,
	#traits : 'FamixTParametricEntity',
	#classTraits : 'FamixTParametricEntity classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParametricInterface class >> annotation [

	<FMClass: #ParametricInterface super: #FamixJavaInterface>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #'as yet unclassified' }
FamixJavaParametricInterface >> allParameter [ 

	|collection|
	collection := OrderedCollection new.
	collection addAll: self concreteParameters , self genericParameters .
	^ collection 
]
