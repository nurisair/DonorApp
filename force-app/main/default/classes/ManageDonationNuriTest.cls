@isTest
private class ManageDonationNuriTest {

    @testSetup
    static void setupTestData() {
        // Create test data
        List<Account> testAccounts = new List<Account>();
        List<Opportunity> donations = new List<Opportunity>();

        // Assuming Person Accounts are enabled in your org
        for (Integer i = 0; i < 5; i++) {
            Account acc = new Account(
                FirstName = 'Account' + i,
                LastName='Test',
                RecordTypeId = [SELECT Id FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = TRUE LIMIT 1].Id
            );
            testAccounts.add(acc);
        }
        insert testAccounts;

        for (Integer i = 0; i < 5; i++) {
            Opportunity opp = new Opportunity(
                AccountId = testAccounts[i].Id,
                Name = 'Test Donation' +i,
                CloseDate=date.today()+i,
                StageName='Pledged',
                Amount=100+i          
            );
            donations.add(opp);
        }
        insert donations;
    }

    static testMethod void testFetchTopContributors() {
        // Perform the test
        Test.startTest();
        List<Account> topContributors = ManageDonationNuri.fetchTopContributors();
        Test.stopTest();

        // Assertions
        System.assertEquals(3, topContributors.size(), 'Expected 3 top contributors.');
        
    }
}