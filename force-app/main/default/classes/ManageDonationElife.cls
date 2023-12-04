public with sharing class ManageDonationElife {
    @AuraEnabled(cacheable=true)
    public static List<Account> fetchTopContributors() {
        List<Account> topContributors = new List<Account>();
        
        // Validate CRUD permission before SOQL operation
        if (Schema.SObjectType.Account.isAccessible()) {
            topContributors = [
                SELECT Id, Name, Total_Donation__c, Anonymous__c
                FROM Account
                WHERE isPersonAccount = true
                ORDER BY Total_Donation__c DESC 
                LIMIT 3
            ];
            
            // Process the top contributors
            for (Account donation : topContributors) {
                // Business logic or processing can be added here if needed
                System.debug('Top Contributor: ' + donation.Name + ' - Total Amount: ' + donation.Total_Donation__c);
            }
        }
        
        return topContributors;
    }
    

   /* //Validate CRUD permission before DML OPERATION-User'in yeni kayit create yada update iznini kontrol eder
    If(Schema.SObjectType.Account.isCreateable() && Schema.SObjectType.Account.isUpdateable()){
        Account acc = new Account(Name='Test accountElife', Phone='12121212');
        insert acc;
    }

    //Process the top contributors-donorleri yeniler
    for(Account donation:topContributors){
        //you can perform any processing or business logic here
        system.debug('Top Contributer: '+donation.Name+ ' -Total Amount: '+ donation.Total_Donation__c);
    }
    return topContributors;
}*/
}