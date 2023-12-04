global class CampaignUpdateBatch implements Database.Batchable<SObject> {

        global Database.QueryLocator start(Database.BatchableContext context) {
            Date yesterday = System.today().addDays(-1);
            String query = 'SELECT Id, Status FROM Campaign WHERE EndDate = :yesterday AND RemainingAmount__c > 0';
            return Database.getQueryLocator(query);
        }
    
        global void execute(Database.BatchableContext context, List<Campaign> scope) {
            List<Campaign> campaignsToUpdate = new List<Campaign>();
            for (Campaign campaign : scope) {
                campaign.Status = 'Expired';
                campaignsToUpdate.add(campaign);
            }
            if (!campaignsToUpdate.isEmpty()) {
                update campaignsToUpdate;
            }
        }
    
        global void finish(Database.BatchableContext context) {
            // Your finish logic here, if needed.
        }
    }