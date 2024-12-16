public with sharing class AccountController {
    @AuraEnabled(cacheable = true)
    public static list<Account> getListOfAccount(){
        return [select Id,Name,Industry,Type from account order by createddate desc limit 2];
    }
    
    @AuraEnabled(cacheable = true)
    public static list<Account> filterAccoutType(string strType){
        return [select Id,Name,Industry,Type from account where Type = : strType order by createddate desc limit 2];
    }
    
    @AuraEnabled(cacheable = true)
    public static list<Account> findAccounts(string searchKey){
        string key = '%'+searchKey+'%';
        list<Account> lst = [select Id,Name,Type,Industry from Account where Name LIKE :key order by createddate desc limit 5];
        system.debug('lst=='+lst);
        return lst;
    }
}