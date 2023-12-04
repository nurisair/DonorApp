public class CampaignUpdateBatch_Mojdeh implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
    	return Database.getQueryLocator([SELECT Id, EndDate, StartDate, Remaining_Donation_Amount__c, Status 
        FROM Campaign 
        WHERE EndDate = YESTERDAY AND Remaining_Donation_Amount__c > 0]);
    }

    public void execute (Database.BatchableContext bc,List<Campaign> scope){
        List<Campaign> listCampaign = new List<Campaign>();
        
        if (scope != null && scope.size() >0 ) {
            for (Campaign cmp : scope) {
                cmp.Status = 'Expired';
                listCampaign.add(cmp);
            }
        }

        if (listCampaign!=null && listCampaign.size() > 0) {
            try {
                update listCampaign;
            } catch (Exception ex) {
                System.debug(ex.getMessage());
            }
        }

    }
    
    public void finish(Database.BatchableContext bc) {
    }

}