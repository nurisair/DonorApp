public with sharing class TopDonorsController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getTopDonors() {
        return [SELECT Id, Name, Total_Donation__c 
            FROM Account 
            WHERE isPersonAccount = True
            ORDER BY Total_Donation__c 
            DESC LIMIT 3];
    }
    @AuraEnabled
        public static List<Campaign> getRecordForm(String recordTypeId) {
        // Implement your query and logic here
        return [SELECT Id, RecordTypeId, Name, Target_Donation_Amount__c, Remaining_Donation_Amount__c, Achieved_Donation_Amount__c, EndDate FROM Campaign WHERE RecordTypeId = :recordTypeId];
    }
}