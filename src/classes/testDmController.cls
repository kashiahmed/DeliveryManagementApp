/* testDmController
 * Kashi @KashifAhmed
 * Description: This class is test class for packaging
*/

@isTest
public class testDmController {
    
    
    static testMethod void deliveryExtension() {
        Route__c rt = new Route__c();
        //insert the route     
        rt.Driver__c =UserInfo.getUserId() ;
        rt.Route_Date__c=System.Today(); 
        insert rt;
        //insert the delivery
        Delivery__c dobj= new Delivery__c();
        
        dobj.Route__c=rt.id;
        insert dobj;
        
        
        Delivery_Item__c  di = new Delivery_Item__c();
        di.Delivery_Item_Name__c    ='test';
        di.Delivery__c=dobj.id;
        insert di;
        
        
        ApexPages.StandardController sc = new ApexPages.StandardController(di);
        deliveryExtension  de =  new deliveryExtension (sc); 
        
        de.SelectedStatus='Open';
        de.deliveryItemId=di.id;
        de.SelectdeliveryItemId=di.id;
        de.routeId=rt.id;
        de.deliveryId=dobj.id;
        de.objAPIName='Delivery_Item__c';
        de.PrintedFieldAPIName='Signature_Printed__c';
        de.SignatureFieldAPIName='Signature__c';
        deliveryExtension.saveAttach('Test Data', di.id); 
        deliveryExtension.saveAttach('Test Data', di.id); 
        deliveryExtension.saveSignature('Delivery_Item__c', di.id,  'printedAPIName',  'printedValue', 'signatureAPIName', 'signatureValue', 37.4224764,22.084);
        de.getRoutes();
        de.getSelectedItem();
        de.getDeliveries();
        de.getDeliveryItems();       
        
        de.redirect();
        
        SSESignatureRegenerate srObj = new  SSESignatureRegenerate();
        
        srObj.objAPIName='Delivery_Item__c';
        srObj.PrintedFieldAPIName='Signature_Printed__c';
        srObj.SignatureFieldAPIName='Signature__c';
        srObj.objId =di.id;
        srObj.getRawSignature();
        
        
        apexpages.currentpage().getparameters().put('id' , di.id);
        displayComments displayCommentsobj = new displayComments();
        
        displayCommentsobj.getFileId();
        
        
       
      
        DeliveryGoogleMapController dgobj= new DeliveryGoogleMapController(sc);
        
         System.assertEquals(dobj.id, di.Delivery__c);
        
      
    }
    
  
    
}