Class {
	#name : #FamixJavaParameterType,
	#superclass : #FamixJavaType,
	#traits : 'FamixTGenericParameterType + FamixTTypedEntity + FamixTWithInheritances',
	#classTraits : 'FamixTGenericParameterType classTrait + FamixTTypedEntity classTrait + FamixTWithInheritances classTrait',
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
