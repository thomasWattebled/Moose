Class {
	#name : #FamixJavaParametricTest,
	#superclass : #TestCase,
	#instVars : [
		'parametricClass1'
	],
	#category : #'Famix-Java-Tests'
}

{ #category : #running }
FamixJavaParametricTest >> setUp [
	super setUp.
	
	parametricClass1 := FamixJavaParametricClass named:'ParametricClass1'
	
]

{ #category : #running }
FamixJavaParametricTest >> testConcreteAndGenericParameter [

|  parameter1 parameter2 |
parameter1 := FamixJavaType named:'String'.
parameter2 := FamixJavaParameterType  named:'V'.

parametricClass1  concreteParameter: { parameter1 }.
parametricClass1  genericParameter:  { parameter2  }.
self assertCollection: (parametricClass1  concreteParameter  )
		hasSameElements: {parameter1.  } .
self assertCollection: (parametricClass1  genericParameter  )
		hasSameElements: {parameter2  }.
]

{ #category : #running }
FamixJavaParametricTest >> testConcreteParameter [

|  parameter1 parameter2 |
parameter1 := FamixJavaType named:'String'.
parameter2 := FamixJavaType named:'Int'.

parametricClass1  concreteParameter: { parameter1. parameter2 }.

self assertCollection: (parametricClass1  concreteParameter  )
		hasSameElements: {parameter1. parameter2  } 
]

{ #category : #running }
FamixJavaParametricTest >> testConcretisationEntity [

| listT listString |
listT := FamixJavaParametricClass named: 'ListT'.
listString := FamixJavaParametricClass named: 'ListString'.
FamixJavaConcretisation new concreteEntity: listString ; genericEntity: listT .
self assertCollection: (listT concretisation collect:#concreteEntity  )
		hasSameElements: { listString }
]

{ #category : #running }
FamixJavaParametricTest >> testConcretisationParameter [

| parameterConcrete parameterGeneric |
parameterConcrete := FamixJavaType named:'parametric'.
parameterGeneric := FamixJavaParameterType named:'generic1'.
FamixJavaParameterConcretisation  new concreteParam: parameterConcrete; genericParam: parameterGeneric.

self assertCollection: (parameterGeneric concretisation collect:#concreteParam ) hasSameElements:{parameterConcrete } 
]

{ #category : #running }
FamixJavaParametricTest >> testGenericParameter [

|  parameter1 parameter2 |
parameter1 := FamixJavaParameterType named:'K'.
parameter2 := FamixJavaParameterType named:'V'.

parametricClass1  genericParameter: { parameter1. parameter2  }.

self assertCollection: (parametricClass1  genericParameter  )
		hasSameElements: {parameter1 . parameter2 } 
]

{ #category : #running }
FamixJavaParametricTest >> testInheritance [

| class1 class2 |

class1 := FamixJavaClass named:'Class1'.
class2 := FamixJavaClass named:'Class2'.

parametricClass1  addSubInheritance:  (FamixJavaInheritance new
			 subclass: class1 ;
			 superclass: parametricClass1 ). 
			
class1 addSubInheritance: (FamixJavaInheritance new subclass: class2;
superclass: class1).

self assertCollection: (parametricClass1  subclassHierarchy )
		hasSameElements: {class1. class2} 
]

{ #category : #running }
FamixJavaParametricTest >> testIsConcreteEntity [

|  parameter1 parameter2 |
parameter1 := FamixJavaType named:'String'.
parameter2 := FamixJavaParameterType  named:'V'.
self assert: parametricClass1 isConcreteEntity  .
parametricClass1  concreteParameter: { parameter1 }.
self assert: parametricClass1 isConcreteEntity .
parametricClass1  genericParameter:  { parameter2  }.
self deny: parametricClass1 isConcreteEntity .

]

{ #category : #running }
FamixJavaParametricTest >> testIsGenericEnity [

|  genericParameter1 genericParameter2 concreteParameter |
"concreteParameter --|> genericParameter2 --|> genericParameter1"
concreteParameter := FamixJavaType named:'String'.
genericParameter1 := FamixJavaParameterType  named:'1'.
genericParameter2 := FamixJavaParameterType  named:'2'.

FamixJavaInheritanceParametric new subparam:  genericParameter2 ; superparam: genericParameter1 .
FamixJavaInheritanceParametric new subparam:  concreteParameter ; superparam: genericParameter2 .

self assertCollection: (genericParameter1 subInheritance collect:#subparam) hasSameElements: { genericParameter2 }.
self assertCollection: (genericParameter2 subInheritance collect:#subparam) hasSameElements: { concreteParameter }.
self assertCollection: (genericParameter2 superInheritance collect:#superparam) hasSameElements: { genericParameter1 }.
self assertCollection: (concreteParameter superInheritance collect:#superparam) hasSameElements: { genericParameter2 }.

]
