@isTest
public with sharing class TestManageDonationElife {
    @isTest
    static void testFetchTopContributors(){
        //make datas
        list<Account> testAccounts= new list<Account>();
        for(integer i=0; i<5; i++){
            Account acc = new Account(FirstName = 'Test', 
                                     LastName = 'Donor ' + i);
            testAccounts.add(acc);
        }
        insert testAccounts;

        //New instance olustur 
        ManageDonationElife manageDonation = new ManageDonationElife();

        Test.startTest();
        manageDonation.fetchTopContributors();
        Test.stopTest();

        system.assertEquals(6, [Select COUNT() FROM Account]);//5 ONCEDEN INSERT EDILEN, 1 TANEDE YENI EKLENEN
    }
    
}