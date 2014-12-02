classdef TestSpecification < TestCase
    
    properties
    end
    
    methods
        
        function self = TestSpecification(name)
            self = self@TestCase(name);
        end
        
        %   1 & 1 & 1 -> 1
        function testAndSpecification1(this)
            mockObj = MockObjectToBeSpecified(true, true, true) ;
            spec = MockSpecificationLeafStatus1() & MockSpecificationLeafStatus2() & MockSpecificationLeafStatus3() ;
            expectedStatus = true ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   0 & 1 & 1-> 0
        function testAndSpecification2(this)
            mockObj = MockObjectToBeSpecified(false, true, true) ;
            spec = MockSpecificationLeafStatus1() & MockSpecificationLeafStatus2() & MockSpecificationLeafStatus3() ;
            expectedStatus = false ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   1 & 0 & 1-> 0
        function testAndSpecification3(this)
            mockObj = MockObjectToBeSpecified(true, false, true) ;
            spec = MockSpecificationLeafStatus1() & MockSpecificationLeafStatus2() & MockSpecificationLeafStatus3() ;
            expectedStatus = false ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   1 & 1 & 0 -> 0
        function testAndSpecification4(this)
            mockObj = MockObjectToBeSpecified(true, true, false) ;
            spec = MockSpecificationLeafStatus1() & MockSpecificationLeafStatus2() & MockSpecificationLeafStatus3() ;
            expectedStatus = false ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   1 & 1 & ~0 -> 1
        function testAndSpecification5(this)
            mockObj = MockObjectToBeSpecified(true, true, false) ;
            spec = MockSpecificationLeafStatus1() & MockSpecificationLeafStatus2() & ~MockSpecificationLeafStatus3() ;
            expectedStatus = true ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   1 | 1 -> 1
        function testOrSpecification1(this)
            mockObj = MockObjectToBeSpecified(true, true, true) ;
            spec = MockSpecificationLeafStatus1() | MockSpecificationLeafStatus2() ;
            expectedStatus = true ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   1 | 0 -> 1
        function testOrSpecification2(this)
            mockObj = MockObjectToBeSpecified(true, false, true) ;
            spec = MockSpecificationLeafStatus1() | MockSpecificationLeafStatus2() ;
            expectedStatus = true ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   0 | 1 -> 1
        function testOrSpecification3(this)
            mockObj = MockObjectToBeSpecified(false, true, true) ;
            spec = MockSpecificationLeafStatus1() | MockSpecificationLeafStatus2() ;
            expectedStatus = true ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   0 | 0 -> 0
        function testOrSpecification4(this)
            mockObj = MockObjectToBeSpecified(false, false, true) ;
            spec = MockSpecificationLeafStatus1() | MockSpecificationLeafStatus2() ;
            expectedStatus = false ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   ~1 -> 0
        function testNotSpecification1(this)
            mockObj = MockObjectToBeSpecified(true, true, true) ;
            spec = ~MockSpecificationLeafStatus1() ;
            expectedStatus = false ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   ~0 -> 1
        function testNotSpecification2(this)
            mockObj = MockObjectToBeSpecified(false, true, true) ;
            spec = ~MockSpecificationLeafStatus1() ;
            expectedStatus = true ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   0 & (0 | 1) -> 0
        function testCompositeSpecification1(this)
            mockObj = MockObjectToBeSpecified(false, false, true) ;
            spec = MockSpecificationLeafStatus1() & (MockSpecificationLeafStatus2() | MockSpecificationLeafStatus3()) ;
            expectedStatus = false ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   (0 & 0) | 1 -> 1
        function testCompositeSpecification2(this)
            mockObj = MockObjectToBeSpecified(false, false, true) ;
            spec = (MockSpecificationLeafStatus1() & MockSpecificationLeafStatus2()) | MockSpecificationLeafStatus3() ;
            expectedStatus = true ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   (~0 & 0) | 1 -> 1
        function testCompositeSpecification3(this)
            mockObj = MockObjectToBeSpecified(false, false, true) ;
            spec = (~MockSpecificationLeafStatus1() & MockSpecificationLeafStatus2()) | MockSpecificationLeafStatus3() ;
            expectedStatus = true ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   (0 & ~0) | 1 -> 1
        function testCompositeSpecification4(this)
            mockObj = MockObjectToBeSpecified(false, false, true) ;
            spec = (MockSpecificationLeafStatus1() & ~MockSpecificationLeafStatus2()) | MockSpecificationLeafStatus3() ;
            expectedStatus = true ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
        %   (0 & 0) | ~1 -> 0
        function testCompositeSpecification5(this)
            mockObj = MockObjectToBeSpecified(false, false, true) ;
            spec = (MockSpecificationLeafStatus1() & MockSpecificationLeafStatus2()) | ~MockSpecificationLeafStatus3() ;
            expectedStatus = false ;
            assertEqual(expectedStatus, spec.isSatisfiedBy(mockObj)) ;
        end ;
        
    end
    
end
