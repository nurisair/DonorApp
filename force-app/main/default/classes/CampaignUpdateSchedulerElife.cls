public class CampaignUpdateSchedulerElife implements Schedulable {
    public void execute(SchedulableContext sc) {
         // Create an instance of the batch job
        CampaignUpdateBatchElife batchJob = new CampaignUpdateBatchElife();
            // Start the batch job
        Database.executeBatch(batchJob);
        
    }
}