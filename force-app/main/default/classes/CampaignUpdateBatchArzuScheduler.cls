public class CampaignUpdateBatchArzuScheduler implements Schedulable {
    public void execute(SchedulableContext sc) {
        
        
        // Create an instance of your batch class with the required parameters
        CampaignUpdateBatchArzu batch = new CampaignUpdateBatchArzu();
        
        // Schedule the batch to run immediately
        Database.executeBatch(batch);
    }
}