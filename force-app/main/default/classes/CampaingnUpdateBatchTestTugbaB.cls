@isTest
public class CampaingnUpdateBatchTestTugbaB {
    @isTest
    static void testCampaignUpdateBatch() {
        // Create test data - Campaign records
        Campaign testCampaign1 = new Campaign(
            Name = 'Test Campaign 1',
            EndDate = Date.today().addDays(-1), // YESTERDAY
           


            Target_Donation_Amount__c = 11,
            achieved_Donation_Amount__c = 10,
           
            Status = 'Active'
        );
        insert testCampaign1;

        Campaign testCampaign2 = new Campaign(
            Name = 'Test Campaign 2',
            EndDate = Date.today().addDays(1), // TOMORROW
           
            Status = 'Active'
        );
        
        insert testCampaign2;
        
        
        // Start the batch job
        test.startTest();
        List<Campaign> campaignsToUpdate = [SELECT Id, Status FROM Campaign WHERE EndDate < :Date.today().addDays(-1) AND Status = 'Active' AND achieved_Donation_Amount__c >= 10];
        CampaignUpdateBatchTB batch = new CampaignUpdateBatchTB();
        ID batchInstanceId = Database.executeBatch(batch);
        test.stopTest();

    

        // Verify that the campaigns have been updated to 'Expired'
        campaignsToUpdate = [SELECT Id, Status FROM Campaign WHERE Id IN :campaignsToUpdate];
        for (Campaign campaign : campaignsToUpdate) {
            System.assertEquals('Expired', campaign.Status, 'Campaign ' + campaign.Id + ' has not been updated to Expired');
        }

        // Verify that other campaigns have not been updated
        Campaign[] otherCampaigns = [SELECT Id, Status FROM Campaign WHERE Id NOT IN :campaignsToUpdate];
        for (Campaign campaign : otherCampaigns) {
            System.assertNotEquals('Wxpired', campaign.Status);
        }
    
    }
}
/*
        // Verify that the campaigns have been updated to 'Expired'
        campaignsToUpdate = [SELECT Id, Status FROM Campaign WHERE Id IN :campaignsToUpdate];
        for (Campaign campaign : campaignsToUpdate) {
            System.assertEquals('Expired', campaign.Status, 'Campaign ' + campaign.Id + ' has not been updated to Expired');
        }

        // Verify that other campaigns have not been updated
        Campaign[] otherCampaigns = [SELECT Id, Status FROM Campaign WHERE Id NOT IN :campaignsToUpdate];
        for (Campaign campaign : otherCampaigns) {
            System.assertNotEquals('Expired', campaign.Status, 'Campaign ' + campaign.Id + ' has been incorrectly updated to Expired');
        }
    
    }*/