/* SSESignatureRegenerate
 * Kashi @KashifAhmed
 * Description: This class is related to capture eSign signature on delivery item object
*/

public class SSESignatureRegenerate {
    public String objAPIName {get; set;}
    public String PrintedFieldAPIName {get; set;}
    public String SignatureFieldAPIName {get; set;}
    public String objId {get; set;}
    
    
    public String getRawSignature() {
        String dbQuery = 'select ' + SignatureFieldAPIName+ ' from ' + objAPIName +' where id =: objId';
        SObject sObj = Database.query(dbQuery);
        return (String) sObj.get(SignatureFieldAPIName);
    }
}