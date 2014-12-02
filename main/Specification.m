classdef Specification
    
    properties
    end
    
    methods (Abstract)
        status = isSatisfiedBy(this, anObject)
    end
    
    methods
        
        function self = Specification()
        end ;
        
        function andSpecification = and(this, spec)
            andSpecification = AndSpecification(this, spec) ;
        end ;
        
        function orSpecification = or(this, spec)
            orSpecification = OrSpecification(this, spec) ;
        end ;
        
        function notSpecification = not(this)
            notSpecification = NotSpecification(this) ;
        end ;
        
    end ;
    
end

