public with sharing class ManageDonationTubaK {

    @AuraEnabled(cacheable=true)
    public static List<Account> fetchTopContributors() {
                 // Declare the topContributors variable outside of the if block
        List<Account> accList;
                // Check if the user has the necessary CRUD permissions on the Account object
         if ((Schema.sObjectType.Account.isAccessible()) &&(Schema.sObjectType.Account.fields.Total_Donation__c.isAccessible()) ) {// Perform the SOQL query
             accList = [SELECT Id, Name, Total_Donation__c, Anonymous__c FROM Account
                                                WHERE IsPersonAccount = true
                                                ORDER BY Total_Donation__c DESC LIMIT 3];
                                            } return accList;
    }         
        
}

            
        


// public with sharing class ManageDonationTubaK {

//     @AuraEnabled(cacheable=true)
//     public static List<Account> fetchTopContributors() {
//         // Check if the user has the necessary CRUD permissions on the Account object
//         if (Schema.sObjectType.Account.isAccessible()) {
//             // Check if the user has read access to the 'Total_Donation__c' field
//             if (Schema.sObjectType.Account.fields.Total_Donation__c.isAccessible()) {
//                 // Perform the SOQL query
//                 List<Account> accList = [SELECT Id, Name, Total_Donation__c FROM Account
//                                         WHERE IsPersonAccount = true
//                                         ORDER BY Total_Donation__c DESC LIMIT 3];
//                 return accList;
//             } else {
//                 // Handle lack of field-level read access
//                 throw new NoAccessException('You do not have read access to the Total_Donation__c field.');
//             }
//         } else {
//             // Handle lack of object-level access
//             throw new NoAccessException('You do not have access to the Account object.');
//         }
//     }

//     public class NoAccessException extends Exception {
//         public NoAccessException(String message) {
//             super(message);
//         }
//     }
// }