Object Oriented Designについて
==================================

// Memo: this is quite a mess,

Design pattern,
http://www.oodesign.com/

For source code see gachiemchiep/javakiso
Use eclipse plugin "ObjectAid UML Explorer" to view uml

TODO: 定義、例だけについて読みました、"Specific problems and implementation"の方をまだ触らない

Creational Patterns
------------------------

Singleton Pattern
    Ensure that only one instance of a class is created.
    Provide a global point of access to the object.
    # example
    Logger Classes
    Configuration Classes
    Accesing resources in shared mode
     Factories implemented as Singletons

Factory
    creates objects without exposing the instantiation logic to the client.
    refers to the newly created object through a common interface
    # base on id , create different object
    # TODO

Factory Method
    Defines an interface for creating objects, but let subclasses to decide which class to instantiate
    Refers to the newly created object through a common interface
    # example
    Documents Application.

Abstract Factory
    Abstract Factory offers the interface for creating a family of related objects, without explicitly specifying their classes.
    # example
    the system needs to be independent from the way the products it works with are created.
    the system is or should be configured to work with multiple families of products.
    a family of products is designed to work only all together.
    the creation of a library of products is needed, for which is relevant only the interface, not the implementation, too.




A singleton gives you:

    Global access to an object, and
    A guarantee that no more than one object of this type can ever be created

Good Situations to use Singletons (not many):

    Logging frameworks
    Thread recycling pools






