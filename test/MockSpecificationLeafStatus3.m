classdef MockSpecificationLeafStatus3 < Specification
    
    properties
    end
    
    methods (Static)
        function status = isSatisfiedBy(anObject)
            status = anObject.getStatus3() ;
        end ;
    end
    
end
