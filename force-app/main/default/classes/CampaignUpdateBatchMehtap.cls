public with sharing class CampaignUpdateBatchMehtap implements Database.Batchable<SObject>, Database.Stateful{

    public Database.QueryLocator start(Database.BatchableContext bc) {
        Date yesterday = System.today().addDays(-1);
        return Database.getQueryLocator([
            SELECT Id, Name, EndDate, Remaining_Donation_Amount__c
            FROM Campaign
            WHERE EndDate = :yesterday
            AND Remaining_Donation_Amount__c > 0
        ]);
    }

    public void execute(Database.BatchableContext bc, List<Campaign> scope) {
        List<Campaign> campaignsToUpdate = new List<Campaign>();
        for (Campaign campaign : scope) {
            campaign.Status = 'Expired';
            campaignsToUpdate.add(campaign);
        }
        update campaignsToUpdate;
    }

    public void finish(Database.BatchableContext bc) {
        
    }
}