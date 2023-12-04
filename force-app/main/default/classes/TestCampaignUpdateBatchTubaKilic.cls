@istest
public with sharing  class TestCampaignUpdateBatchTubaKilic {

    @istest
   public static void tester() {

       list<Campaign> campaigns = new list<Campaign> ();  
      for(integer i = 0; i<900 ; i++){
        Campaign camp3 = new Campaign();
        camp3.Name= 'Test Campaign' + i;
        camp3.Target_Donation_Amount__c = 1000;
        camp3.Achieved_Donation_Amount__c = 500;
        camp3.EndDate = system.today().addDays(-1);
        camp3.status = 'Active' ;
        campaigns.add(camp3);
       }  insert campaigns;
       
       test.startTest();
       Database.executeBatch(new CampaignUpdateBatchTubaKilic(),902);
       test.stopTest();
       
           list<Campaign> campaignss = [select id, Status from Campaign WHERE Status= 'Expired'];
           for(campaign c : campaignss){
            system.assertequals('Expired', c.status, 'Status shoul be "Expired"');
  
        }


    }

}