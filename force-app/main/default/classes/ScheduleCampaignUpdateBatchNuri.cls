public class ScheduleCampaignUpdateBatchNuri implements Schedulable {
    
    public void execute(SchedulableContext sc) {
        CampaignUpdateBatchNuri batchInstance = new CampaignUpdateBatchNuri();
        Database.executeBatch(batchInstance, 200);
    }
}