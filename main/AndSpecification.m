classdef AndSpecification < Specification
    
    properties (SetAccess = protected, GetAccess = protected)
        left ;
        right ;
    end
    
    methods
        
        function this = AndSpecification(left, right)
            this.left = left ;
            this.right = right ;
        end ;
        
        function status = isSatisfiedBy(this, anObject)
            status = this.left.isSatisfiedBy(anObject) & this.right.isSatisfiedBy(anObject) ;
        end ;
        
    end
    
end

