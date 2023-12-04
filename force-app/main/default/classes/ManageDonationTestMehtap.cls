@isTest
private class ManageDonationTestMehtap {

    @isTest
    static void testFetchTopContributors() {
        // Create test data with Opportunities
        List<Opportunity> testOpportunities = new List<Opportunity>();

        for (Integer i = 0; i < 5; i++) {
            Opportunity opp = new Opportunity(
                Name = 'Test Opportunity ' + i,
                Amount = (i + 1) * 100.0,
                StageName = 'Payment Successful'


            );
            testOpportunities.add(opp);
        }

        insert testOpportunities;

        // Run the test as a System Administrator or a user with necessary permissions
        System.runAs(new User(Id = UserInfo.getUserId())) {
            Test.startTest();

            // Call the method to test
            List<Opportunity> topContributors = ManageDonationMehtap.fetchTopContributors();

            Test.stopTest();

            // Verify the results
            System.assertEquals(3, topContributors.size(), 'Top contributors list should have 3 records');

            // Check if the list is sorted in descending order
            for (Integer i = 0; i < topContributors.size() - 1; i++) {
                System.assert(topContributors[i].Amount >= topContributors[i + 1].Amount, 'List is not sorted in descending order');
            }
        }
    }
}