/**
 * Created by Home on 14.09.2022.
 */

public with sharing class Countries_info_parser {

    public String name;
    public String alpha2Code;
    public String alpha3Code;
    public String capital;
    public String subregion;
    public String region;
    public List<RegionalBlocs> regionalBlocs;

    public class RegionalBlocs {
        public String acronym;
    }

    public static List<Countries_info_parser> parse(String json) {
        return (List<Countries_info_parser>) System.JSON.deserialize(json, List<Countries_info_parser>.class);
    }

}