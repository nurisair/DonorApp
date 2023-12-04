public class CampaignUpdateBatchBektas implements Database.Batchable<SObject>, Database.stateful{
    Public integer count=0;
    public date yesterday = Date.today().addDays(-1);
  
    public Database.QueryLocator start(Database.BatchableContext bc) {
        database.QueryLocator q=database.getQueryLocator ([SELECT Id, EndDate, Remaining_Donation_Amount__c, Status
                                                        From Campaign WHERE EndDate = yesterday and Remaining_Donation_Amount__c > 0 ]);
        system.debug(q);
        return q;
    }
    public void execute(Database.BatchableContext bc, List<Campaign> scope){
        system.debug('inside execute method' + scope);
        List<Campaign> UpdateCampaign = new List<Campaign>();
        for (Campaign eachCampaign : scope){
                eachCampaign.Status ='Expired';
                UpdateCampaign.Add(eachCampaign);
                count++;
            }
        if(!UpdateCampaign.isEmpty()){
            system.debug('Count in execute method: '+ count);
            Update UpdateCampaign;
        }
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Finish method called.Batch is done');

    }
   
}