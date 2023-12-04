@istest

public with sharing class CampaignUpdateBatchBektasTest {
    @istest
    public static void testMethod1() {
            //START STEP 1: PREPARE DATA 
            list<Campaign> listAcc = new list<Campaign>();
            Campaign acc = new Campaign();
            acc.Name = 'TEST ACC 0';
            acc.EndDate= Date.newInstance(2023, 10, 10);
            acc.Status = 'Expired';
            acc.Target_Donation_Amount__c = 75;
            acc.Achieved_Donation_Amount__c= 70;            
            listAcc.add(acc);
            
    
          for (Integer i = 1; i < 10; i++){
                Campaign acc2 = new Campaign();
                acc2.Name = 'TEST ACC'+i;
                acc2.EndDate = Date.newInstance(2023, 10, 15);
                acc2.Status = 'Draft';
                acc2.Target_Donation_Amount__c = 71;
                acc2.Achieved_Donation_Amount__c= 70;
                
                listAcc.add(acc2);
               
            }
            system.debug('size of list ' + listAcc.size());
    
            if(!listAcc.isEmpty()){
                insert listAcc;
            }
            //END STEP 1
            //step 2
            test.startTest();
            CampaignUpdateBatchBektas ab = new CampaignUpdateBatchBektas ();
            database.executeBatch(ab, 200);
            test.stopTest();
    
            //ASSERT
            list<Campaign> Campaigns = [select id, status from Campaign];
            system.debug(Campaigns);
            for (Campaign a : Campaigns) {
                system.assertequals('Expired', a.status, 'Success"');
                system.debug(Campaigns);
             }
            
        }
    
    }