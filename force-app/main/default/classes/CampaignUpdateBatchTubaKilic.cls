public with sharing class CampaignUpdateBatchTubaKilic implements Database.Batchable<SObject>, Database.Stateful {
    
    public Integer count=0;

    public Database.QueryLocator start (Database.BatchableContext bc){
        //COLLECT THE BATCHES OF RECORDS OR OBJECTS TO BE PASSED TO EXECUTE
        Database.QueryLocator ql = database.getQueryLocator([select id from Campaign
                                                             where 	EndDate = : Date.today().addDays(-1)
                                                             and Remaining_Donation_Amount__c > 0]);
        return ql;
    }
    public void execute (Database.BatchableContext bc , List<Campaign> records) {
        //PROCESS each batch of records
     
            List<Campaign> updateCampaigns = new list<Campaign>();
     for(Campaign cmpg : records){
        cmpg.status = 'Expired';
        updateCampaigns.add(cmpg);
        count++;
        
    }
      if(!updateCampaigns.isEmpty())
        {update updateCampaigns;}

   
        
    }
    public void finish(Database.BatchableContext bc){
        system.debug('done with updating campaigns');
        system.debug('Total Number of records Updated:   '+count);
    }
}