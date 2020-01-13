
import java.io.*;
class Processer 
{
	public static void main(String[] args) 
	{
		try {
		    String line;
			String temp[]=null;
			Process p = Runtime.getRuntime().exec
		    (System.getenv("windir") +"\\system32\\"+"tasklist.exe");  
			
			BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));

			while ((line = input.readLine()) != null) {
					//System.out.println(line);
					temp=line.split("\\s+");
					System.out.println(temp[0]);
					
			}
		input.close();
		} catch (Exception err) {
		err.printStackTrace();
		}
	}
}
