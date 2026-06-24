public class AccountService {
    
    public static Account getAccountById(Id accountId) {
        return [SELECT Id, Name, Phone, Industry FROM Account WHERE Id = :accountId LIMIT 1];
    }
    
    public static List<Account> getAccountsByIndustry(String industry) {
        return [SELECT Id, Name, Phone, Industry FROM Account WHERE Industry = :industry];
    }
    
    public static Account createAccount(String name, String industry, String phone) {
        Account acc = new Account(
            Name = name,
            Industry = industry,
            Phone = phone
        );
        insert acc;
        return acc;//test2
    }
    
    public static void updateAccountPhone(Id accountId, String newPhone) {
        Account acc = new Account(Id = accountId, Phone = newPhone);
        update acc;
    }
}
