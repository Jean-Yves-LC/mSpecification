classdef MockSpecificationLeafStatus1 < Specification
    
    properties
    end
    
    methods (Static)
        function status = isSatisfiedBy(anObject)
            status = anObject.getStatus1() ;
        end ;
    end
    
end
