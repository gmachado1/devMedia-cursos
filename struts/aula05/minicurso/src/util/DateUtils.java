package util;

import java.util.Date;

public class DateUtils {

	@SuppressWarnings("deprecation")
	public static int calculateYearsDifference(Date dataNascimento, Date date) {
		return date.getYear()-dataNascimento.getYear();
	}

}
