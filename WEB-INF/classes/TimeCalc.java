package CT;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeCalc {

    
    public static String getTime() {

		DateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		Date date = new Date();
        return sdf.format(date)+"";
	}


    public static long timeDiff(String t1, String t2) {
			SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
		Date d1 = null;
		Date d2 = null;
		try{

		d1 = format.parse(t1);
			d2 = format.parse(t2);
		}catch(Exception e){}
			long diff = d2.getTime() - d1.getTime();
			long diffSeconds = diff / 1000 % 60;
			
			return diffSeconds;

	}
	public static void main(String[] args) {
		String t1=getTime();
		System.out.println(t1);
		try{Thread.sleep(4000);}catch(Exception e){}
		String t2=getTime();
		System.out.println(t2);
		System.out.println(timeDiff(t1,t2));
	}

}