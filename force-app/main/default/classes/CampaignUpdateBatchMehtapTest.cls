@isTest
public class CampaignUpdateBatchMehtapTest {
    
    @isTest
    public static void testCampaignUpdateBatch() {
        // Create test data
        Campaign testCampaign = new Campaign();
            testCampaign.Name = 'Test Campaign';
            testCampaign.EndDate = System.today().addDays(-1);
            testCampaign.Status = 'Active';
            testCampaign.Target_Donation_Amount__c = 2000;
            testCampaign.Achieved_Donation_Amount__c = 1500;
        insert testCampaign;

    // Start the batch
    Test.startTest();
    CampaignUpdateBatchMehtap batchJob = new CampaignUpdateBatchMehtap();
    Database.executeBatch(batchJob);
    Test.stopTest();

    // Retrieve the updated campaign
    Campaign updatedCampaign = [SELECT Id, Name, Status FROM Campaign WHERE Id = :testCampaign.Id];

    // Assert that the campaign status is now 'Expired'
    System.assertEquals('Expired', updatedCampaign.Status, 'Campaign status should be set to Expired.');
}
}