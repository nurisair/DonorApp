global class CampaignUpdateSchedulerTB implements Schedulable {

    global void execute(SchedulableContext sc) {
        // Create an instance of the batch class and set the batch size
        CampaignUpdateBatchTB batchJob = new CampaignUpdateBatchTB();
        integer numberOfRecords = 200;// Set the batch size to 200
        
        // Start the batch job
        Database.executeBatch(batchJob);
    }

    // Schedule the job to run daily at 1 AM
    public static String scheduleCampaignUpdateJob() {
        String jobName = 'Campaign Update Job';
        String jobDetail = 'Scheduled job to update campaigns daily at 1 AM';
        String cronExp = '0 0 1 * * ?'; 

        CampaignUpdateScheduler scheduler = new CampaignUpdateScheduler();
        return System.schedule(jobName, cronExp, scheduler);
    }
}