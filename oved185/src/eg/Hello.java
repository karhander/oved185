package eg;

import java.time.LocalDate;
import java.time.Month;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Hello {
	public static void main(String[] args) {
		System.out.println("Hello @" + LocalDate.of(2018, Month.JANUARY, 5));

		System.out.println("Single is: " + findSingle(new int[] { 1, 3, 2, 2, 1 }));
		
		
		
		// find single number in e.g. [1,3,2,2,1] but in a random array, that can be very big

	}

	public static int findSingle(int[] data) {
		if (data == null || data.length < 1) {
			throw new IllegalArgumentException("Not enough elements in input");
		}
		if (data.length % 2 == 0) {
			throw new IllegalArgumentException("Unexpected number of elements");
		}
		if (data.length == 1)
			return data[0];

		Arrays.sort(data);   //puts data in order from the smallest to the biggest

		for (int i = 0; i < data.length; i++) {
			if (i == data.length - 1) {         //if I'm at the last position just print it, cause it means that there are no more numbers to compare with
				return data[i];
			}
			if (data[i] != data[i + 1]) {
				return data[i];
			}

			i += 1;
		}

		throw new IllegalArgumentException("Can't find single element");

	}
	
	
	/////ANOTHER WAY:
	public static int findSingle(int[] data) {
		if (data == null) {
			throw new IllegalArgumentException("Not einput data");
		}
		int counters[] = new int[10];                                //counters checks the numbers and saves how many times they repeat
		

		
		for(int i = 0; i < data.length; i++) {
			int cur = data[i];
			if(cur < 0 || cur > 9) {
				throw new IllegalArgumentException("Unexpected value: " + cur);
			}
			counters[cur] += 1;
		}


		for (int i = 0; i < counters.length; i++) {
			if (counters[i] == 1) {         
				return i;

		}

		throw new IllegalArgumentException("Can't find single element");
	
		}
	
	}
	
	
	//WITH MAP:
	/* Map<Integer, Integer> counters = new HashMap<>();
	counters.put(5, 42);										//key =5, value =42
	counters.get(5); 											 //returns 42
	if(counters.containsKey(5)) {
		counters.put(5,  43);
	}
	counters.put(5, counters.getOrDefault(5,  0) + 1); */ //you have to increase the amount of 5s, you added 5 in your set and you have to increase the counter of them now, se non ce ritorna mi 0, se ce ritorna mi cosa ce
	public static int findSingle(int[] data) {
		if (data == null) {
			throw new IllegalArgumentException("Not einput data");
		}
		
		Map<Integer, Integer> counters = new HashMap<>();
		for(int i = 0; i < data.length; i++) {
			int cur = data[i];
			counters.put(cur,  counters.getOrDefault(cur,  0) + 1);
		}
		
		Iterator<Map.Entry<Integer, Integer>> it = counters.entrySet().iterator();
		while(it.hasNext()) {
			Map.Entry<Integer, Integer> entry = it.next();
			if(entry.getValue() == 1) {
				return entry.getKey();
			}
		}
		
		
		//does the same as the one above
//		Iterator<Integer> it = counters.keySet().iterator();
//		while(it.hasNext()) {
//			Integer key = it.next();
//				if(counters.get(key) == 1) {
//					return key;
//				}
//		}
	}
}

	/* MY TRY:
	 * 
	 * Arrays.sort(data); 
	 * 
	 * int single = data[0];
	 * 
	 * for(int i = 1; i < data.length; i++) { 
	 * 	if(single != data[i]) { 
	 * 	single = data[i]; 
	 * }else { 
	 * 
	 * System.out.print(single); } 
	 * }
	 * 
	 * return single; }
	 */

