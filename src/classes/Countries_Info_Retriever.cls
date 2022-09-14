public with sharing class Countries_Info_Retriever implements Schedulable{

    private static final String QUERY_VARIABLE_URL = '/v2/all?fields=name,alpha2Code,alpha3Code,capital,region,subregion,regionalBlocs';
    private static final String Get = 'GET';

    @future(callout=true)
    public static void getCountriesData() {
        List<Country__c> countryList = new List<Country__c>();
        Http httpCallout = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:RESTCountries'+ QUERY_VARIABLE_URL);
        req.setMethod(Get);

        HttpResponse countriesResponse = httpCallout.send(req);
        List<Countries_info_parser> restcountriesResponse = Countries_info_parser.parse(countriesResponse.getBody());

        if(countriesResponse.getStatusCode() == 200){
            for (Countries_info_parser block : restcountriesResponse) {
                try{
                    Country__c c =  new Country__c(Name = block.name,
                            Capital__c = block.capital,
                            Region_Block__c = block.regionalBlocs.get(0).acronym,
                            Region__c = block.region,
                            Subregion__c = block.subregion,
                            Country_ISO_code_2__c = block.alpha2Code,
                            Country_ISO_code_3__c = block.alpha3Code,
                            ExtID__c=block.name);
                    countryList.add(c);
                }
                catch (System.NullPointerException e){
                    Country__c c =  new Country__c(Name=block.name,
                            Capital__c=block.capital,
                            Region__c = block.region,
                            Subregion__c = block.subregion,
                            Country_ISO_code_2__c = block.alpha2Code,
                            Country_ISO_code_3__c = block.alpha3Code,
                            ExtID__c=block.name);
                    countryList.add(c);
                }
            }
            upsert countryList ExtID__c ;
        }
    }

    public void execute(SchedulableContext SC) {
        getCountriesData();
    }
}