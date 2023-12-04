public class CampaignUpdateBatchNuri implements Database.Batchable<sObject> {

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id FROM Campaign WHERE EndDate = YESTERDAY AND Remaining_Donation_Amount__c > 0');
    }

    public void execute(Database.BatchableContext bc, List<Campaign> scope) {
        List<Campaign> CampsUpdate = new List<Campaign>();
    
        for (Campaign campaign : scope) {
            campaign.Status = 'Expired';
            CampsUpdate.add(campaign);
        }
        
        if (!CampsUpdate.isEmpty()) {
            update CampsUpdate;
        }
    }

    public void finish(Database.BatchableContext bc) {
    }
}