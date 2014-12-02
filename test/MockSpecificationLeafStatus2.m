classdef MockSpecificationLeafStatus2 < Specification
    
    properties
    end
    
    methods (Static)
        function status = isSatisfiedBy(anObject)
            status = anObject.getStatus2() ;
        end ;
    end
    
end
