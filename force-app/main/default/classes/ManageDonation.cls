public with sharing class ManageDonation {

    @AuraEnabled(cacheable=true)
    public static List<Account> fetchTopContributors() {
        return [SELECT Id, Name, Total_Donation__c
                FROM Account
                WHERE IsPersonAccount = true
                ORDER BY Total_Donation__c DESC
                LIMIT 3];
    }
}