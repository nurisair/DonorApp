public  class ManageDonation_Mojdeh {
   
        @AuraEnabled (cacheable = true)
    
        public static List<Account> Top3Contributors(){
           return [SELECT Id, Name, Total_Donation__c, Anonymous__c
                   FROM Account
                   WHERE isPersonAccount = true
                   ORDER BY Total_Donation__c DESC LIMIT 3];
        }
       
    }