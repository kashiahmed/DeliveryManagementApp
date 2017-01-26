/* deliveryExtension
 * Kashi @KashifAhmed
 * Description: This class is the main Delivery Confirmation Page Controller Class
*/

public class deliveryExtension {
    
    
    public string  routeId{get;set;}
    public string  deliveryId{get;set;}
    public string  deliveryItemId{get;set;}
    public string  SelectdeliveryItemId{get;set;}
    public string CurrentUser{get;set;}  
    public string SelectedStatus{get;set;} 
    
    
    public String objAPIName {get; set;}
    public String PrintedFieldAPIName {get; set;}
    public String SignatureFieldAPIName {get; set;}
    
    
    public deliveryExtension(ApexPages.standardController cont) {
        
        currentUser =UserInfo.getUserId();
    }
    
    public PageReference redirect() {
        return new PageReference('/' + SelectdeliveryItemId);   
    }
    
    @remoteAction
    public static void saveAttach(string file, String parentId) {
        
        //signature Already Exist
        list<Attachment> atchLst = new list<Attachment>();
        String filter = '%-'+parentId+'%'; 
        atchLst= [select id,Name,Body from Attachment where Name LIKE :filter limit 1];
        //Check record Already Exist
        if(atchLst.size() > 0){
            
            // Update Signature
            atchLst[0].Body = EncodingUtil.base64Decode(file);  
            
            // Make the update call.
            update atchLst;
            
        }else{
            
            
            Attachment a = new Attachment (ParentId = parentId, Body =EncodingUtil.base64Decode(file) , Name = 'comments-'+parentId+'.png');
            insert a;
        }
    }
    
    @remoteAction
    public static void saveSignature(String objAPIName, String objId, String printedAPIName, String printedValue, String signatureAPIName, String signatureValue, decimal longi, decimal lat) {
        Delivery_Item__c ditm = new Delivery_Item__c();
       
        if(objId !=null & objId!='')
            ditm= [select id, name,Signature_Printed__c,Signature__c,Signature_Date__c, R_D_Coordinates__Latitude__s,R_D_Coordinates__Longitude__s,  Customer_Comments__c from Delivery_Item__c where  id =:objId  limit 1];
        
        ditm.Signature_Printed__c = printedValue;
        ditm.Signature__c = signatureValue;
        ditm.Signature_Date__c= datetime.now();
        ditm.R_D_Coordinates__Longitude__s = longi;
        ditm.R_D_Coordinates__Latitude__s=lat;
        
        update ditm;
    }
    
    
    
    public List<SelectOption> getRoutes() {
        List<SelectOption> routes = new List<SelectOption>();
        list<Route__c> routLst = new list<Route__c>();
        
        routLst = [select id, name from Route__c where  Driver__c =:currentUser and Route_Date__c = TODAY limit 15];
        
        routes.add(new SelectOption('', '--None--'));        
        for (Route__c R: routLst) {
            routes.add(new SelectOption(R.Id, R.Name));
        }
        
        return routes;
    }
    
    public Delivery_Item__c  getSelectedItem(){
        Delivery_Item__c dtc = new Delivery_Item__c(); 
        if(SelectdeliveryItemId !=null & SelectdeliveryItemId !='')
            dtc= [select id, name,Delivery_Item_Status__c,  Delivery_Item_Name__c,Customer_Address__c,Quantity__c,  Customer_Comments__c from Delivery_Item__c where  id =:SelectdeliveryItemId  limit 1];
        
        return dtc;
    }
    
    
    
    
    public List<SelectOption> getDeliveries() {
        List<SelectOption> deliveries = new List<SelectOption>();
        list<Delivery__c> Lst = new list<Delivery__c>();
        
        if(routeId !='' && routeId !=null){
            Lst = [select id, name from Delivery__c where   Route__c =:routeId and Delivery_Status__c !='Delivered' limit 15];
            
            deliveries.add(new SelectOption('', '--None--'));
            for (Delivery__c D: Lst) {
                
                deliveries.add(new SelectOption(D.Id, d.Name));
            }
            
        }   
        
        return deliveries;
    }
    
    public List<SelectOption> getDeliveryItems() {
        List<SelectOption> deliveryItems = new List<SelectOption>();
        list<Delivery_Item__c> Lst = new list<Delivery_Item__c>();
        
        if(deliveryId !='' && deliveryId !=null){
            Lst = [select id, name from Delivery_Item__c where  Delivery__c =:deliveryId and    Delivery_Item_Status__c !='Delivered' limit 15];
            
            deliveryItems.add(new SelectOption('', '--None--'));
            for (Delivery_Item__c D: Lst) {
                
                deliveryItems.add(new SelectOption(D.Id, d.Name));
            }
            
        }   
        
        return deliveryItems;
    }
}