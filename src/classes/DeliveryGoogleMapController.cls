/* DeliveryGoogleMapController
 * Kashi @KashifAhmed
 * Description: This class is used to take GEO Coordinates to display Google Map 
*/
public with sharing class DeliveryGoogleMapController {

    public Delivery_Item__c ls {get; set;}
    public String googleAPIKey {get; set;}
    
    public DeliveryGoogleMapController(ApexPages.StandardController controller) {
        // Todo - Update the API key to yours
        googleAPIKey = '<enter your key here>';
        
        try {
            ls = (Delivery_Item__c)controller.getRecord();
            ls = [select id, name, R_D_Coordinates__Latitude__s, R_D_Coordinates__Longitude__s from Delivery_Item__c where id = :ls.id];
        } catch (Exception e) {
        
        }
    }

}
