# DesignPatterns
Design Patterns in Cocoa, implemented using Objective-C
## Creational Pattern -- Prototype
1. When a complex object cannot be created, it is easy to clone.
2. Deep clone, copies the referenced object too, not just the pointer.
3. copy method calls copyWithZone: by default.
4. Classes that is clonable has to implement NSCopying protocol.
5. Cloning logic goes in copyWithZone:
## Creational Pattern -- Singleton
1. Create only one object of this class.
2. init method is private.
3. Static class reference and provide class method for object creation.
4. class method lazy instantiates in a synchronized block or dispatch_once queue.
## Creational Pattern -- Factory method
1. Defer class instantiation, implemented as a Singleton
2. Use reflection for instantiation.
3. Parameterized with product key to create multiple products.
4. Product keys updated, when protocol extended for new products.
5. Concrete products can be cloned.
## Creational Pattern -- Abstract Factory
1. Multiple concrete factories are needed or extended later.
3. Each concrete factory extends factory method
## Creational Pattern -- Builder
1.Seperate creational process and object representation
2.Director has a reference to Builder protocol.
3.Director orchestrates with provided concrete builder, which has the end-product.
4.Director returns end-product after orchestration.
5.Concrete builder switched to return different end-product.
