public with sharing class LeadTriggerHandler {

    public static Void updateLead(List<Lead> lead) {
        List<Lead> updatedLeadList = new List<Lead>();
        for (Lead newLead : [SELECT Id, Name, Country FROM Lead WHERE Id IN :lead]) {
            for (Country__c countries : [SELECT Id, Name, Country_ISO_code_2__c, Country_ISO_code_3__c, Capital__c, region__c, Region_Block__c, subregion__c FROM Country__c WHERE Name = :newLead.Country]) {
                if (newLead.Country == countries.Name) {
                    newLead.Country = countries.Name;
                    newLead.Country_ISO_code_2__c = countries.Country_ISO_code_2__c;
                    newLead.Country_ISO_code_3__c = countries.Country_ISO_code_3__c;
                    newLead.capital__c = countries.Capital__c;
                    newLead.Region__c = countries.region__c;
                    newLead.subregion__c = countries.subregion__c;
                    newLead.Region_Block__c = countries.Region_Block__c;
                    updatedLeadList.add(newLead);
                }
            }
        }
        update updatedLeadList;
    }
}