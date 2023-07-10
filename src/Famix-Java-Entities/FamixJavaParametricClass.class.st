Class {
	#name : #FamixJavaParametricClass,
	#superclass : #FamixJavaClass,
	#traits : 'FamixTParametricEntity',
	#classTraits : 'FamixTParametricEntity classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParametricClass class >> annotation [

	<FMClass: #ParametricClass super: #FamixJavaClass>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #'as yet unclassified' }
FamixJavaParametricClass >> allParameter [ 

	|collection|
	collection := OrderedCollection new.
	collection addAll: self concreteParameters , self genericParameters .
	^ collection 
]
