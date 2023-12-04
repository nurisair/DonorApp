public with sharing class CampaignUpdateSchedulerMehtap implements Schedulable{
    public void execute(SchedulableContext sc) {
        CampaignUpdateBatchMehtap batchJob = new CampaignUpdateBatchMehtap();
        Database.executeBatch(batchJob, 200);
    }
}