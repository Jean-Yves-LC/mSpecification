mSpecification
==============

## What is it?
A Matlab implementation of the Specification Pattern (Eric Evans, Martin Fowler).

A detailed description of the pattern can be found here : http://martinfowler.com/apsupp/spec.pdf.

Basically, the Specification is a composite whose leaves are business rules and whose branches are boolean operators. It is then quite easy to build a complex rule (specification) by combining elementary rules. The compliance of an object to the specification thus obtained is checked by calling the isSatisfiedBy method of the specification, taking the object as a parameter.

In the present implementation, we overloaded the "and" (&), "or" (|) and "not" (~) operators, so as making combinations of rules more user friendly.


## How to install it?



## How to use it?
For instance, let's consider the "Person" class:


    classdef Person
    
      properties
        age ;
        sex ;
      end
      
      methods
        function this = Person(age, sex)
          this.age = age ;
          this.sex = sex ;
        end
      end ;
      
    end


Let's create a specification checking if a person is under 30. This is done by extending the "Specification" class:


    classdef PersonUnder30Specification < Specification
    
      methods
        function status = isSatisfiedBy(this, person)
          if person.age < 30
            status = true ;
          else
            status = false ;
          end
        end
      end
      
    end


and let's use it:


    jen = Person(16, 'female') ;
    ageSpec = PersonUnder30Specification() ;
    
    test = ageSpec.isSatisfiedBy(Jen) ;


In this case the test variable turns out to be true...


Now let's create a specification checking if a person is male:


    classdef PersonMaleSpecification < Specification
    
      methods
        function status = isSatisfiedBy(this, person)
          if strcmp(person.sex, 'male')
            status = true ;
          else
            status = false ;
          end
        end
      end
      
    end


We can now combine the two previous specifications to instanciate a new one, checking if a person is under 30 AND male:


    newSpec = PersonUnder30Specification() & PersonMaleSpecification() ;
    test = newSpec.isSatisfiedBy(Jen) ;


Since Jen is a lady, and although she's 16, the test variable is now false...


