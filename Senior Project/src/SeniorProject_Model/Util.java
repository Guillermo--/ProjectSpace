package SeniorProject_Model;

public class Util {

	public static String extractContent(String str) {
		String content = "";
		int i = 0;
		if (str.length() > 0) {
			while (i < str.length() && str.charAt(i) != '-') {
				content = content + str.charAt(i);
				i++;
			}
		}
		return content;
	}

	public static String extractID(String str) {
		String id = "";
		int i = str.length() - 1;
		if (str.length() > 0) {
			while (i > 0 && str.charAt(i) != '-') {
				id = str.charAt(i) + id;
				i--;
			}
		}
		return id;
	}
}
