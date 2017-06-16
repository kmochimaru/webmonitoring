package security;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Hashing {
	
	public static String encodeMD5(String string){
    	
        MessageDigest md;
        
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(string.getBytes());
	        
	        byte byteData[] = md.digest();
	 
	        //convert the byte to hex format method 1
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < byteData.length; i++) {
	         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	        }
	        return sb.toString();
	        
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
    }
}
