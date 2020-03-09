public class P0B {

	/////////////////////////////////////////////////////////////////// 
    // 
    // Name: Project 0 Bravo 
    // Author: Vincent Espinoza (Vincent.Espinoza@Yahoo.com) 
    // Date: 02/25/2020 
    // Description: Series of apex methods to demonstrate 
    // basic understanding of coding concepts. 
    // 
    ///////////////////////////////////////////////////////////////// 
     
    /* Write the following methods in a class called P0B.  
    Note: The method signatures are given. */ 
     
    /* 
     * 1. Return the nth Fibonacci number 
     * Test Cases: 
     * Input: 0     Output: 0 
     * Input: 1    Output: 1 
     * Input: 2     Output: 1 
     * Input: 10    Output: 55 

                      					fib(5)   
                                 /                \
                           fib(4)                fib(3)   
                         /        \              /       \ 
                     fib(3)      fib(2)         fib(2)   fib(1)
                    /    \       /    \        /      \
              fib(2)   fib(1)  fib(1) fib(0) fib(1) fib(0)
              /     \
            fib(1) fib(0)
     */ 
    public static Integer nFibonacci( Integer n ){ 
        
        
        System.Debug(n);

        if (n <= 1){
       		return n; 
        }
        
        System.Debug('|  | ');
        System.Debug((n-1) + ' ' + (n-2));
 
    	return nFibonacci(n-1) + nFibonacci(n-2);
    } 

    /* 
     * 2. Sort an array of integers. 
     * Test Cases: 
     * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5] 
     * Input: [5,4,3,2,1]     Output: [1,2,3,4,5] 
     * 
     * Don't use the sort() method... that would be lame. 
    */ 
    public static Integer[] sortArray( Integer[] intList ) { 
 		/*
        boolean isSorted = false;
        integer size = intList.Size();
        
        while(!isSorted){
            
            boolean swapped = false;
            for(integer i =0;i<size;i++){
                
                if(i!=size-1){
                    
                    if(intList[i]>intList[i+1]){
                        
                        integer temp = intList[i];
                        intList[i]=intList[i+1];
                        intList[i+1]=temp; 
                        swapped = true;
                    }
                }
            }
            
            if(!swapped){
                isSorted = true;
            }
        }*/
        
        for(integer i = 0;i<intList.Size();i++){
            
            for(integer j = i+1;j<intList.Size();j++){
                if(intList[i]>intList[j]){
                    integer temp = intList[j];
                    intList[j] = intList[i];
                    intList[i] = temp;
                }
                
            }
            
        }
        
        return intList;
	} 
    
	/* 
     * 3. Return the factorial of n. 
     * Test Cases: 
     * Input: 0    Output: 1 
     * Input: 1    Output: 1 
     * Input: 3    Output: 6 
    */ 
    public static Integer nFactorial( Integer n) { 
    	
        integer num = 1;
        
        for(integer i = 1;i<=n;i++){
            num *= i;
        }
        return num;
    }    
    
    /* 
     * 4. Rotate left 
     * Given an array, array, and an integer, n, rotate the values in array left n times and return array 
     * Test Cases: 
     * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1] 
     * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1] 
     * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3] 
    */ 
    public static Integer[] rotateLeftNTimes( Integer[] arra, Integer n) { 

        for(integer j = 0;j<n;j++){
            
            integer temp=0;

            for(integer i = 0;i<arra.Size();i++){
                
                //if index 0 can't move left anymore store to replace the last element with it
                if(i==0){
                    temp = arra[0];
                }
                
                //if index is not last element in list make element equal to the element to the right of it
                if(i!=arra.Size()-1){
                    arra[i] = arra[i+1];
                }else{
                    arra[i] = temp;
                } 	
        	}
        }

        return arra;
    } 
    
    /* 
     * 5. Balanced Brackets 
     * A bracket is any one of the following: (, ), {, }, [, or ] 
     *  
     * The following are balanced brackets: 
     *    ( ) 
     *    ( ) ( ) 
     *    ( ) [ ]
     *    ( ( ) ) 
     *    ( { [ ] } ) 
     * 
     * The following are NOT balanced brackets: 
     *   ( 
     *   ) 
     *   ( ( ) 
    
     
     
     *   ( [ ) ] 
     * 
     * Return true if balanced 
     * Return false if not balanced 
    */
    
    public static Boolean bracketsAreBalanced( String s ) { 
        
        Boolean isBalanced = true;
        
        s = s.replaceAll(' ', '');
        
        System.Debug(s);
        
        List<String> arr = s.split('');
        List<String> acceptedInputs = new List<String>{'{','[','(',')',']','}'};
        List<String> arr2 = new List<String>();
		
        Map<String,String> pair = new Map<String,String>();
        
        pair.put('[', ']');
        pair.put('{', '}');
        pair.put('(', ')');

        ////////

        Integer x =0;
        
        ///filter out input besides brackets
        while(x < arr.size()){
            if(!acceptedInputs.contains(arr[x])){
                arr.remove(x);
            }else{
                x++;
            }
        }
        
        //fill parallel list with reversed list
        Integer size = arr.Size()-1;
        for(Integer i = size;i>=0;i--){
            arr2.add(arr[i]);
        }
        
        System.Debug(' : ' + arr + ' : ' );
        System.Debug(' : ' + arr2 + ' : ' );
        ///////
    
   
        //iterate through list and compare each element from main string list to reversed list, if its a balanced combination remove element from both
        //the main list and reversed list, if not then check if element next in main list will be a balanced combination. If true, remove combination from 
        //main and reversed list, if false then return false. 
        for(Integer j = 0;j<arr.Size();j++){
            //System.Debug('Current: ' +j);
            String val = pair.get(arr[j]);
            //System.Debug(arr[j] + ' expected: ' + val + ' to ' + arr2[j]);
            if(val!=null){
                
                if(arr2[j]!=val){
                    //System.Debug('Failed against: ' + arr2[j]);
                    if(j < arr.Size()-1){
                        //System.Debug(arr[j] + ' : ' + arr[j+1]);
                        if(arr[j+1]!=val){
                            //isBalanced = false;
                            return false;
                        }else{
                            //System.debug('REMOVING: ' + arr[j+1] + ' AND ' + arr[j]);
							arr.remove(j+1);
                            arr.remove(j);
                            //System.debug(arr);
                            arr2.Clear();
                            //System.Debug(arr2.Size());
                            Integer size2 = arr.Size()-1;
                            for(Integer i = size2;i>=0;i--){
                                arr2.add(arr[i]);
                            }
							j=-1;
                        }
                    }else{
                        //isBalanced = false;
                        return false;
                    }
                }else{
                    arr.remove(j);
                    if(arr.Size()!=0){
                        arr.remove(arr.Size()-1);
                    }
                    
                    arr2.remove(j);
                    
                    if(arr2.Size()!=0){
                        arr2.remove(arr2.Size()-1);
                    }
                 	
                    j=-1;
					
                }
                
                //System.debug(arr + ' ' + arr2);
            }
        }
    	
  		return isBalanced;
	} 
    
    /* 
     * 6. Create a method that retrieves a list of all accounts and updates those accounts. 
     *      Create a custom field on the Account standard object called Size__c that will be a  
     * picklist containing small/medium/large. 
     *     Create a method that retrieves a list of all accounts.  
     *         - If an account has between 1-1000 employees then it is classified as small. 
     *         - If an account has between 1001-10000 employees it is classified as medium. 
    *         - If an account has more than 10000 employees it is classified as large. 
     *     Update the Size__c field on each account to reflect the amount of employees in the Account . 
    */ 
    public static void updateAccountSize( ) { 
        
		List<Account> accounts = [SELECT id,Name,NumberOfEmployees FROM Account];  

        for(Account acc:accounts){
            if(acc.NumberOfEmployees <=1000 && acc.NumberOfEmployees >= 1){
                acc.Size_c__c = 'small';
                update acc;
            }else if(acc.NumberOfEmployees <=10000 && acc.NumberOfEmployees >= 1001){
                acc.Size_c__c = 'medium';
                update acc;
            }else if(acc.NumberOfEmployees > 10000){
                acc.Size_c__c = 'large';
                update acc;
            }
            System.debug(acc);
        }
    } 
    
    /*  
     * 7. Create a method that will find all leads that contain 'ca' in their fields.  
     *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not  
     * Converted' and their description should display the message, "We are no longer doing  
     * business in California." 
     */ 
    public static void updateCALeads( ) { 
        
    	List<Lead> leads = [SELECT id,Name,Status,Address,Description FROM Lead WHERE state = 'CA'];  

        for(Lead l:leads){	
      
            System.Debug(l);
            l.Status = 'Closed - Not Converted';
            l.Description = 'We are no longer doing business in California.';
            update l;
            System.Debug(l);
            /*
            if(l.Address.getState()=='CA'){
                l.Status = 'Closed - Not Converted';
                System.Debug(l);
            }*/
        	
        }

    } 
    
    /* 
     * 8. Create a method that will find all Opportunities which have already passed their Close Date  
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and  
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'. 
     */ 
    public static void closePastDueOpportunities( ) { 
      
        //String today = Datetime.now().format('yyyy-MM-dd');
        
        List<Opportunity> opportunities = [SELECT id,Name,StageName,CloseDate FROM Opportunity WHERE StageName != 'Closed Won' AND CloseDate < today];  
        
		for(Opportunity op:opportunities){
            op.StageName = 'Closed Lost';
            update op;
			System.Debug(op);
        }
    } 
	
}