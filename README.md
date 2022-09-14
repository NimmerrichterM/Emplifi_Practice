# Emplifi_Practice

SALESFORCE DEVELOPER TEST
With API from https://restcountries.eu/ upload information to Salesforce about countries specifically we are interested in Name, Country ISO code 2 and 3, Capital city, region, subregion, regionalBlocs (acronyms are sufficient). Once a day to check if any of the information on the API has been changed and if so, update it in Salesforce.  Then create a trigger that will show the information on the leads based on their countries. Create tests for the feature to be ready for deployment.

Additionally create validation rule for leads that do not allow to change owner unless Country, Lead Source and No. of Employees are filled in. This applies for all profiles except of System Administrator and Contract Manager profiles do not need to fill in the No. of Employees and System Administrator profile also does not need to fill in Country.

Also, create a process in process builder that will track assignments of Lead Owner. Meaning when Lead Owner is assigned then save timestamp to the field Owner Since.