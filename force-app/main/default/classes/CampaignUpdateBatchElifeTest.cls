@isTest
public class CampaignUpdateBatchElifeTest {
 @isTest  
   static void testExpiredCampaigns(){
	list<Campaign> campaigns = new list<Campaign>();
       
    //Data olusturulur(endDate=>yesterday, remainingDonationAmount>0)
    Campaign testCampaignUpdate = new Campaign(
      Name='Test Campaign1',
      EndDate= Date.today().addDays(-1),
        Target_Donation_Amount__c=200,
            Achieved_Donation_Amount__c=3,
       //Remaining_Donation_Amount__c = 50,
      Status='Active'
   );
    campaigns.add(testCampaignUpdate);
       
       //endDate'i yesterday olmayan data olustur
      Campaign testCampaignNotUpdate = new Campaign(
      Name='Test Campaign2',
      EndDate= Date.today(),
      //Remaining_Donation_Amount__c = 50, // Setting a non-zero value
      Status='Active'
   );
        campaigns.add(testCampaignNotUpdate);
       //insert edilir datalar
       insert campaigns;
       
	//start the batch job
	Test.startTest();
  	CampaignUpdateBatchElife batchUpdate = new  CampaignUpdateBatchElife();
   Database.executeBatch(batchUpdate, 1);
   Test.stopTest();

   //update edilen kampanya bilgilerini getirme
   List<Campaign> updatedCampaign = [SELECT Status FROM Campaign Where Status = 'Expired' ];

  
    // Campany status expired olarak update edildiginden emin olmaliyiz
    System.assertEquals(1, updatedCampaign.size(), 'Only 1 campaign should have been updated to Expired');

}
}