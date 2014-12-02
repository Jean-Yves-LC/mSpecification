classdef MockObjectToBeSpecified
    
    properties (SetAccess = protected, GetAccess = protected)
        status1 ;
        status2 ;
        status3 ;
    end
    
    methods
        
        function this = MockObjectToBeSpecified(status1, status2, status3)
            this.status1 = status1 ;
            this.status2 = status2 ;
            this.status3 = status3 ;
        end ;
        
        function status1 = getStatus1(this)
            status1 = this.status1 ;
        end ;
        
        function status2 = getStatus2(this)
            status2 = this.status2 ;
        end ;
        
        function status3 = getStatus3(this)
            status3 = this.status3 ;
        end ;
        
    end
    
end
