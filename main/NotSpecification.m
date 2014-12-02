classdef NotSpecification < Specification
    
    properties (SetAccess = protected, GetAccess = protected)
        left ;
    end
    
    methods
        
        function this = NotSpecification(left)
            this.left = left ;
        end ;
        
        function status = isSatisfiedBy(this, anObject)
            status = ~this.left.isSatisfiedBy(anObject) ;
        end ;
        
    end
    
end

