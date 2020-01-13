package CT;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class  GetText
{
	public static String main(String urlString) throws Exception
	{
	Document doc;
	
	//urlString = "http://db.apache.org/derby/releases/release-10.11.1.1.cgi";
	doc = Jsoup.connect(urlString).get();
	String text = doc.body().text();

	return text;


	}

	public static String title(String urlString) throws Exception
	{
	Document doc;
	doc = Jsoup.connect(urlString).get();
	String title = doc.title();
			
	return title;


	}

	public static void main(String[] args)  throws Exception
	{
		System.out.println(GetText.main("http://db.apache.org/derby/releases/release-10.11.1.1.cgi"));
	}

}
