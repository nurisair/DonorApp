@isTest
public class CampaignUpdateBatch_Test_Mojdeh {
        @isTest
        public static void testAsynSchdle(){

        List<Campaign> listCamp = new List<Campaign>();

        for (Integer i = 0; i < 200; i++) {
                Campaign cmp = new Campaign();
		   cmp.Name = 'Test Donation Campaign';
		   cmp.EndDate = Date.today().addDays(-1);
		   cmp.Target_Donation_Amount__c = 100;
		   cmp.Achieved_Donation_Amount__c = 90;
		   listCamp.add(cmp);
        }

        if (listCamp != null && listCamp.size()>0) {
                insert listCamp;
        }
            
        Test.startTest();
        CampaignUpdateBatch_Mojdeh schdlBtch = new CampaignUpdateBatch_Mojdeh();
        Database.executeBatch(schdlBtch);
        Test.stopTest();

        List<Campaign> lstC = [SELECT Id, Status FROM Campaign];

        System.assertEquals('Expired', lstC[0].Status);
        System.assertEquals(200, lstC.size());

        }
}