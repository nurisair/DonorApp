public class CampaignUpdateBatchArzu implements Database.Batchable<SObject> {

    private String query;
    public Integer count = 0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id FROM Campaign WHERE EndDate = YESTERDAY AND Remaining_Donation_Amount__c > 0');
    }

    public void execute(Database.BatchableContext bc, List<Campaign> scope) {
        List<Campaign> campaignsToUpdate = new List<Campaign>();
        
        // Update the status of campaigns to Expired
        for (Campaign campaign : scope) {
            campaign.Status = 'Expired';
            campaignsToUpdate.add(campaign);
        }
        
        // Update the campaigns in bulk
        if (!campaignsToUpdate.isEmpty()) {
            update campaignsToUpdate;
        }
    }

    public void finish(Database.BatchableContext bc) {
        System.debug('DONE');
      System.debug('Total number of records processed: ' + count);
      System.debug(Campaign.status);
        }
    
       
    }