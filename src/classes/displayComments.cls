/* displayComments
 * Kashi @KashifAhmed
 * Description: 
*/

public class displayComments {
        String recId;
   public  displayComments() {
        recId = ApexPages.currentPage().getParameters().get('id'); 
    }
    
    public String getFileId() {
        String fileId = '';
              String filter = '%-'+ recId+'%'; 
        List<Attachment> attachedFiles = [select Id from Attachment where parentId =:recId and  Name LIKE :filter order By LastModifiedDate DESC limit 1];
        if( attachedFiles != null && attachedFiles.size() > 0 ) {
            fileId = attachedFiles[0].Id;
        }
        return fileId;    
    }
}