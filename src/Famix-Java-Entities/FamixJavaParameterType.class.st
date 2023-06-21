Class {
	#name : #FamixJavaParameterType,
	#superclass : #FamixJavaType,
	#traits : 'FamixTGenericParameterType + FamixTTypedEntity',
	#classTraits : 'FamixTGenericParameterType classTrait + FamixTTypedEntity classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameterType class >> annotation [

	<FMClass: #ParameterType super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #testing }
FamixJavaParameterType >> isParameterType [
	^ true
]
