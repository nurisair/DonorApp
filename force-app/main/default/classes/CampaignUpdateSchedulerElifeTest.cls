@isTest
public class CampaignUpdateSchedulerElifeTest {
   /* @isTest
    private static void testSchedulable(){
        test.startTest();
         CampaignUpdateBatchElife schdlBatch = new CampaignUpdateBatchElife();
        string date1='0 0 1 * * ?';
        system.schedule('Test check', date1, schdlBatch);
        test.stopTest();
    }*/
    
  @isTest
    private static void testSchedulable() {
        test.startTest();
        
        CampaignUpdateSchedulerElife scheduler = new CampaignUpdateSchedulerElife();
        
        String cronExpression = '0 0 1 * * ?'; // Her gün saat 1:00 AM'de çalışacak şekilde
        System.schedule('Test check', cronExpression, scheduler);
        
        test.stopTest();
    }
}