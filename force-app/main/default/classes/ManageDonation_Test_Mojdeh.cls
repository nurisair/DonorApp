@isTest
public class ManageDonation_Test_Mojdeh {

    @isTest
     static void ManageDonation_Test_Mojdeh() {

        // Test data setup
        //List<Account> testAccounts = new List<Account>();
        //for (Integer i = 1; i <= 5; i++) {
            //Account acc = new Account(
                //Name = 'Test Account ' + i,
                //Total_Donation__c = i * 1000,
                //isPersonAccount = true
            //);
            //testAccounts.add(acc);
        //}
        //insert testAccounts;

        // Call the method to be tested
        List<Account> topContributors = ManageDonation_Mojdeh.Top3Contributors();

        // Perform assertions
        System.assertEquals(3, topContributors.size(), 'Should retrieve 3 top contributors');
        
        // Ensure the list is sorted in descending order by Total_Donation__c
        for (Integer i = 0; i < topContributors.size() - 1; i++) {
            System.assert(topContributors[i].Total_Donation__c >= topContributors[i + 1].Total_Donation__c,
                           'List should be sorted in descending order');
        }
    }
}