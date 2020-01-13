package CT;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.util.Set;
import java.util.HashSet;
public class Processer 
{
	public static Set<String> main() 
	{

		Set<String> set=new HashSet<String>();
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
					set.add(temp[0]);
			}
		input.close();
		} catch (Exception err) {
		err.printStackTrace();
		}
		return set;
	}

	public static void main(String[] args){
	System.out.println(main());
	} 


}
