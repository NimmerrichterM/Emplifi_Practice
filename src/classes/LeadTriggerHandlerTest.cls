
@IsTest
private class LeadTriggerHandlerTest {
    @IsTest
    static void insertAndUpdateLeadTest(){
        Country__c country = new Country__c();
        country.Name = 'Afghanistan';
        country.Country_ISO_code_2__c = 'AF';
        country.Country_ISO_code_3__c = 'AFG';
        country.Capital__c = 'Kabul';
        country.region__c = 'Asia';
        country.subregion__c = 'Southern Asia';
        country.Region_Block__c = 'SAARC';

        insert country;

        Lead lead = new Lead();
        lead.LastName = 'Test Lead';
        lead.Company = 'ABC Company';
        lead.Country = 'Afghanistan';

        insert lead;

        Lead queryLead = [SELECT Id,Country,Country_ISO_code_2__c,Country_ISO_code_3__c,capital__c,region__c,Region_Block__c,subregion__c
        FROM Lead
        WHERE Id =: lead.Id];

        Country__c queryCountry = [SELECT Id,Name,Country_ISO_code_2__c,Country_ISO_code_3__c,capital__c,region__c,Region_Block__c,subregion__c
        FROM Country__c
        WHERE Name =: lead.Country];

        System.assertEquals(queryLead.Country, queryCountry.Name);
        System.assertEquals(queryLead.Country_ISO_code_2__c, queryCountry.Country_ISO_code_2__c);
        System.assertEquals(queryLead.Country_ISO_code_3__c, queryCountry.Country_ISO_code_3__c);
        System.assertEquals(queryLead.capital__c, queryCountry.Capital__c);
        System.assertEquals(queryLead.region__c, queryCountry.region__c);
        System.assertEquals(queryLead.subregion__c, queryCountry.subregion__c);
        System.assertEquals(queryLead.Region_Block__c, queryCountry.Region_Block__c);
    }
}