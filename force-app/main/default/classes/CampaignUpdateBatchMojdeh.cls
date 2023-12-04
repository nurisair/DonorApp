public class CampaignUpdateBatchMojdeh implements Database.Batchable<sObject> {

    public Database.QueryLocator start(Database.BatchableContext context) {
        Date yesterday = Date.today().addDays(-1);
        return Database.getQueryLocator([
            SELECT Id, Status,Remaining_Donation_Amount__c 
            FROM Campaign
            WHERE EndDate = :yesterday
            AND Remaining_Donation_Amount__c > 0
        ]);
    }

    public  void execute(Database.BatchableContext context, List<Campaign> scope) {
        List<Campaign> campaignsToUpdate = new List<Campaign>();

        for (Campaign campaign : scope) {
            campaign.Status = 'Expired';
            campaignsToUpdate.add(campaign);
        }

        if (!campaignsToUpdate.isEmpty()) {
            update campaignsToUpdate;
        }
    }

    public void finish(Database.BatchableContext context) {

    }
}