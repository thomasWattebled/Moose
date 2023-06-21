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

parametricClass1  concreteParameters: { parameter1 }.
parametricClass1  genericParameters:  { parameter2  }.
self assertCollection: (parametricClass1  concreteParameters  )
		hasSameElements: {parameter1.  } .
self assertCollection: (parametricClass1  genericParameters  )
		hasSameElements: {parameter2  }.
]

{ #category : #running }
FamixJavaParametricTest >> testConcreteParameter [

|  parameter1 parameter2 |
parameter1 := FamixJavaType named:'String'.
parameter2 := FamixJavaType named:'Int'.

parametricClass1  concreteParameters: { parameter1. parameter2 }.

self assertCollection: (parametricClass1  concreteParameters  )
		hasSameElements: {parameter1. parameter2  } 
]

{ #category : #running }
FamixJavaParametricTest >> testConcretisationEntity [

| listT listString |
listT := FamixJavaParametricClass named: 'ListT'.
listString := FamixJavaParametricClass named: 'ListString'.
FamixJavaConcretisation new concreteEntity: listString ; genericEntity: listT .
self assertCollection: (listT concretisations collect:#concreteEntity  )
		hasSameElements: { listString }
]

{ #category : #running }
FamixJavaParametricTest >> testConcretisationParameter [

| parameterConcrete parameterGeneric |
parameterConcrete := FamixJavaType named:'parametric'.
parameterGeneric := FamixJavaParameterType named:'generic1'.
FamixJavaParameterConcretisation  new concreteParam: parameterConcrete; genericParam: parameterGeneric.

self assertCollection: (parameterGeneric concretisations collect:#concreteParam ) hasSameElements:{parameterConcrete } 
]

{ #category : #running }
FamixJavaParametricTest >> testGenericParameter [

|  parameter1 parameter2 |
parameter1 := FamixJavaParameterType named:'K'.
parameter2 := FamixJavaParameterType named:'V'.

parametricClass1  genericParameters: { parameter1. parameter2  }.

self assertCollection: (parametricClass1  genericParameters  )
		hasSameElements: {parameter1 . parameter2 } 
]

{ #category : #running }
FamixJavaParametricTest >> testInheritanceClass [

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
FamixJavaParametricTest >> testInheritanceParameter [


| supGeneric subGeneric subConcrete |
supGeneric :=FamixJavaParameterType named:'supGeneric'. 
subGeneric := FamixJavaParameterType named:'subGeneric'.
subConcrete := FamixJavaType named:'subConcrete'.

FamixJavaParametricInheritance new subparam:  subGeneric ; superparam: supGeneric .
self assertCollection: (supGeneric subInheritance collect:#subparam) hasSameElements: { subGeneric  }  .
subConcrete  addSuperInheritance: ( FamixJavaParametricInheritance  new subparam:  subConcrete   ; superparam: supGeneric) .
self assertCollection: (supGeneric subInheritance collect:#subparam) hasSameElements: { subGeneric. subConcrete  }  .
]

{ #category : #running }
FamixJavaParametricTest >> testIsConcreteEntity [

|  parameter1 parameter2 |
parameter1 := FamixJavaType named:'String'.
parameter2 := FamixJavaParameterType  named:'V'.
self assert: parametricClass1 isConcreteEntity  .
parametricClass1  concreteParameters: { parameter1 }.
self assert: parametricClass1 isConcreteEntity .
parametricClass1  genericParameters:  { parameter2  }.
self deny: parametricClass1 isConcreteEntity .

]

{ #category : #running }
FamixJavaParametricTest >> testIsGenericEnity [

|  genericParameter1 genericParameter2 concreteParameter |
"concreteParameter --|> genericParameter2 --|> genericParameter1"
concreteParameter := FamixJavaType named:'String'.
genericParameter1 := FamixJavaParameterType  named:'1'.
genericParameter2 := FamixJavaParameterType  named:'2'.

FamixJavaParametricInheritance new subparam:  genericParameter2 ; superparam: genericParameter1 .
FamixJavaParametricInheritance new subparam:  concreteParameter ; superparam: genericParameter2 .

self assertCollection: (genericParameter1 subInheritance collect:#subparam) hasSameElements: { genericParameter2 }.
self assertCollection: (genericParameter2 subInheritance collect:#subparam) hasSameElements: { concreteParameter }.
self assertCollection: (genericParameter2 superInheritance collect:#superparam) hasSameElements: { genericParameter1 }.
self assertCollection: (concreteParameter superInheritance collect:#superparam) hasSameElements: { genericParameter2 }.

]

{ #category : #running }
FamixJavaParametricTest >> testParametricMethod [
"List<Object> testMethod(List<Object> list)"
| method parametre list |

method := FamixJavaParametricMethod named:'testMethod'.
parametre := FamixJavaParameter named:'list'.
list := FamixJavaParametricClass named:'List'.
list addConcreteParameter: (FamixJavaType named:'Object').
parametre declaredType: list.
method addParameter: parametre.
method declaredType: list.
method addConcreteParameter: list




]
