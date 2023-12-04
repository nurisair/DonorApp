public class CampaignUpdateBatchElife implements Database.Batchable<sObject>, Database.stateful {

    //kac tane recordd ed date expired oldu
    
    //execute sayisini tutatlim
    public integer processedCount=0;

    //method1=start method=> enddate=yesterday, RemainingDonation Amout>0 campanyalari soql yap
    public Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator([select id, Status, Remaining_Donation_Amount__c FROM Campaign WHERE EndDate=:Date.today().addDays(-1) AND Remaining_Donation_Amount__c >0]);
    }
    //method2= execute method=> soql edilen campany leri statusunu "Expired" olarak update et
    public void execute(Database.BatchableContext context, List<Campaign> scope) {
        List<Campaign> campaignsToUpdate = new list<Campaign>();
        for(Campaign campaign: scope){
           
            campaign.Status='Expired';
            campaignsToUpdate.add(campaign);
            processedCount++;//update edilen sayiyi gosterir
        }
        if(!campaignsToUpdate.isEmpty()){
            update campaignsToUpdate;
        }
        
    }

    public void finish(Database.BatchableContext BC) {
        system.debug('Total records numbers: '+processedCount);
    }

    //classi apex'te calistir
    //CampaignUpdateBatchElife batch = new CampaignUpdateBatch();
    //Database.executeBatch(batch, 200);

}