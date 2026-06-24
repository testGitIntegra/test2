@isTest
public class AccountServiceTest {
    
    @TestSetup
    static void setup() {
        Account acc = new Account(
            Name = 'Test Account',
            Industry = 'Technology',
            Phone = '1234567890'
        );
        insert acc;
    }
    
    @isTest
    static void testGetAccountById() {
        Account acc = [SELECT Id FROM Account WHERE Name = 'Test Account' LIMIT 1];
        
        Test.startTest();
        Account result = AccountService.getAccountById(acc.Id);
        Test.stopTest();
        
        System.assertNotEquals(null, result, 'Account should not be null');
        System.assertEquals('Test Account', result.Name, 'Name should match');
        System.assertEquals('Technology', result.Industry, 'Industry should match');
    }
    
    @isTest
    static void testGetAccountsByIndustry() {
        Test.startTest();
        List<Account> results = AccountService.getAccountsByIndustry('Technology');
        Test.stopTest();
        
        System.assertNotEquals(0, results.size(), 'Should return at least one account');
        System.assertEquals('Technology', results[0].Industry, 'Industry should match');
    }
    
    @isTest
    static void testCreateAccount() {
        Test.startTest();
        Account result = AccountService.createAccount('New Account', 'Finance', '9876543210');
        Test.stopTest();
        
        System.assertNotEquals(null, result.Id, 'Account Id should not be null');
        System.assertEquals('New Account', result.Name, 'Name should match');
        System.assertEquals('Finance', result.Industry, 'Industry should match');
    }
    
    @isTest
    static void testUpdateAccountPhone() {
        Account acc = [SELECT Id FROM Account WHERE Name = 'Test Account' LIMIT 1];
        
        Test.startTest();
        AccountService.updateAccountPhone(acc.Id, '5555555555');
        Test.stopTest();
        
        Account updated = [SELECT Phone FROM Account WHERE Id = :acc.Id];
        System.assertEquals('5555555555', updated.Phone, 'Phone should be updated');
    }
}