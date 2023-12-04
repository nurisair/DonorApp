@isTest
private class CampaignUpdateBatchTestNuri {

    @isTest static void testCampaignUpdateBatchNuri() {
        // Create test data
        Campaign testCampaign = new Campaign(
            Name = 'Test Campaign',
            EndDate = Date.today().addDays(-1), // Setting the EndDate to yesterday
            Target_Donation_Amount__c = 1000,
            achieved_Donation_Amount__c = 900
        );
        insert testCampaign;

        // Ensure the initial state is as expected
        testCampaign = [SELECT Id, Status FROM Campaign WHERE Id = :testCampaign.Id];
        System.assertNotEquals('Expired', testCampaign.Status);

        // Run the batch
        Test.startTest();
        CampaignUpdateBatchNuri batchInstance = new CampaignUpdateBatchNuri();
        Database.executeBatch(batchInstance);
        Test.stopTest();

        // Validate the result
        testCampaign = [SELECT Id, Status FROM Campaign WHERE Id = :testCampaign.Id];
        System.assertEquals('Expired', testCampaign.Status);
    }
}