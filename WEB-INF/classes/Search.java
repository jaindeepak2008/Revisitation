package Search;

import java.util.Vector;
import java.io.File;
import java.io.PrintWriter;


import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
 
public class Search   {
 

     public static Vector ae=new Vector();
    Vector result=new Vector();


  public static Vector main(String args) {
	   Vector result=new Vector();
int  count=0;
	 String key="";

	Document doc;
	try {
 
		// need http protocol
	boolean term=false; 
		//System.out.println("BING SEARCH"+args);
	String[] words=null;
	words=args.split(" ");
//System.out.println("words l = "+words.length);
	for(String s:words)
	{	
		if(term==true)
		{
					key=key+"+";
					key=key+s;
		}else{
			key=key+s;
		term=true;
		}
	}

	//System.out.println(key);
	File f=new File("SearchResults.txt");
	System.out.println(f);
	if(f.exists())
	 {
		f.delete();
	}
	f.createNewFile();
	PrintWriter pw=new PrintWriter(f);

		String first="11";
		String urlString = "http://www.bing.com/search?q="
                        + key;
		doc = Jsoup.connect(urlString).get();
		String title = doc.title();
		Elements links = doc.select("a[href]");




		for (Element link : links) {
		String lk=link.attr("href");

		if((lk.contains("http://")||lk.contains("https://"))&&!lk.contains("microsoft")&&!lk.contains("msn")&&!lk.contains("bing"))
			{

			lk=lk.replaceAll("https://","");
			lk=lk.replaceAll("http://","");
			pw.println("<a href=search2.jsp?link="+lk+" target=_blank>http://"+lk+"</a>");
			pw.println(title);
			pw.println("");
	


		result.add(lk);
		result.add(link.text());
			}

 
		}
		pw.flush();
		pw.close();

 
	} catch (Exception e) {
		e.printStackTrace();
	}

return result; 
  }
  	public static void main(String[] args) 
	{


	}

 
}