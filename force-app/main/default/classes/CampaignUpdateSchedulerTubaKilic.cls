public with sharing class CampaignUpdateSchedulerTubaKilic implements Schedulable {
    public  void execute(SchedulableContext sc) {
        Database.executeBatch(new CampaignUpdateBatchTubaKilic());

    }
}