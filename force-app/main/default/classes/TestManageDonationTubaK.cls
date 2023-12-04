@isTest
public inherited sharing class TestManageDonationTubaK {

@isTest
    public static void testDonations() {
         // Create a profile with the necessary permissions
        //  Profile profileWithPermissions = [SELECT Id FROM Profile WHERE Name = 'Your_Profile_Name'];
    
         // Create a user with CRUD permissions on Account object and field-level read access
         User testUser = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User'].Id,
             Alias = 'testmy',
             Email = 'testusermy22@example.com',
             EmailEncodingKey = 'UTF-8',
             LastName = 'Testmymy',
             LanguageLocaleKey = 'en_US',
             LocaleSidKey = 'en_US',
            
             TimeZoneSidKey = 'America/Los_Angeles',
             UserName = 'testuser@exam.com'
         );
 
         // Insert the user
         insert testUser;
         
        
        System.runAs(testUser) {
             // Create test data - three Person Accounts with varying donation amounts

             Account acc1 = new Account();
             acc1.Name= 'Person1';
             Account acc2 = new Account();
             acc2.Name= 'Person2';
             Account acc3 = new Account();
             acc3.Name= 'Person3';
              List<Account> testAccounts = new List<Account>{acc1,acc2,acc3};
              insert testAccounts;
              List<Opportunity> listOpp = new List<Opportunity> ();
              decimal a = 0;
                for(integer i = 1 ; i <=300 ; i++){
                Opportunity op = new Opportunity();
                op.Name = 'Test opp' + i;
                a += 1000;
                op.Amount =5000 + a ;
                op.StageName = 'Payment Successful';
                op.CloseDate = date.today();

                if(i<101){
                    op.AccountId = testAccounts[0].id;

                }else if(i < 201){
                    op.AccountId = testAccounts[1].id;

                }else {
                    op.AccountId = testAccounts[2].id;

                }listOpp.add(op);
            }
                insert listOpp;

                test.startTest();
                 List<Account> testAccounts2= ManageDonationTubaK.fetchTopContributors();
                  //System.assertEquals(3, testAccounts2.size(), 'Expected 3 top contributors');
                 test.stopTest();
        }
    }
}