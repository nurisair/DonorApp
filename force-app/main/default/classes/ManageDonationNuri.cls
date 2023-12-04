public with sharing class ManageDonationNuri {
    @AuraEnabled(cacheable=true)
    public static List<Account> fetchTopContributors() {
        // Write SOQL to get top 3 contributors with isPersonAccount = true
        // Sort by Total_Donation__c in descending order and limit to 3 records
        List<Account> topContributors = [SELECT Id, Name, Total_Donation__c
        FROM Account
        WHERE isPersonAccount = true
        ORDER BY Total_Donation__c DESC
        LIMIT 3];

        return topContributors;
    }
}