package CT;

import java.util.Calendar;
import java.util.Date;
import java.util.Vector;
import java.util.TimeZone;
import java.text.SimpleDateFormat;

public class  CalendarDate{
		
	public static double dateDiff(String adate) {
	    
		Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
		SimpleDateFormat sdf= new SimpleDateFormat("MMMMMMMMMM");
	    Date currentTime = localCalendar.getTime();
		int currentDay = localCalendar.get(Calendar.DATE);
        int currentMonth = localCalendar.get(Calendar.MONTH) + 1;
        int currentYear = localCalendar.get(Calendar.YEAR);
		String today=currentDay+"/"+currentMonth+"/"+currentYear;
		
		SimpleDateFormat myFormat = new SimpleDateFormat("dd/MM/yyyy");
		String inputString1 = adate;
		String inputString2 = today;
		double days=0.0f;
try {
    Date date1 = myFormat.parse(inputString1);
    Date date2 = myFormat.parse(inputString2);
    long diff = date2.getTime() - date1.getTime();
///    System.out.println ("Days: " + diff);
	 days = (diff / (1000*60*60*24));
} catch (Exception e) {
    e.printStackTrace();
}	
	return days;
	}
    
	public static Vector<String> main() {

		Vector<String> v=new Vector<String>();
		//getting local time, date, day of week and other details in local timezone
        Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());

	    SimpleDateFormat sdf= new SimpleDateFormat("MMMMMMMMMM");
	    Date currentTime = localCalendar.getTime();

        int currentDay = localCalendar.get(Calendar.DATE);
        int currentMonth = localCalendar.get(Calendar.MONTH) + 1;
        int currentYear = localCalendar.get(Calendar.YEAR);
 
		String today=currentDay+"/"+currentMonth+"/"+currentYear;
		System.out.println("Current Day " + today);

    

		v.add(currentYear+"");
 //System.out.println("Current Month : " +currentMonth);
    
		Date d =new Date();
		String month=sdf.format(d);
		System.out.println("Current Month: " + month);
				v.add(month);
         System.out.println("Current Day: " + currentDay);
if( currentDay<=10){ System.out.println("Early "+month );
		v.add("Early "+month );
}
else if( currentDay>10 && currentDay<=20 ){ System.out.println("Middle "+month);
		v.add("Middle "+month );

}
else if( currentDay>20){ System.out.println("Late "+month);
		v.add("Late "+month );

}
		
v.add(today);
	
return v;
		
    }

    public static void main(String args[]) {
		System.out.println(dateDiff("01/08/2017"));
	}

}
