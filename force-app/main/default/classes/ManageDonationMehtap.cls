public with sharing class ManageDonationMehtap {
    @AuraEnabled(cacheable=true)
     public static List<Account> getTopContributors() {
         // Declare the topContributors variable outside of the if block
         List<Account> topContributors = new List<Account>();
 
         // Validate CRUD permission before SOQL operation
         if (Schema.sObjectType.Account.isAccessible()) {
             topContributors = [SELECT Id, Name, Total_Donation__c
                                FROM Account
                                WHERE IsPersonAccount = true
                                ORDER BY Total_Donation__c DESC
                                LIMIT 3];
                                             
         }
         return topContributors;   
 
         // Validate CRUD permission before DML operation
         //if (Schema.sObjectType.Account.isCreateable() && Schema.sObjectType.Account.isUpdateable()) {
            // Account acc = new Account(Name = 'Test AccountArzu', Phone = '3172921314');
             //insert acc;
       //  }
 
      
        
     }
 }