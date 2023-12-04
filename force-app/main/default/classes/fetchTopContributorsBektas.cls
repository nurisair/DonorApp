public with sharing class fetchTopContributorsBektas {
    public String personRecordTypeId = '0127g000003oNoBAAU'; 
    @AuraEnabled(cacheable=true)
    
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Total_Donation__c
                                    FROM Account
                                    //WHERE valueof(RecordTypeId) = personRecordTypeId
                                    ORDER BY Total_Donation__c DESC NULLS LAST
                                    LIMIT 3];
        
    }
}