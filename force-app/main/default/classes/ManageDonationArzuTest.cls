@istest
public with sharing class ManageDonationArzuTest {

    @testSetup
    static void setupTestData() {
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 3; i++) {
            testAccounts.add(new Account(
                FirstName = 'Test Contributor First Name ' + i,
                LastName = 'Test Contributor Last Name ' + i,
                Anonymous__c = false
            ));
        }
        insert testAccounts;
        List<Opportunity> testOpportunities = new List<Opportunity>();
        for (Account acc : testAccounts) {
            testOpportunities.add(new Opportunity(
                Name = 'Donation Opportunity',
                StageName = 'Closed Won',
                CloseDate = Date.today(),
                Amount = 1000 - testAccounts.indexOf(acc)
            ));
        }
        insert testOpportunities;
    }

    @isTest
    static void getTopContributors(){
        
        List<Account> topContributors = ManageDonationArzu.getTopContributors();
        System.assertEquals(3, topContributors.size(), 'Expected 3 top contributors.');
        for (Integer i = 0; i < topContributors.size() - 1; i++) {
            System.assert(
                topContributors[i].Total_Donation__c >= topContributors[i + 1].Total_Donation__c,
                'Accounts should be ordered by Total_Donation__c in descending order.'
            );
        }

    }
    
}


/*@isTest
public class MnageDonationTestSeyma {
    @testSetup
    static void setupTestData() {
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 3; i++) {
            testAccounts.add(new Account(
                FirstName = 'Test Contributor First Name ' + i,
                LastName = 'Test Contributor Last Name ' + i,
                Anonymous__c = false
            ));
        }
        insert testAccounts;
        List<Opportunity> testOpportunities = new List<Opportunity>();
        for (Account acc : testAccounts) {
            testOpportunities.add(new Opportunity(
                Name = 'Donation Opportunity',
                StageName = 'Closed Won',
                CloseDate = Date.today(),
                Amount = 1000 - testAccounts.indexOf(acc)
            ));
        }
        insert testOpportunities;
    }
    @isTest
    static void testFetchTopContributors() {
        List<Account> topContributors = ManageDonationSeyma.fetchTopContributors();
        System.assertEquals(3, topContributors.size(), 'Expected 3 top contributors.');
        for (Integer i = 0; i < topContributors.size() - 1; i++) {
            System.assert(
                topContributors[i].Total_Donation__c >= topContributors[i + 1].Total_Donation__c,
                'Accounts should be ordered by Total_Donation__c in descending order.'
            );
        }
    }
}*/