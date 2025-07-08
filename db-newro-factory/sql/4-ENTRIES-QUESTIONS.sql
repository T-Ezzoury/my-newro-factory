USE `newro-factory-db`;
SELECT 'Creating entries...' AS message;

INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (314,'OCA - Chapter 2 - Dernière question','Sens tu &agrave; l&#39;aise avec ce chapitre ?',59),
	 (364,'OCA Final Exam - 1','<p>What is the output if this class is run with java Indexing cars carts?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Indexing { 
	public static void main(String... books) { 
		StringBuilder sb = new StringBuilder(); 
		for (String book : books) 
			sb.insert(sb.indexOf("c"), book); 
		System.out.println(sb); 
	} 
}</code></pre>',5),
	 (365,'OCA Final Exam - 2','Fill in the blanks: The operators +=,__________ ,__________ ,__________ ,__________ , and ++ are listed in increasing or the same level of operator precedence. (Choose two.)',5),
	 (366,'OCA Final Exam - 3','<p>Which of the following are valid JavaBean signatures? (Choose three.)</p>',5),
	 (367,'OCA Final Exam - 4','<p>Which of the following are true? (Choose two.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">20: int[] crossword [] = new int[10][20]; 
21: for (int i = 0; i &lt; crossword.length; i++) 
22: for (int j = 0; j &lt; crossword.length; j++) 
23: crossword[i][j] = ''x''; 
24: System.out.println(crossword.size());</code></pre>',5),
	 (368,'OCA Final Exam - 5','<p>Which of the following statements about java.lang.Error are most accurate? (Choose two.)</p>',5),
	 (369,'OCA Final Exam - 6','<p>Given a class that uses the following import statements, which class would be automatically accessible without using its full package name? (Choose three.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import forest.Bird; 
import jungle.tree.*; 
import savana.*;</code></pre>',5),
	 (370,'OCA Final Exam - 7','<p>How many of the following variables represent immutable objects?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">ArrayList l = new ArrayList(); 
String s = new String(); 
StringBuilder sb = new StringBuilder(); 
LocalDateTime t = LocalDateTime.now();</code></pre>',5),
	 (371,'OCA Final Exam - 8','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">StringBuilder builder = new StringBuilder("Leaves growing"); 
do { builder.delete(0, 5); } 
while (builder.length() &gt; 5); 
System.out.println(builder);</code></pre>',5),
	 (372,'OCA Final Exam - 9','<p>What is the output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package reality; 
public class Equivalency { 
	public static void main(String[] edges) { 
		final String ceiling = "up"; 
		String floor = new String("up"); 
		final String wall = new String(floor); 
		System.out.print((ceiling==wall) +" "+(floor==wall) +" "+ceiling.equals(wall)); 
	} 
}</code></pre>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (373,'OCA Final Exam - 10','<p>How many times does the following code print true?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">1: public class Giggles { 
2: public static void main(String[] args) { 
3: String lol = "lol"; 
4: System.out.println(lol.toUpperCase() == lol); 
5: System.out.println(lol.toUpperCase() == lol.toUpperCase()); 
6: System.out.println(lol.toUpperCase().equals(lol)); 
7: System.out.println(lol.toUpperCase().equals(lol.toUpperCase())); 
8: System.out.println(lol.toUpperCase().equalsIgnoreCase(lol)); 
9: System.out.println(lol.toUpperCase() 
10: .equalsIgnoreCase(lol.toUpperCase())); 
11: } }</code></pre>',5),
	 (374,'OCA Final Exam - 11','<p>Which lines can be removed together without stopping the code from compiling and while printing the same output? (Choose three.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">14: String race = ""; 
15: outer: 
16: do { 
17: inner: 
18: do { 
19: race += "x"; 
20: } while (race.length() &lt;= 4); 
21: } while (race.length() &lt; 4); 
22: System.out.println(race);</code></pre>',5),
	 (375,'OCA Final Exam - 12','<p>Which of the following do not compile when filling in the blank? (Choose two.)&nbsp;</p><p>&nbsp;</p><p>long bigNum = ____________;</p>',5),
	 (376,'OCA Final Exam - 13','<p>How many lines does this program print?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.time.*; 
public class OnePlusOne { 
	public static void main(String... nums) { 
		LocalTime time = LocalTime.of(1, 11); 
		while (time.getHour() &lt; 1) { 
			time.plusHours(1); 
			System.out.println("in loop"); 
		} 
	} 
}</code></pre>',5),
	 (377,'OCA Final Exam - 14','<p>What is the result of running the following program?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">1: package fun; 
2: public class Sudoku { 
3: static int[][] game; 
4: 
5: public static void main(String args[]) { 
6: game[3][3] = 6; 
7: Object[] obj = game; 
8: obj[3] = ''X''; 
9: System.out.println(game[3][3]); 
10: } 
11: }</code></pre>',5),
	 (378,'OCA Final Exam - 15','<p>Which of the following use generics and compile without warnings? (Choose two.)</p>',5),
	 (379,'OCA Final Exam - 16','<p>Which of the following are true right before the main() method ends? (Choose two.)</p><p>&nbsp;</p><pre><code class="language-java">public static void main(String[] args) { 
	String shoe1 = new String("sandal"); 
	String shoe2 = new String("flip flop"); 
	String shoe3 = new String("croc"); 
	shoe1 = shoe2; 
	shoe2 = shoe3; 
	shoe3 = shoe1; 
}</code></pre>',5),
	 (380,'OCA Final Exam - 17','<p>How many lines of the following application do not compile?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package ocean; 
class BubbleException extends Exception {} 
class Fish { 
	Fish getFish() throws BubbleException { 
		throw new RuntimeException("fish!"); 
	} 
} 
public final class Clownfish extends Fish { 
	public final Clownfish getFish() { 
		throw new RuntimeException("clown!"); 
	} 
	public static void main(String[] bubbles) { 
		final Fish f = new Clownfish(); 
		f.getFish(); 
		System.out.println("swim!"); 
	} 
}</code></pre>',5),
	 (381,'OCA Final Exam - 18','<p>How many lines does this code output?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.util.*; 
import java.util.function.*; 
public class PrintNegative { 
	public static void main(String[] args) { 
		List list= new ArrayList&lt;&gt;(); 
		list.add(-5); 
		list.add(0); 
		list.add(5); 
		print(list, e -&gt; e &lt; 0); 
	} 
	public static void print(List list, Predicate p) { 
		for (Integer num : list) 
			if (p.test(num)) 
				System.out.println(num); 
	} 
}</code></pre>',5),
	 (382,'OCA Final Exam - 19','<p>Which keywords are required with a try statement?&nbsp;</p><p>&nbsp;</p><p>I. finalize&nbsp;</p><p>II. catch&nbsp;</p><p>III. throws&nbsp;</p><p>IV. finally</p>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (383,'OCA Final Exam - 20','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">12: int result = 8; 
13: loop: while (result &gt; 7) { 
14: result++; 
15: do { 
16: result--; 
17: } while (result &gt; 5); 
18: break loop; 
19: } 
20: System.out.println(result);</code></pre>',5),
	 (384,'OCA Final Exam - 21','<p>What is the result of compiling and executing the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package reptile; 
public class Alligator { 
	static int teeth; 
	double scaleToughness; 
	public Alligator() { teeth++; } 
	public void snap(int teeth) { 
		System.out.print(teeth+" "); 
		teeth--; 
	} 
	public static void main(String[] unused) { 
		new Alligator().snap(teeth); 
		new Alligator().snap(teeth); 
	} 
}</code></pre>',5),
	 (385,'OCA Final Exam - 22','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Costume { 
	public static void main(String[] black) { 
		String witch = "b"; 
		String tail = "lack"; 
		witch.concat(tail); 
		System.out.println(witch); 
	} 
}</code></pre>',5),
	 (386,'OCA Final Exam - 23','<p>Which modifiers can be independently applied to an interface method? (Choose three.)</p>',5),
	 (387,'OCA Final Exam - 24','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Shoelaces { 
	public static void main(String[] args) { 
		String tie = null; 
		while (tie = null) 
			tie = "shoelace"; 
		System.out.print(tie); 
	} 
}</code></pre>',5),
	 (388,'OCA Final Exam - 25','<p>What statements are true about compiling a Java class file? (Choose two.)</p>',5),
	 (389,'OCA Final Exam - 26','<p>What is the output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package woods; 
interface Plant { 
	default String grow() { 
		return "Grow!"; 
	} 
} 
interface Living { 
	public default String grow() { 
		return "Growing!"; 
	} 
} 
public class Tree implements Plant, Living { // m1 
	public String grow(int height) { 
		return "Super Growing!"; 
	} 
	public static void main(String[] leaves) { 
		Plant p = new Tree(); // m2 
		System.out.print(((Living)p).grow()); // m3 
	} 
}</code></pre>',5),
	 (390,'OCA Final Exam - 27','<p>What is the result of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public static void main(String... args) { 
	String name = "Desiree"; 
	int _number = 694; 
	boolean profit$$$; 
	System.out.println(name + " won. " + _number + " profit? " + profit$$$); 
}</code></pre>',5),
	 (391,'OCA Final Exam - 28','<p>Fill in the blanks: Given a variable x, __________ decreases the value of x by 1 and returns the original value, while __________ increases the value of x by 1 and returns the new value.</p>',5),
	 (392,'OCA Final Exam - 29','<p>Given the following two classes in the same package, which constructors contain compiler errors? (Choose three.)</p><p>&nbsp;</p><pre><code class="language-java">public class Big { 
	public Big(boolean stillIn) { 
		super(); 
	} 
} 
public class Trouble extends Big { 
	public Trouble() {} 
	public Trouble(int deep) { 
		super(false); 
		this(); 
	} 
	public Trouble(String now, int... deep) { 
		this(3); 
	} 
	public Trouble(long deep) { 
		this("check",deep); 
	} 
	public Trouble(double test) { 
		super(test&gt;5 ? true : false); 
	} 
}</code></pre>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (393,'OCA Final Exam - 30','<p>Which of the following can replace the comment so this code outputs 100? (Choose two.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Stats { 
	// INSERT CODE 
	public static void main(String[] math) { 
		System.out.println(max - min); 
	} 
}</code></pre>',5),
	 (394,'OCA Final Exam - 31','<p>Which of the following statements are true about Java operators and statements? (Choose two.)</p>',5),
	 (395,'OCA Final Exam - 32','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">1: public class Legos { 
2: 	public static void main(String[] args) { 
3: 		StringBuilder sb = new StringBuilder(); 
4: 		sb.append("red"); 
5: 		sb.deleteCharAt(0); 
6: 		sb.delete(1, 1); 
7: 		System.out.println(sb); 
8: 	} 
9: }</code></pre>',5),
	 (396,'OCA Final Exam - 33','<p>Which of the following is a valid method name in Java? (Choose two.)</p>',5),
	 (397,'OCA Final Exam - 34','<p>Which of the following statements about inheritance are true? (Choose two.)</p>',5),
	 (398,'OCA Final Exam - 35','<p>Which of the following statements about Java are true?&nbsp;</p><p>I. The java command uses . to separate packages.&nbsp;</p><p>II. Java supports functional programming.&nbsp;</p><p>III. Java is object oriented.&nbsp;</p><p>IV. Java supports polymorphism.</p>',5),
	 (399,'OCA Final Exam - 36','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">String[][] listing = new String[][] { { "Book", "34.99" }, { "Game", "29.99" }, { "Pen", ".99" } }; 
System.out.println(listing.length + " " + listing[0].length);</code></pre>',5),
	 (400,'OCA Final Exam - 37','<p>Which of the following variable types is permitted in a switch statement? (Choose three.)</p>',5),
	 (401,'OCA Final Exam - 38','<p>What does the following do?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Shoot { 
	interface Target { 
		boolean needToAim(double angle); 
	} 
	static void prepare(double angle, Target t) { 
		boolean ready = t.needToAim(angle); // k1 
		System.out.println(ready); 
	} 
	public static void main(String[] args) { 
		prepare(45, d =&gt; d &gt; 5 || d &lt; -5); // k2 
	} 
}</code></pre>',5),
	 (402,'OCA Final Exam - 39','<p>Which of the following is a valid code comment in Java? (Choose three.)</p>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (403,'OCA Final Exam - 40','<p>Given the following two classes, each in a different package, which lines allow the second class to compile when inserted independently? (Choose two.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package food; 
public class Grass { 
	public static int seeds = 10; 
	public static Grass getGrass() {return new Grass();} 
} 
package woods; 
// INSERT CODE HERE 
public class Deer { 
	public void eat() { 
		getGrass(); 
		System.out.print(seeds); 
	} 
}</code></pre>',5),
	 (404,'OCA Final Exam - 41','<p>What is the result of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.util.*; 
public class Museums { 
	public static void main(String[] args) { 
		String[] array = {"Natural History", "Science", "Art"}; 
		List museums = Arrays.asList(array); 
		museums.remove(2); 
		System.out.println(museums); 
	} 
}</code></pre>',5),
	 (405,'OCA Final Exam - 42','<p>Which of the following substitutions will compile? (Choose two.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Underscores { 
	public String name = "Sherrin"; 
	public void massage() { int zip = 10017; } 
}</code></pre>',5),
	 (406,'OCA Final Exam - 43','<p>What is the result of the following when called as java counting.Binary?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package counting; 
import java.util.*; 
public class Binary { 
	public static void main(String[] args) { 
		args = new String[] {"0", "1", "01", "10" }; 
		Arrays.sort(args); 
		System.out.println(Arrays.toString(args)); 
	} 
}</code></pre>',5),
	 (407,'OCA Final Exam - 44','<p>Fill in the blanks: Using the _____________ and _____________ modifiers together allows a variable to be accessed from any class, without requiring an instance variable.</p>',5),
	 (408,'OCA Final Exam - 45','<p>How many lines does the following code output?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.util.*; 
public class Exams { 
	public static void main(String[] args) { 
		List exams = Arrays.asList("OCA", "OCP"); 
		for (String e1 : exams) 
			for (String e2 : exams) 
				System.out.print(e1 + " " + e2); 
			System.out.println(); 
	} 
}</code></pre>',5),
	 (409,'OCA Final Exam - 46','<p>Which of the following are true statements? (Choose two.)</p>',5),
	 (410,'OCA Final Exam - 47','<p>How many of the following lines of code compile?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">char one = Integer.parseInt("1"); 
Character two = Integer.parseInt("2"); 
int three = Integer.parseInt("3"); 
Integer four = Integer.parseInt("4");
short five = Integer.parseInt("5"); 
Short six = Integer.parseInt("6");</code></pre>',5),
	 (411,'OCA Final Exam - 48','<p>Given the application below, what data types can be inserted into the blank that would allow the code to print 3? (Choose three.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Highway { 
	public int drive(long car) { 
		return 2; 
	} 
	public int drive(double car) { 
		return 3; 
	} 
	public int drive(int car) { 
		return 5; 
	} 
	public int drive(short car) { 
		return 3; 
	} 
	public static void main(String[] gears) { 
		____________ value = 5; 
		System.out.print(new Highway().drive(value)); 
	} 
}</code></pre>',5),
	 (412,'OCA Final Exam - 49','<p>How many times does this code print true?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.time.*; 
public class Equality { 
	public void main(String[] args) { 
		System.out.println(new StringBuilder("zelda") == new StringBuilder("zelda")); 
		System.out.println(3 == 3); 
		System.out.println("bart" == "bart"); 
		System.out.println(new int[0] == new int[0]); 
		System.out.println(LocalTime.now() == LocalTime.now()); 
	} 
}</code></pre>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (413,'OCA Final Exam - 50','<p>What is the output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package ballroom; 
public class Dance { 
	public static void swing(int... beats) throws ClassCastException { 
		try { 
			System.out.print("1"+beats[2]); // p1 
		} catch (RuntimeException e) { 
			System.out.print("2"); 
		} catch (Exception e) { 
			System.out.print("3"); 
		} finally { 
			System.out.print("4"); 
		} 
	} 
	public static void main(String... music) { 
		new Dance().swing(0,0); // p2 
		System.out.print("5"); 
	} 
}</code></pre>',5),
	 (414,'OCA Final Exam - 51','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">List drinks = Arrays.asList("can", "cup"); 
for (int container = drinks.size(); container &gt; 0; container++) { 
	System.out.print(drinks.get(container-1) + ","); 
}</code></pre>',5),
	 (415,'OCA Final Exam - 52','<p>Which of the following method signatures are valid declarations of an entry point in a Java application? (Choose three.)</p>',5),
	 (416,'OCA Final Exam - 53','<p>Given the application below and the choices available, which lines must all be removed to allow the code to compile? (Choose three.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">1: package year; 
2: public class Seasons { 
3: public static void main(String[] time) { 
4: final long winter = 10; 
5: final byte season = 2; 
6: int fall = 4; 
7: final short summer = 3; 
8: switch(season) { 
9: case 1: 
10: case winter: System.out.print("winter"); 
11: default: 
12: case fall: System.out.print("fall"); 
13: case summer: System.out.print("summer"); 
14: default: 
15: } 
16: } 
17: }</code></pre>',5),
	 (417,'OCA Final Exam - 54','<p>Given the application below, which lines do not compile? (Choose three.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package furryfriends; 
interface Friend { 
	protected String getName(); // h1 
} 
class Cat implements Friend { 
	String getName() { // h2 
		return "Kitty"; 
	} 
} 
public class Dog implements Friend { 
	String getName() throws RuntimeException { // h3 
		return "Doggy"; 
	} 
	public static void main(String[] adoption) { 
		Friend friend = new Dog(); // h4 
		System.out.print(((Cat)friend).getName()); // h5 
		System.out.print(((Dog)null).getName()); // h6 
	} 
}</code></pre>',5),
	 (418,'OCA Final Exam - 55','<p>Which of the following are unchecked exceptions? (Choose three.)</p>',5),
	 (419,'OCA Final Exam - 56','<p>What is the result of compiling and executing the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package ranch; 
public class Cowboy { 
	private int space = 5; 
	private double ship = space &lt; 2 ? 1 : 10; // g1 
	public void printMessage() { 
		if(ship&gt;1) { 
			System.out.println("Goodbye"); 
		} 
		if(ship&lt;10 &amp;&amp; space&gt;=2) System.out.println("Hello"); // g2 
		else System.out.println("See you again"); 
	} 
	public static final void main(String... stars) { 
		new Cowboy().printMessage(); 
	} 
}</code></pre>',5),
	 (420,'OCA Final Exam - 57','<p>Given the following three class declarations, which sets of access modifiers can be inserted, in order, into the blank lines below that would allow all of the classes to compile? (Choose three.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package wake; 
public class Alarm { 
	____________static int clock; 
	____________long getTime() {return clock;} 
} 
package wake; 
public class Coffee { 
	private boolean bringCoffee() { 
		return new Alarm().clock&lt;10;
	} 
} 
package sleep; 
public class Snooze extends wake.Alarm { 
	private boolean checkTime() { 
		return getTime()&gt;10;
	} 
}</code></pre>',5),
	 (421,'OCA Final Exam - 58','<p>Given that FileNotFoundException is a subclass of IOException and Long is a subclass of Number, what is the output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package materials; 
import java.io.*; 
class CarbonStructure { 
	protected long count; 
	public abstract Number getCount() throws IOException; // q1 
	public CarbonStructure(int count) { 
		this.count = count; 
	} 
} 
public class Diamond extends CarbonStructure { 
	public Diamond() { 
		super(15); 
	} 
	public Long getCount() throws FileNotFoundException { // q2 
		return count; 
	} 
	public static void main(String[] cost) { 
		try { 
			final CarbonStructure ring = new Diamond(); // q3 
			System.out.print(ring.getCount()); // q4 
		} catch (IOException e) { 
			e.printStackTrace(); 
		} 
	} 
}</code></pre>',5),
	 (422,'OCA Final Exam - 59','<p>How many lines contain a compile error?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">1: import java.time.*; 
2: import java.time.format.*; 
3: 
4: public class HowLong { 
5: public void main(String h) { 
6: LocalDate newYears = new LocalDate(2017, 1, 1); 
7: Period period = Period.ofYears(1).ofDays(1); 
8: DateTimeFormat format = DateTimeFormat.ofPattern("MM-dd-yyyy"); 
9: System.out.print(format.format(newYears.minus(period))); 
10: } 
11: }</code></pre>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (423,'OCA Final Exam - 60','<p>Which of the following statements about try-catch blocks are correct? (Choose two.)</p>',5),
	 (424,'OCA Final Exam - 61','<p>What is printed by the following code snippet?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">int fish = 1 + 2 * 5&gt;=2 ? 4 : 2; 
int mammals = 3 &lt; 3 ? 1 : 5&gt;=5 ? 9 : 7; 
System.out.print(fish+mammals+"");</code></pre>',5),
	 (425,'OCA Final Exam - 62','<p>Which of the following statements about objects, reference types, and casting are correct? (Choose three.)</p>',5),
	 (426,'OCA Final Exam - 63','<p>What is the output of the following when run as java EchoFirst seed flower plant?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package unix; 
import java.util.*; 
public class EchoFirst { 
	public static void main(String[] args) { 
		int result = Arrays.binarySearch(args, args[0]); 
		System.out.println(result); 
	} 
}</code></pre>',5),
	 (427,'OCA Final Exam - 64','<p>How many objects are eligible for garbage collection at the end of the main() method?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package store; 
public class Shoes { 
	static String shoe1 = new String("sandal"); 
	static String shoe2 = new String("flip flop"); 
	public static void shopping() { 
		String shoe3 = new String("croc"); 
		shoe2 = shoe1; shoe1 = shoe3; 
	} 
	public static void main(String... args) { 
		shopping(); 
	} 
}</code></pre>',5),
	 (428,'OCA Final Exam - 65','<p>Fill in the blanks: The ____________keyword is used in method declarations, the ____________keyword is used to guarantee a statement will execute even if an exception is thrown, and the ____________keyword is used to throw an exception to the surrounding process.</p>',5),
	 (429,'OCA Final Exam - 66','<p>Which statements best describe the result of this code? (Choose two.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package nyc; 
public class TouristBus { 
	public static void main(String... args) { 
		String[] nycTourLoops = new String[] { "Downtown", "Uptown", "Brooklyn" }; 
		String[] times = new String[] { "Day", "Night" }; 
		for (int i = 0, j = 0; i &lt; nycTourLoops.length; i++, j++) 
			System.out.println(nycTourLoops[i] + " " + times[j]); 
	} 
}</code></pre>',5),
	 (430,'OCA Final Exam - 67','<p>Fill in the blanks: Because of____________ , it is possible to ____________a method, which allows Java to support____________ .</p>',5),
	 (431,'OCA Final Exam - 68','<p>What is the result of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package calendar; 
public class Seasons { 
	public static void seasons(String... names) { 
		int l = names[1].length(); // s1 
		System.out.println(names[l]); // s2 
	} 
	public static void main(String[] args) { 
		seasons("Summer", "Fall", "Winter", "Spring"); 
	} 
}</code></pre>',5),
	 (432,'OCA Final Exam - 69','<p>How many lines of the following application contain compilation errors?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">1: package percussion; 
2: 
3: interface MakesNoise {} 
4: abstract class Instrument implements MakesNoise { 
5: public Instrument(int beats) {} 
6: public void play() {} 
7: } 
8: public class Drum extends Instrument { 
9: public void play(int count) {} 
10: public void concert() { 
11: super.play(5); 
12: } 
13: public static void main(String[] beats) { 
14: MakesNoise mn = new Drum(); 
15: mn.concert(); 
16: } 
17: }</code></pre>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (433,'OCA Final Exam - 70','<p>What is the output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package fly; 
public class Helicopter { 
	public int adjustPropellers(int length, String[] type) { 
		length++; 
		type[0] = "LONG"; 
		return length; 
	} 
	public static void main(String[] climb) { 
		final Helicopter h = new Helicopter(); 
		int length = 5; 
		String[] type = new String[1]; 
		length = h.adjustPropellers(length, type); 
		System.out.print(length+","+type[0]); 
	} 
}</code></pre>',5),
	 (434,'OCA Final Exam - 71','<p>How many lines of the following application do not compile?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package castles; 
class OpenDoorException extends Exception {} 
class CableSnapException extends OpenDoorException {} 
public class Palace { 
	public void openDrawbridge() throws Exception { 
		try { 
			throw new Exception("Problem"); 
		} catch (OpenDoorException e) { 
			throw new OpenDoorException(); 
		} catch (CableSnapException ex) { 
			try { 
				throw new OpenDoorException(); 
			} catch (Exception ex) { } 
			finally { 
				System.out.println("Almost done"); 
			} 
		} finally { 
			throw new RuntimeException("Unending problem"); 
		} 
	} 
	public static void main(String[] moat) throws IllegalArgumentException { 
		new Palace().openDrawbridge(); 
	} 
}</code></pre>',5),
	 (435,'OCA Final Exam - 72','<p>Choose the best answer: ____________and ____________are two properties that go hand in hand to improve class design by structuring a class with related attributes and actions while protecting the underlying data from access by other classes</p>',5),
	 (436,'OCA Final Exam - 73','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">string bike1 = "speedy"; 
string bike2 = new String("speedy"); 
boolean test1 = bike1 == bike2; 
boolean test2 = bike1.equals(bike2); 
System.out.println(test1 + " " + test2);</code></pre>',5),
	 (437,'OCA Final Exam - 74','<p>What is the output of the following when run as java unix.EchoFirst seed flower plant?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package unix; 
import java.util.*; 
public class EchoFirst { 
	public static void main(String[] args) { 
		Arrays.sort(args); 
		int result = Arrays.binarySearch(args, args[0]); 
		System.out.println(result); 
	} 
}</code></pre>',5),
	 (438,'OCA Final Exam - 75','<p>Which are true statements? (Choose three.)</p>',5),
	 (439,'OCA Final Exam - 76','<p>How many lines does this program print?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.time.*; 
public class OnePlusOne { 
	public static void main(String... nums) { 	
		LocalDate time = LocalDate.of(1, 11); 
		while (time.getHour() &lt; 1) { 
			time.plusHours(1); 
			System.out.println("in loop"); 
		} 
	} 
}</code></pre>',5),
	 (440,'OCA Final Exam - 77','<p>How many objects are eligible for garbage collection immediately before the end of the main() method?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Tennis { 
	public static void main(String[] game) { 
		String[] balls = new String[1]; 
		int[] scores = new int[1]; 
		balls = null; 
		scores = null; 
	} 
}</code></pre>',5),
	 (441,'OCA Final Exam - 78','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">14: int count = 0; 
15: LocalDate date = LocalDate.of(2017, Month.JANUARY, 1); 
16: while (date.getMonth() != Month.APRIL) 
17: date = date.minusMonths(1); 
18: count++; 
19: System.out.println(count);</code></pre>',5),
	 (442,'OCA Final Exam - 79','<p>How many lines of the following class do not compile?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">1: package arctic; 
2: abstract class Bear { 
3: protected int sing; 
4: protected abstract int grunt(); 
5: int sing() { 
6: return sing; 
7: } 
8: } 
9: public class PolarBear extends Bear { 
10: int grunt() { 
11: sing() += 10; 
12: return super.grunt()+1; 
13: return 10; 
14: } 
15: }</code></pre>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (443,'OCA Final Exam - 80','<p>In which places is the default keyword permitted to be used? (Choose two.)</p>',5),
	 (447,'OCP - Chapter 11 - 4','<p>What is the output of this code?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">class Laptop extends Computer { 
	public void startup() { 
		System.out.print("laptop-"); 
	} 
} 
public class Computer { 
	public void startup() { 
		System.out.print("computer-"); 
	} 
	public static void main(String[] args) { 
		Computer computer = new Laptop(); 
		Laptop laptop = new Laptop(); 
		computer.startup(); 
		laptop.startup(); 
	} 
}</code></pre>',174),
	 (458,'OCP - Chapter 11 - 15','<p>Which methods compile?&nbsp;</p><pre><code class="language-java">private static int numShovels; 
private int numRakes; 
public int getNumShovels() { 
	return numShovels; 
} 
public int getNumRakes() { 
	return numRakes; 
}</code></pre>',176),
	 (471,'OCP - Chapter 11 - 30','<p>Which variable declaration is the first line not to compile?&nbsp;</p><pre><code class="language-java">30: class Building {} 
31: class House extends Building{} 
32: 
33: public void convert() { 
34:     Building b = new Building(); 
35:     House h = new House(); 
36:     Building bh = new House(); 
37:     House p = (House) b; 
38:     House q = (House) h; 
39:     House r = (House) bh; 
40: }</code></pre>',174),
	 (475,'OCP - Chapter 11 - 34','<p>How many of the following pairs of values can fill in the blanks to comply with the contract of the hashCode() and equals() methods?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">class Sticker { 
    public int hashCode() { 
        return _____________; 
    } 
    public boolean equals(Object o) { 
        return _____________; 
    } 
} 

I. 1, false 
II. 1, true 
III. new Random().nextInt(), false 
IV. new Random().nextInt(), true</code></pre>',196),
	 (483,'OCP - Chapter 13 - Q2','<p>Which method is available on both List and Stream implementations?</p>',248),
	 (507,'OCP - Chapter 13 - Q26','<p>Which type allows inserting a null value?</p>',222),
	 (562,'OCP - Chapter 15 - Q4','<p>How many of the following can fill in the blank to have the code print 44?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">Stream&lt;String&gt; stream = Stream.of("base", "ball"); 
stream._____________(s -&gt; s.length()).forEach(System.out::print);</code></pre><p>&nbsp;</p><p>&nbsp;I. map&nbsp;</p><p>II. mapToInt&nbsp;</p><p>III. mapToObject</p>',289),
	 (592,'OCP - Chapter 15 - Q36','<p>When working with a Stream&lt;String&gt;,, which of these types can be returned from the collect() terminal operator by passing arguments to Collectors.groupingBy()?&nbsp;</p><p>&nbsp;</p><p>I. Map&lt;Integer, List&lt;String&gt;&gt;<br>II. Map&lt;Boolean, HashSet&lt;String&gt;&gt;<br>III. List&lt;String&gt;</p>',270);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (749,'OCP - Chapter 15 - Q40','<p>A developer tries to rewrite a method that uses flatMap() without using that intermediate operator. Which pair of method calls shows the withoutFlatMap() method is not equivalent to the withFlatMap() method?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public static void main(String[] args) { 
	List list = new LinkedList&lt;&gt;(); 
	Deque queue = new ArrayDeque&lt;&gt;(); 
	queue.push("all queued up"); 
	queue.push("last"); 
} 
private static void withFlatMap(Collection coll) { 
	Stream.of(coll) 
		.flatMap(x -&gt; x.stream()) 
		.forEach(System.out::print); 
	System.out.println(); 
} 
private static void withoutFlatMap(Collection coll) { 
	Stream.of(coll) 
		.filter(x -&gt; !x.isEmpty()) 
		.map(x -&gt; x) 
		.forEach(System.out::print); 
	System.out.println(); 
}</code></pre>',8),
	 (849,'OCP - Chapter 16 - q31','<p>What is the output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package vortex;
class TimeException extends Exception {}
class TimeMachine implements AutoCloseable {
    int v;
    public TimeMachine(int v) { this.v = v; }
    public void close() throws Exception {
        System.out.print(v);
    }
}
public class TimeTraveler {
    public static void main(String[] twelve) {
        try (TimeMachine timeSled = new TimeMachine(1);
            TimeMachine delorean = new TimeMachine(2);
            TimeMachine tardis = new TimeMachine(3)) { } catch (TimeException e) {
            System.out.print(4);
        } finally {
            System.out.print(5);
        }
    }
}</code></pre>',263),
	 (870,'OCP - Chapter 17 - Q12','<p>What is the result of running this code?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">12: LocalDate pieDay = LocalDate.of(2017, Month.JANUARY, 23);
13: LocalTime midnight = LocalTime.of(0, 0);
14: LocalDateTime pieTime = LocalDateTime.of(pieDay, midnight);
15: 
16: DateTimeFormatter f = DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT);
17: f.format(pieDay);
18: f.format(pieTime);
29: f.format(midnight);</code></pre>',290),
	 (917,'OCP - Chapter 18 - 21','<p>Assume the file referenced in the StudentManager class exists and contains data. Which statement about the following class is correct?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package school;
import java.io.*;

class Student implements Serializable {}
public class StudentManager {
    public static void main(String[] grades) {
        try(ObjectInputStream ios = new ObjectInputStream(new FileInputStream(new File("C://students.data")))) {
            Student record;
            while((record = (Student)ios.readObject()) != null) {
                System.out.print(record);
            }
        } catch (EOFException e) { }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}</code></pre>',352),
	 (928,'OCP - Chapter 18 - 32','<p>Assuming the working directory is accessible, empty, and able to be written, how many file system objects does the following class create?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java"> 1: package kitchen; 
 2: import java.io.*; 
 3
 4: public class Bakers { 
 5:     public static void main(String... tooMany) throws IOException { 
 6:         File cake = new File("cake.txt"); 
 7:         Writer pie = new FileWriter("pie.txt"); 
 8:         pie.flush(); 
 9:         new File("fudge.txt").mkdirs(); 
10: } }</code></pre>',299),
	 (930,'OCP - Chapter 18 - 34','<p>Which statement best describes the following two methods?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public String getNameQuick() throws IOException { 
	final BufferedReader r = new BufferedReader(new FileReader("saved.name")); 
	final String name = r.readLine(); 
	r.flush();
	return name; 
} 
public String getNameSafely() throws IOException { 
	try(final BufferedReader r = new BufferedReader(new FileReader("saved.name"))) { 
		final String name = r.readLine(); 
		r.flush(); 
		return name; 
	}
}</code></pre>',313),
	 (937,'OCP - Chapter 19 - Q1','<p>Fill in the blanks: A(n)__________ is a file that contains a reference to another file or directory, while a(n)__________ is a file that contains content.</p>',316),
	 (971,'OCP - Chapter 19 - Q36','<p>Assuming the directory /eclipse/projects exists and its contents are accessible, which statement about the following code snippet is correct?</p><pre><code class="language-java">Path p = Paths.get("/eclipse/projects");
Files.walk(p)
    .map(z -&gt; z.toAbsolutePath().toString()).filter(s -&gt; s.endsWith(".java"))
    .collect(Collectors.toList()).forEach(System.out::println);
Files.find(p,Integer.MAX_VALUE, (w,a) -&gt; w.toAbsolutePath().toString().endsWith(".java"))
    .collect(Collectors.toList()).forEach(System.out::println);</code></pre>',371),
	 (980,'OCP - Chapter 20 - 5','<p>Given the original array, how many of the following for statements result in an exception at runtime, assuming each is executed independently?</p><pre><code class="language-java">List&lt;Integer&gt; original = new ArrayList&lt;&gt;(Arrays.asList(1,2,3,4,5));

List&lt;Integer&gt; copy1 = new CopyOnWriteArrayList&lt;&gt;(original);
for(Integer w : copy1)
	copy1.remove(w);

List&lt;Integer&gt; copy2 = Collections.synchronizedList(original);
for(Integer w : copy2)
	copy2.remove(w);
	
List&lt;Integer&gt; copy3 = new ArrayList&lt;&gt;(original);
for(Integer w : copy3)
	copy3.remove(w);

Queue&lt;Integer&gt; copy4 = new ConcurrentLinkedQueue&lt;&gt;(original);
for(Integer w : copy4) 
	copy4.remove(w);</code></pre>',425),
	 (997,'OCP - Chapter 20 - 23','<p>What is the output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package farm; 
import java.util.concurrent.*; 

public class CountSheep extends RecursiveAction {
	static int[] sheep = new int[] {1,2,3,4};
	final int start; final int end;
	int count = 0;
	public CountSheep(int start, int end) {
		this.start = start;
		this.end = end;
	}
	public void compute() {
		if(end-start&lt;2) {
			count+=sheep[start];
			return;
		} else {
			int middle = start + (end-start)/2;
			invokeAll(new CountSheep(start,middle), new CountSheep(middle,end));
		}
	}
	public static void main(String[] night) {
		ForkJoinPool pool = new ForkJoinPool();
		CountSheep action = new CountSheep(0,sheep.length);
		pool.invoke(action);
		pool.shutdown();
		System.out.print(action.count);
	}
}</code></pre>',8);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (999,'OCP - Chapter 20 - 25','<p>What is a possible output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package salvage;
import java.util.*;
import java.util.concurrent.*;
import java.util.stream.*;

public class Car {
    private String model;
    private int year;
    public Car(String name, int year) {
        this.model = name; this.year = year;
    }
    public int getYear() {return year;}

    @Override
    public String toString() {return model;}

    public static void main(String... make) {
        List&lt;Car&gt; cars = new ArrayList&lt;&gt;();
        cars.add(new Car("Mustang",1967));
        cars.add(new Car("Thunderbird",1967));
        cars.add(new Car("Escort",1975));
        ConcurrentMap map = cars
                    .stream()
                    .collect(Collectors.groupingByConcurrent(Car::getYear));
        System.out.print(map);
    }
}</code></pre>',443),
	 (1000,'OCP - Chapter 20 - 26','<p>What is the output of the following application?</p><p>&nbsp;</p><pre><code class="language-java">package exercise; 
import java.util.*; 

public class Concat { 
	public String concat1(List&lt;String&gt; values) { 
		return values.parallelStream() 
				.reduce("a", (x,y)-&gt;x+y, String::concat); 
	} 
	public String concat2(List&lt;String&gt; values) { 
		return values.parallelStream() 
					.reduce((w,z)-&gt;z+w).get(); 
	} 
	public static void main(String... questions) { 
		Concat c = new Concat(); 
		List&lt;String&gt; list = Arrays.asList("Cat","Hat"); 
		String x = c.concat1(list); 
		String y = c.concat2(list); 
		System.out.print(x+" "+y); 
	} 
}</code></pre>',442),
	 (1004,'OCP - Chapter 20 - 30','<p>How many times does the following application print 1 at runtime?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package crew; 
import java.util.concurrent.*; 
import java.util.stream.*; 

public class Boat { 
	private void waitTillFinished(CyclicBarrier c) { 
		try { 
			c.await(); 
			System.out.print("1"); 
		} catch (Exception e) {} 
	} 
	public void row(ExecutorService service) { 
		final CyclicBarrier cb = new CyclicBarrier(5); 
		IntStream.iterate(1, i-&gt; i+1) 
					.limit(12) 
					.forEach(i -&gt; service.submit(() -&gt; waitTillFinished(cb))); 
	} 
	public static void main(String[] oars) { 
		ExecutorService service = null; 
		try { 
			service = Executors.newCachedThreadPool(); 
			new Boat().row(service); 
		} finally { service.isShutdown(); } 
	} 
}</code></pre>',445),
	 (1014,'OCP - Chapter 20 - 40','<p>How many lines of the following code snippet contain compilation errors?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">11: ScheduledExecutorService t = Executors 
12:     .newSingleThreadScheduledExecutor(); 
13: Future result = t.execute(System.out::println); 
14: t.invokeAll(null); 
15: t.scheduleAtFixedRate(() -&gt; {return;}, 5, TimeUnit.MINUTES);</code></pre>',402),
	 (1030,'OCP - Chapter 21 - Q16','<p>Assuming the clowns database exists and contains one empty table named clowns, what is the output of the following when run using a JDBC 4.0 driver?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.sql.*;

public class EmptyTable {
    public static void main(String[] args) throws SQLException { // s1
        String url = "jdbc:derby:clowns";
        try (Connection conn = new Connection(url); // s2
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from clowns")) {
            if (rs.next()) System.out.println(rs.getString(1));
        }
    }
}</code></pre>',461),
	 (1032,'OCP - Chapter 21 - Q19','<p>Table books:</p><p>---------------------------------------------------------------</p><p>| <strong>title</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| <strong>num_pages </strong>|</p><p>| <i>character varying(255)</i> &nbsp;| <i>integer &nbsp; &nbsp;</i> &nbsp; &nbsp; &nbsp;|</p><p>---------------------------------------------------------------</p><p>| OCA &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 379 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</p><p>| OCP &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 669 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</p><p>---------------------------------------------------------------<br>&nbsp;</p><p>Given the table books and a ResultSet created by running this SQL statement, which option prints OCP?</p><pre><code class="language-plaintext">SELECT title FROM cert WHERE num_pages &gt; 500;</code></pre>',470),
	 (1033,'OCP - Chapter 21 - Q20','<p>Assume the database exists with all referenced table and column names. Which is a true statement when a JDBC 4.0 driver is used?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">String url = "jdbc:derby:precipitation"; 
try (Connection conn = DriverManager.getConnection(url); 
    Statement stmt = conn.createStatement( ResultSet.CONCUR_READ_ONLY, ResultSet.TYPE_SCROLL_INSENSITIVE);
    ResultSet rs = stmt.execute( "select total from precip where type = ''rain''")) {
        System.out.println(rs.getString("total")); 
}</code></pre>',466),
	 (1040,'OCP - Chapter 21 - Q28','<p>Which is true if the clowns database exists and contains an empty clowns table?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">String url = "jdbc:derby:clowns"; 
try (Connection conn = DriverManager.getConnection(url);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select count(*) from clowns")) { 
    rs.next(); // r1 
    System.out.println(rs.getInt(1)); // r2 
}</code></pre>',470),
	 (1045,'OCP - Chapter 21 - Q33','<p>Assuming the clowns database exists and contains one empty table named clowns, what is the output of the following when run using a JDBC 4.0 driver?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.sql.*;

public class EmptyTable {
    public static void main (String[] args) throws SQLException { // s1
        String url = "jdbc:derby:clowns";
        try (Connection conn = DriverManager.getConnection(url); // s2
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from clowns")) {
            if (rs.next()) System.out.println(rs.getString(1));
        }
    }
}</code></pre>',470),
	 (1046,'OCP - Chapter 21 - Q35','<p>Given the following code snippet and the table in question 34, what is the output of the following when using a driver that supports a scroll sensitive ResultSet?&nbsp;</p><pre><code class="language-java">try (Connection conn = DriverManager.getConnection(url);
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmt.executeQuery( "select * from people order by last_name asc")) {
    rs.absolute(-1);
    System.out.print(rs.getString(1));
    System.out.print(" ");
    rs.absolute(1);
    System.out.print(rs.getString(1));
}</code></pre>',471);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1068,'OCP - Chapter 22 - Q17','<p>Which filename extension can hold a LocalDateTime property key in a resource bundle? (1 answer required)</p>',303),
	 (1075,'OCP - Chapter 22 - Q25','<p>Given the four properties files in question 24, what does this code print?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">Locale.setDefault(new Locale("en", "US")); 
ResourceBundle rb = ResourceBundle.getBundle("Cars", new Locale("fr", "CA"));
System.out.println(rb.getString("engine") + " "+ rb.getString("horses"));</code></pre>',8),
	 (1076,'OCP - Chapter 22 - Q26','<p>Given the four properties files in question 24, what does this code print?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">Locale.setDefault(new Locale("fr", "CA")); 
ResourceBundle rb = ResourceBundle.getBundle( "Cars", new Locale("en", "CA")); 
System.out.println(rb.getString("engine") + " " + rb.getString("horses"));</code></pre>',8),
	 (1081,'OCP - Chapter 22 - Q32','<p>Given the snippets of resource bundles in question 31 from when we compiled the application, what is the result of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">Locale.setDefault(new Locale("en")); 
ResourceBundle rb = ResourceBundle.getBundle("Buggy"); 
System.out.println(rb.getString("color"));</code></pre>',8),
	 (1082,'OCP - Chapter 22 - Q33','<p>Given the snippets of resource bundles in question 31 from when we compiled the application, what is the result of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">Locale.setDefault(new Locale("zh")); 
ResourceBundle rb = ResourceBundle.getBundle("Buggy"); 
System.out.println(rb.getString("wheels"));</code></pre>',8),
	 (1087,'OCP - Chapter 22 - Q38','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package counter; 
import java.util.*; 

public class CountResource extends ListResourceBundle { 
	private int count = 0; 
	@Override 
	protected Object[][] getContents() { 
		return new Object[][] { { "count", count++ } }; 
	} 
	public static void main(String[] args) { 
		ResourceBundle rb = new ResourceBundle("counter.CountResource"); 
		System.out.println(rb.getObject("count") + " " + rb.getObject("count")); 
	} 
}</code></pre>',303),
	 (1110,'OCP - Chapter 12 - Q21','<p>What is the output of the following application?&nbsp;</p><pre><code class="language-java"> 1: package fruit;
 2: 
 3: interface Edible { void eat(); }
 4: public class ApplePicking {
 5:     public static void main(String[] food) {
 6:          Edible apple = new Edible() {
 7:              @Override
 8:              void eat() {
 9:                  System.out.print("Yummy!");
10:              }
11:          }
12:     }
13: }</code></pre>',189),
	 (1116,'OCP - Chapter 12 - Q27','<p>Fill in the blank: The primary reason default interface methods were added to Java is to support____________ .</p>',8),
	 (1159,'OCP_Sybex_Chapitre2_Q5','<p>Parmi les propositions suivantes, lesquelles sont des concept du design pattern singleton ?</p>',185),
	 (1214,'VueJS_bases_Q2','<p>Quel est le modèle utilisé par Vue.js ?</p>',2);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1217,'VueJS_bases_Q3','<p>Qu''est ce qu''une instance d''un composant en Vue.JS ?</p>',825),
	 (1230,'VueJS_CLI_Q2','<p>Pourquoi on utilise des composants et pas des instances ?</p>',826),
	 (1231,'VueJS_CLI_Q3','<p>Comment faire pour passer des données d''un composant parent à un composant enfant ?</p>',828),
	 (1232,'VueJS_lifecycle_Q1','<p>A quoi servent les "lifecyle hooks" ou "lifecycle methods" ?</p>',827),
	 (1233,'VueJS_directives_Q1','<p>Si on a envie de faire une boucle, qu''utilise t-on ?</p>',834),
	 (1234,'VueJS_directives_Q2','<p>Est-ce que l''on peut faire des rendus conditionnels avec Vue ?</p>',833),
	 (1235,'VueJS_directives_Q3','<p>Si un utilisateur doit fréquemment afficher ou cacher un élément de la page, quelle est la meilleure directive à utiliser ?</p>',832),
	 (1237,'VueJS_lifecycle_Q2','<p>Parmi les hooks de cycle de vie suivants, lequel est le plus pertinent pour lancer des méthodes asynchrones, afin de récupérer des données depuis une API ?</p>',827),
	 (1257,'SPRING_Conteneur_7','<p>Quels sont les objets injectés dans les Spring containers ?</p>',148),
	 (1283,'VueJS_bases_Q1','<p>Qu''est-ce que Vue.js ?</p>',3);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1294,'SPRING_DI_IOC_8','Que signifie AOP pour Spring ?',154),
	 (1298,'ECMAScript_async_1','<p>En Javascript, quels sont les outils pour récupérer le résultat d''un appel asynchrone?</p>',17),
	 (1300,'ECMAScript_async_2','<p>ma_fonction execute du code asynchrone et utilise le mot clé await pour se faire. Comment peut-on déclarer la fonction?</p>',17),
	 (1304,'ECMAScript_async_3','<p>ma_fonction execute du code asynchrone mais n''utilise PAS le mot clé await. Comment peut-on déclarer la fonction?</p>',17),
	 (1306,'ECMAScript_async_4','<p>Pour gérer des appels asynchrones, quels méthodes sont a privilégier?</p>',17),
	 (1317,'ECMAScript_async_6','<p>Quelle est l''API fourni de base par javascript pour effectuer des appels asynchrones à une adresse distante?</p>',17),
	 (1318,'ECMAScript_ES6Features_1','<p>Quel mot clé introduit par ES6 permet de définir une variable comme une constante?</p>',18),
	 (1319,'ECMAScript_ES6Features_2','<p>Quel mot clé introduit par ES6 permet de définir une variable?</p>',18),
	 (1320,'ECMAScript_ES6Features_3','<p>ma_fonction est une fonction avec deux paramètres, a et b. Comment peut-on faire avec ES6 à la déclaration pour garantir une valeur par défaut pour b de 12?</p>',18),
	 (1321,'ECMAScript_ES6Features_4','<p>Avec ES6, que permet l''opérateur ... ?</p>',18);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1322,'ECMAScript_ES6Features_5','<p>ES6 a introduit une nouvelle façon d''écrire les fonctions. Quelles sont les syntaxes correctes</p>',18),
	 (1323,'ECMAScript_ES6Features_6','<p>Qu''est ce que le hoisting, ou hissage en français?</p>',18),
	 (1324,'ECMAScript_ES6Features_7','<p>Les classes introduites dans ES6 sont-elles concernés par le principe de hoisting (ou hissage)?</p>',18),
	 (1325,'ECMAScript_ES6Features_8','<p>Avant l''introduction des classes avec ES6, on ne pouvait pas faire de la POO avec Javascript/ECMAScript</p>',18),
	 (1326,'ECMAScript_ES6Features_9','<p>Depuis ES6, name étant une variable, comment peut on écrire "My name is " + name + " !" avec une seule paire de guillemet?</p>',18),
	 (1327,'ECMAScript_ES6Features_10','<p>Dans cette liste, sélectionniez les exemples de destructuring</p>',18),
	 (1328,'VueJS_CLI_Q5','<p>Quelles sont les 3 parties définissant un fichier .vue ?</p>',825),
	 (1334,'VueJS_CLI_Q6','<p>Quelle est la syntaxe pour passer une valeur dynamique "kiwi" à une prop ?</p>',836),
	 (1338,'VueJS_directives_Q4','<p>Quel est l''attribut nécessaire lorsqu''on crée une boucle avec v-for ?</p>',834),
	 (1341,'VueJS_directives_Q5','<p>Quelle directive associe un champ input à une donnée de composant (data) ?</p>',837);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1371,'VueJS_bases_Q5','<p>Comment initialiser une nouvelle instance de vue.js?</p>',826),
	 (1372,'VueJS_bases_Q6','<p>Quelle interpolation de liaison de données est aussi connue comme la syntaxe “Mustache”?</p>',831),
	 (1373,'VueJS_bases_Q7','<p>Pourquoi la propriété data d''un composant doit être une fonction qui renvoie un nouvel objet ?</p>',830),
	 (1374,'VueJS_bases_Q8','<p>Comment peut-on surveiller un changement de valeur dans les données pour déclencher une action ?</p>',830),
	 (1375,'VueJS_directives_Q6','<p>La directive v-show ne supporte pas l''élément &lt;template&gt;.</p>',833),
	 (1381,'VueJS_directives_Q7','<p>Qu''est-ce qui est utilisé pour lier dynamiquement un ou plusieurs attributs, ou une propriété de composant à une expression?</p>',853),
	 (1388,'OCP11_CHAP1_Fichier','<p>Le code ci-dessous est-il valide ?</p><pre><code class="language-java">1: public class Humain { 
2: } 
3: 
4: public class Homme extends Humain { 
5: } 
6: 
7: public class Femme extends Humain { 
8: }&nbsp;</code></pre>',8),
	 (1389,'OCP11_CHAP1_Fichier_2','<p>Le code ci-dessous est-il valide ?</p><pre><code class="language-java">1: public class Humain { 
2: } 
3: 
4: class Homme extends Humain { 
5: } 
6: 
7: class Femme extends Humain { 
8: }&nbsp;</code></pre>',8),
	 (1390,'OCP11_CHAP1_Main','<p>Quelles définitions de méthodes main() sont valides ?</p>',8),
	 (1391,'OCP11_CHAP1_Main_2','<p>En exécutant la commande suivante : `javac Main.java; java Main caillou 18 "Je suis ton père !"` Quel sera le résultat de l''exécution du code suivant ?</p><pre><code class="language-java">1: public class Main { 
2:   public void main(String[] args) { 
3:     for (int i = 0; i &lt; args.length; i++) { 
4:       System.out.print(args[i] + " "); 
5:     } 
6:   } 
7: }&nbsp;</code></pre>',8);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1392,'OCP11_CHAP1_Parametres','<p>En exécutant la commande suivante : `javac Main.java; java Main caillou 18 "Je suis ton père !"` Quel sera le résultat de l''exécution du code suivant ?</p><pre><code class="language-java">1: public class Main { 
2:   public static void main(String[] args) { 
3:     for (int i = 0; i &lt; args.length; i++) { 
4:       System.out.print(args[i] + " "); 
5:     } 
6:   } 
7: }&nbsp;</code></pre>',8),
	 (1393,'OCP11_CHAP1_Commande','<p>D''après le code suivant, quelles sont les lignes commandes valides qui permettront d''afficher "Bonjour monsieur le ministre" ?</p><pre><code class="language-java">1: public class Main { 
2:   public static void main(String... args) { 
3:     System.out.println("Bonjour " + args[0]); 
4:   } 
5: } </code></pre>',8),
	 (1404,'ECMAScript_ES6Features_11','<p>Quel protocole d''itération introduit par ES6 permet de personnaliser la façon dont les valeurs d''un objet JS sont parcouru?</p>',18),
	 (1407,'ECMAScript_ES6Features_12','<p>Que doit contenir un objet pour que celui-ci soit conforme au protocole itérateur?</p>',18),
	 (1416,'ECMAScript_ES6Features_13','<p>Dans quels fonctions peut-on trouver le mot-clé yield ?</p>',18),
	 (1417,'ECMAScript_ES6Features_14','<p>Dans un générateur, comment peut on retourner une valeur?</p>',18),
	 (1418,'ECMAScript_ES6Features_15','<p>Comment définit-on un générateur?</p>',18),
	 (1428,'ECMAScript_ES6Features_16','<p>Quel est la différence entre les export nommés et les export par défaut?</p>',18),
	 (1435,'ECMAScript_ES6Features_17','<p>Quels sont les trois termes clés utilisé dans le design pattern Proxy?</p>',18),
	 (1438,'OCP11_CHAP1_Review_13','<p>Quelles options sont valides avec la commande java (hors modules) ?</p>',8);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1439,'OCP11_CHAP1_Review_14','<p>Quelles options sont valides avec la commande jar (hors modules) ?</p>',8),
	 (1440,'ECMAScript_ES6Features_18','<p>Quels sont les use-cases principaux de l''objet Proxy de ES6?</p>',18),
	 (1441,'ECMAScript_ES6Features_19','<p>Quel autre objet rajouté par ES6 est souvent utilisé en conjonction des proxy?</p>',18),
	 (1442,'SPRING_AOP_1','<p>AOP fait partie de Core Container dans le Framework Spring?</p>',154),
	 (1443,'SPRING_AOP_2','<p>Qu’est ce qu’un AOP proxy ?</p>',154),
	 (1444,'SPRING_AOP_3','<p>Dans le Spring framework, le proxy AOP est __</p>',154),
	 (1445,'SPRING_AOP_4','<p>Par défaut Spring AOP utilise pour son AOP proxy:</p>',154),
	 (1446,'SPRING_AOP_5','<p>Quelle signifie l''abréviation AOP?</p>',154),
	 (1447,'SPRING_AOP_6','Remplissez. ______ est un point dans l''exécution d''un programme auquel un comportement supplémentaire peut être inséré à l''aide d''AOP.',154),
	 (1449,'SPRING_AOP_8','Parmis les choix suivants, lesquels sont corrects à propos du proxy AOP?',154);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1451,'SPRING_AOP_10','Parmi les choix suivants, lequel est correct à propos du support Spring AOP?',154),
	 (1455,'SPRING_AOP_14','En utilisant le framework Spring AOP, quel est la visibilité des méthodes qui correspondent au join point: 
@Pointcut(“execution(* *(..))”)
private void anyOperation() {}; 
',154),
	 (1456,'SPRING_AOP_15','Si on utilise le framework Spring AOP, quelles sont les méthodes join point des expressions point cut suivant ?
execution(public * *(..))',154),
	 (1485,'VueJS_lifecycle_Q3','<p>Quel est le bon ordre d''exécution de ces hooks de composant ?</p>',827),
	 (1486,'VueJS_directives_Q8','<p>Quelle directive est utilisée pour établir une liaison bidirectionnelle ?</p>',837),
	 (1487,'VueJS_directives_Q9','<p>Une image est-elle chargée par le navigateur lorsqu''elle est "masquée" par v-show ?</p>',833),
	 (1488,'VueJS_directives_Q10','<p>Quelle directive est utilisée pour attacher des écouteurs d''événement qui invoquent des méthodes ?</p>',832),
	 (1489,'VueJS_directives_Q11','<p>La directive v-model est utilisée en ... ?</p>',837),
	 (1498,'VueJS_directives_Q12','<p>Peut-on utiliser la directive v-if dans un élément &lt;template&gt;</p>',833),
	 (1500,'VueJS_directives_Q13','<p>Que doit-on utiliser si on a besoin de permuter quelque chose très souvent ?</p>',833);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1501,'VueJS_directives_Q14','<p>Que doit-on utiliser si la condition ne change probablement pas à l''exécution ?</p>',833),
	 (1506,'VueJS_directives_Q15','<p>Peut-on utiliser v-else avec v-show ?</p>',833),
	 (1511,'VueJS_directives_Q16','<p>Est-ce une bonne pratique d''utiliser v-for et v-if ensemble ?</p>',834),
	 (1521,'ECMAScript_ES7+Features_1','<p>Soit base et exponent deux nombres. Comment peut-on écrire en JS depuis ES7 (ES2016) base^exponent</p>',19),
	 (1522,'ECMAScript_ES7+Features_2','<p>Quel est le résultat du code suivant: let c = 2; c **=3</p>',19),
	 (1523,'ECMAScript_ES7+Features_3','<p>Soit array un tableau de variable. Depuis ES7, comment peut-on vérifier qu''une valeur val appartient à ce tableau?</p>',19),
	 (1524,'ECMAScript_ES7+Features_4','<p>Quel code retourne true suite à la définition suivante: const array = [0, 1]</p>',19),
	 (1525,'ECMAScript_ES7+Features_5','<p>Dans quelle version d''ECMAScript a été introduit la syntaxe async/await ?</p>',19),
	 (1528,'ECMAScript_ES7+Features_6','<p>Quel est l''intérêt d''utiliser la syntaxe async await par rapport aux promesses?</p>',19),
	 (1530,'ECMAScript_ES7+Features_7','<p>Soit ma_fonction une fonction asynchrone. Quelle est la différence entre: return ma_fonction(); et return await ma_fonction();</p>',19);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1534,'ECMAScript_ES7+Features_8','<p>Quelle est la bonne pratique pour gérer les erreurs d''une fonction asynchrone qui utilise async await?</p>',19),
	 (1535,'ECMAScript_ES7+Features_9','<p>Si maFonction est une fonction asynchrone, et retourne un objet après une seconde, que vaut c à l''execution: const c = maFonction();</p>',19),
	 (1584,'VueJS_directives_Q17','<p>Dans quels cas peut-on utiliser la directive v-for ? (plusieurs réponses possibles)</p>',834),
	 (1588,'VueJS_directives_Q18','<p>Quelle est la bonne manière d''écrire une boucle for en Vue sachant que items est un tableau de données ?</p>',834),
	 (1589,'VueJS_directives_Q19','<p>Quelle est la bonne manière d''écrire une boucle for en Vue sachant que object est un objet ?</p>',834),
	 (1590,'VueJS_directives_Q20','<p>Que va afficher : {{ n }} ?</p>',834),
	 (1603,'VueJS_bases_Q9','<p>Qui a créé Vue.js ?</p>',3),
	 (1604,'ECMAScript_ES7+Features_10','<p>Quelle API introduite par ES8 permet d''obtenir un array des valeurs d''un objet?</p>',19),
	 (1605,'ECMAScript_ES7+Features_11','<p>Quelle API introduite par ES8 permet d''obtenir un array à la fois des clés et des valeurs d''un objet?</p>',19),
	 (1606,'VueJS_bases_Q10','<p>Est-ce que Vue.js utilise le DOM virtuel ?</p>',3);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1607,'VueJS_directives_Q34','<p>Quel est la technique pour envoyer des événements à des composants qui n''ont pas de lien de parenté ?</p>',829),
	 (1608,'ECMAScript_ES7+Features_12','<p>Quelles sont les propriétés listés par l''API getOwnPropertyDescriptors pour chaque propriété d''un objet?</p>',19),
	 (1609,'VueJS_CLI_Q8','<p>Quelle instruction permet de restreindre la portée des styles au composant lui-même ?</p>',747),
	 (1610,'ECMAScript_ES7+Features_13','<p>Quelle propriété accessible via l''API getOwnPropertyDescriptors est accessible plus facilement?</p>',19),
	 (1611,'ECMAScript_ES7+Features_14','<p>Pour que le descripteur writable fonctionne et envoie une erreur si l''on essaie d''éditer une propriété qui a writable à false, il faut utiliser le mode strict</p>',19),
	 (1612,'ECMAScript_ES7+Features_15','<p>Quels descripteurs peuvent être changé sur une propriété si configurable est à false avec defineProperty?</p>',19),
	 (1613,'ECMAScript_ES9+Features_1','<p>Dans quel version d''ES Promise.prototype.finally() a-t''il été introduit?</p>',20),
	 (1618,'ECMAScript_ES9+Features_2','<p>Soit asyncFunction() une fonction asynchrone qui throw une erreur avant de se résoudre. Sur le code suivant, dans quelle ordre apparait les lettres?&nbsp;</p><pre><code class="language-javascript">asyncFunction()
	.then(() =&gt; console.log("A"))
	.catch(() =&gt; console.log("B"))
	.finally(() =&gt; console.log("C"))</code></pre>',20),
	 (1637,'VueJS_directives_Q21','<p>Quelle variable spéciale contient l''événement natif attrapé par v-on ?</p>',835),
	 (1638,'VueJS_directives_Q22','<p>Quel modificateur peut-on utiliser sur une directive v-on pour ne déclencher que si l''événement provient du composant lui-même ?</p>',832);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1639,'VueJS_directives_Q23','<p>Quel modificateur d''événement sera utilisé si nous voulons exécuter l''événement click uniquement une fois ?</p>',832),
	 (1640,'VueJS_directives_Q24','<p>Quel modificateur d''événement est utilisé pour empêcher uniquement les clics sur l''élément lui-même ?</p>',832),
	 (1691,'ECMAScript_ES9+Features_3','<p>Quel type d''objet peut être iterableObject dans ce code?</p><pre><code class="language-plaintext">    for await (const chunk of iterableObject) {
      console.log(chunk)
    }</code></pre>',20),
	 (1692,'ECMAScript_ES9+Features_4','<p>Quels sont les propriétés d''un objet itérable asynchrone?</p>',20),
	 (1693,'ECMAScript_ES9+Features_5','<p>Quels sont les propriétés d''un objet itérable synchrone?</p>',20),
	 (1694,'ECMAScript_ES9+Features_6','<p>Compléter la phrase suivante:</p><p>&nbsp;</p><p>Les itérateurs […] peuvent être itéré via for…of et for await…of tandis que les itérateurs […] ne peuvent être itéré que via for await…of</p>',20),
	 (1695,'ECMAScript_ES9+Features_7','<p>Quelle fonction native à javascript introduite par ES10 permet de créer un tableau contenant la concaténation des éléments des sous-tableaux du tableau passé?</p>',20),
	 (1696,'ECMAScript_ES9+Features_8','<p>Comment utiliser flat une seule fois pour supprimer les sous-tableaux du tableau suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">[1, 2, [3, 4, [5, 6]]]</code></pre>',20),
	 (1697,'ECMAScript_ES9+Features_9','<p>Que retourne le code suivant?&nbsp;</p><p>&nbsp;</p><pre><code class="language-javascript">const entries = new Map([
  [''foo'', ''bar''],
  [''baz'', 42]
]);

const obj = Object.fromEntries(entries);

console.log(obj)</code></pre>',20),
	 (1698,'ECMAScript_ES9+Features_10','<p>Quel types de paramètres peut on donner à Object.fromEntries pour obtenir un objet?</p>',20);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1699,'ECMAScript_ES9+Features_11','<p>Depuis ES10, lesquels de ces propositions sont corrects?</p>',20),
	 (1746,'VueJS_router_Q1','<p>Est-ce que Vue-router est inclus lors de l''installation de Vue ?</p>',850),
	 (1762,'VueJS_router_Q2','<p>Quelle instruction permet de router vers une autre vue ?</p>',850),
	 (1766,'VueJS_router_Q3','<p>L''application doit pouvoir rendre le nom d''un utilisateur sur la base de l''URL. Mais ça ne fonctionne pas comme souhaité actuellement. Pourquoi ?</p>',850),
	 (1767,'VueJS_router_Q4','<p>Lorsque l''utilisateur clique sur le lien "À propos", cela déclenche un rafraîchissement de la page entière. Quel élément du Vue Router devrait être utilisé à la place pour éviter ce comportement ?</p>',850),
	 (1768,'VueJS_router_Q5','<p>Comment peut-on récupérer le paramètre "id" d''une URL interprétée par le routing "document/:id" ?</p>',850),
	 (1769,'ECMAScript_ES9+Features_12','<p>Que retourne le code suivant?</p><pre><code class="language-javascript">function sayHello(text){
  const name = text;
  //print name
  console.log(`Hello ${name}`)
}

console.log(sayHello.toString());</code></pre>',20),
	 (1770,'ECMAScript_ES9+Features_13','<p>Que retourne le code suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">class A { a(){return 1} }

console.log(A.toString())</code></pre>',20),
	 (1771,'ES11Features_1','<p>Que vaut duration?</p><p>&nbsp;</p><pre><code class="language-javascript">const a = { duration: 50 };

a.duration ??= 10;</code></pre>',21),
	 (1772,'ES11Features_2','<p>Que vaut speed?</p><p>&nbsp;</p><pre><code class="language-javascript">const a = { duration: 50 };

a.speed ??= 25;
</code></pre>',21);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1773,'ES11Features_3','<p>Que vaut speed?</p><p>&nbsp;</p><pre><code class="language-javascript">const a = { duration: 50, speed: null };

a.speed ??= 25;
</code></pre>',21),
	 (1774,'ES11Features_4','<p>Comment modifier la dernière ligne de ce code pour qu''il n''y ait pas d''erreurs et ?</p><p>&nbsp;</p><pre><code class="language-javascript">const adventurer = {
  name: ''Alice'',
  cat: {
    name: ''Dinah''
  }
};

console.log(adventurer.dog.name);</code></pre>',21),
	 (1775,'ES11Features_5','<p>Peut-on créer des variables privés en Javascript?</p>',21),
	 (1779,'OCP11_CHAP_17_Review_4','<p>Quelles propositions sont correctes ?</p>',8),
	 (1813,'OCP_CHAP9_5','<p>Admettons que /kang existe en tant que lien symbolique pour le répertoire /mammal/kangaroo dans le système de fichiers. Quelles affirmations à propos du code suivant sont correctes ? (Plusieurs réponses possibles)&nbsp;</p><p>&nbsp;</p><pre><code class="language-plaintext">Path path = Paths.get("/kang");
if(Files.isDirectory(path) &amp;&amp; Files.isSymbolicLink(path))
Files.createDirectory(path.resolve("joey"));</code></pre>',333),
	 (1834,'ES11Features_6','<p>Quelle est la différence entre Promise.all et Promise.allSettled?</p>',21),
	 (1845,'ES11Features_7','<p>Que s''affichera dans la console après l''execution du code suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">const promise1 = Promise.resolve(3);
const promise2 = new Promise((resolve, reject) =&gt; setTimeout(reject, 100, ''foo''));

Promise.allSettled([promise1, promise2]).then(console.dir).catch(console.log);</code></pre>',21),
	 (1848,'VueJS_router_Q6','<p>Quel est le mode par défaut de Vue router ?</p>',850),
	 (1850,'ES11Features_8','<p>Dans un module, quel sera le résultat de l''execution du code suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">await Promise.resolve(console.log(''finished waiting''));</code></pre>',21),
	 (1851,'ES11Features_9','<p>Dans un code type commonJS, quel sera le résultat de l''execution du code suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">await Promise.resolve(console.log(''finished waiting''));</code></pre>',21);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2008,'OCA - Chapter 1 - 1','<p>Which of the following method signatures is a valid declaration of an entry point in a<br>Java application?</p>',483),
	 (2009,'OCA - Chapter 1 - 2','<p>What is the proper filename extension for a Java bytecode compiled file?</p>',487),
	 (2010,'OCA - Chapter 1 - 4','<p>Given that a Date class exists in both the java.util and java.sql packages, what is the<br>result of compiling the following class?<br>&nbsp;</p><pre><code class="language-java">1: import java.util.*;
2: import java.sql.*;
3: public class BirthdayManager {
4: private Date rob = new Date();
5: private java.util.Date sharon = new java.util.Date();
6: }</code></pre>',586),
	 (2011,'OCA - Chapter 1 - 5','<p>Which of the following is not a facet of traditional object-oriented programming languages?</p>',591),
	 (2012,'OCA - Chapter 1 - 6','<p>Which variables have a scope limited to a method?</p>',529),
	 (2013,'OCA - Chapter 1 - 7','<p>Which package is imported into every Java class by default?</p>',585),
	 (2014,'OCA - Chapter 1 - 8','<p>Which of the following is not a valid code comment in Java?</p>',523),
	 (2015,'OCA - Chapter 1 - 9','<p>Which statement about a valid .java file is true?</p>',526),
	 (2016,'OCA - Chapter 1 - 10','<p>Given the following application, fill in the missing values in the table starting from the<br>top and going downward.</p><p>&nbsp;</p><pre><code class="language-java">package competition;
public class Robot {
	static String weight = "A lot";
	/* default */ double ageMonths = 5, ageDays = 2;
	private static boolean success = true;
	public void main(String[] args) {
		final String retries = "1";
		// P1
	}
}</code></pre><p>Variable Type &nbsp;| Number of Variables Accessible at P1, without instantiating a Robot object<br>Class | _______<br>Instance | _______<br>Local | _______</p><p>&nbsp;</p>',529),
	 (2017,'OCA - Chapter 1 - 11','<p>Which statement about import statements is true?</p>',579);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2018,'OCA - Chapter 1 - 12','<p>What is the result of compiling and executing the following class?<br>&nbsp;</p><pre><code class="language-java">1: public class ParkRanger {
2:   int birds = 10;
3:   public static void main(String[] data) {
4:     int trees = 5;
5:     System.out.print(trees+birds);
6:   }
7: }</code></pre>',551),
	 (2019,'OCA - Chapter 1 - 13','<p>Which statements about Java are true?<br>I. The java command can execute .java and .class files.<br>II. Java is not object oriented.<br>III. The javac command compiles directly into native machine code.</p>',501),
	 (2020,'OCA - Chapter 1 - 14','<p>Which of the following lines of code is not allowed as the first line of a Java class file?</p>',581),
	 (2021,'OCA - Chapter 1 - 15','<p>Which one of the following statements is true about using packages to organize your code in Java?</p>',580),
	 (2022,'OCA - Chapter 1 - 16','<p>Given that the current directory is /user/home, with an application Java file in /user/home/Manager.java that uses the default package, which are the correct commands to compile and run the application in Java?</p>',481),
	 (2023,'OCA - Chapter 1 - 17','<p>Structuring a Java class such that only methods within the class can access its instance variables is referred to as _______.</p>',591),
	 (2024,'OCA - Chapter 1 - 18','<p>What is the output of the following code snippet?</p><pre><code class="language-java">String tree = "pine";
int count = 0;
if (tree.equals("pine")) {
	int height = 55;
	count = count + 1;
}
System.out.print(height + count);</code></pre>',529),
	 (2025,'OCA - Chapter 1 - 19','<p>Which of the following is true of a Java bytecode file ?</p>',596),
	 (2026,'OCA - Chapter 1 - 20','<p>What is the correct character for terminating a statement in Java?</p>',493),
	 (2027,'OCA - Chapter 1 - 21','<p>What is the result of compiling and executing the following class?</p><pre><code class="language-java">1: public class Tolls {
2:     private static int yesterday = 1;
3:     int tomorrow = 10;
4:     public static void main(String[] args) {
5:         Tolls tolls = new Tolls();
6:         int today=20, tomorrow = 40;
7:         System.out.print(today + tolls.tomorrow + tolls.yesterday);
8:     }
9: }</code></pre>',564);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2028,'OCA - Chapter 1 - 22','<p>Given the following class definition, which is the only line that does not contain a compilation error?</p><pre><code class="language-java">1: public ThisClassDoesNotCompile {
2:   double int count;
3:   void errors() {}
4:   static void private limit; }</code></pre>',557),
	 (2029,'OCA - Chapter 1 - 23','<p>Which of the following features allows a Java class to be run on a wide variety of computers and devices?</p>',592),
	 (2030,'OCA - Chapter 1 - 24','<p>Which of the following is not a property of a JVM?</p>',486),
	 (2031,'OCA - Chapter 1 - 25','<p>Which of the following variables are always in scope for the entire program?</p>',529),
	 (2032,'OCA - Chapter 1 - 26','<p>Given the following wildcard import statements, which class would be included in the import?</p><p>&nbsp;</p><pre><code class="language-java">import television.actor.*;
import movie.director.*;</code></pre>',583),
	 (2033,'OCA - Chapter 1 - 27','<p>Which is the correct order of statements for a Java class file?</p>',581),
	 (2034,'OCA - Chapter 1 - 28','<p>Given the following class definition, what is the maximum number of import statements that can be discarded and still have the code compile? For this question, assume that the Blackhole class is defined only in the stars package.</p><pre><code class="language-java">package planetarium;
import java.lang.*;
import stars.*;
import java.lang.Object;
import stars.Blackhole;

public class Observer {
	public void find(Blackhole blackhole) {}
}</code></pre>',585),
	 (2035,'OCA - Chapter 1 - 29','<p>Given the following class definition, which command will cause the application to output the message White-tailed?</p><pre><code class="language-java">package forest;
public class Deer {
	public static void main(String... deerParams) {
		System.out.print(theInput[2]);
	}
}</code></pre>',492),
	 (2036,'OCA - Chapter 1 - 30','<p>Which of the following is a true statement?</p>',481),
	 (2037,'OCA - Chapter 1 - 31','<p>Which of the following statements about Java is true?</p>',591);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2038,'OCA - Chapter 1 - 32','<p>Given the following code, what values inserted in order into the blank lines, allow the code to compile?</p><pre><code class="language-java">_______agent;
public _______Banker {
	private static _______getMaxWithdrawal() {
		return 10;
	}
}</code></pre>',581),
	 (2039,'OCA - Chapter 1 - 33','<p>What is the output of the following application?</p><pre><code class="language-java">public class Airplane {
	static int start = 2;
	final int end;
	public Airplane(int x) {
		x = 4;
		end = x;
	}
	public void fly(int distance) {
		System.out.print(end-start+" ");
		System.out.print(distance);
	}
	public static void main(String... start) {
		new Airplane(10).fly(5);
	}
}</code></pre>',549),
	 (2040,'OCA - Chapter 1 - 34','<p>What is one of the most important reasons that Java supports extending classes via inheritance?</p>',595),
	 (2041,'OCA - Chapter 1 - 35','<p>Which of the following is a valid code comment in Java?</p>',523),
	 (2042,'OCA - Chapter 1 - 36','<p>Which of the following method signatures is not a valid declaration of an entry point in a Java application?</p>',483),
	 (2043,'OCA - Chapter 1 - 37','<p>Given the file Magnet.java below, which of the marked lines can you independently insert the line public String color; into and still have the code compile?</p><pre><code class="language-java">// line a1
public class Magnet {
	// line a2
	public void attach() {
		// line a3
	}
	// line a4
}</code></pre>',529),
	 (2044,'OCA - Chapter 1 - 38','<p>What is required to define a valid Java class file?</p>',581),
	 (2045,'OCA - Chapter 1 - 39','<p>What is the proper filename extension for a Java source file?</p>',485),
	 (2046,'OCA - Chapter 1 - 40','<p>Given that a Math class exists in both the java.lang and pocket.complex packages, what is the result of compiling the following class?</p><pre><code class="language-java">1: package pocket;
2: import pocket.complex.*;
3: import java.util.*;
4: public class Calculator {
5:   public static void main(String[] args) {
6:     System.out.print(Math.floor(5));
7:   }
8: }</code></pre>',586),
	 (2047,'OCA - Chapter 1 - 41','<p>Given a class that uses the following import statements, which class would not be automatically accessible within the class without using its full package name?</p><pre><code class="language-java">import dog.*;
import dog.puppy.*;</code></pre>',583);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2048,'OCA - Chapter 1 - 42','<p>_______is the technique of structuring programming data as a unit consisting of attributes, with actions defined on the unit.</p>',591),
	 (2049,'OCA - Chapter 1 - 43','<p>Given the following class definition, what is the maximum number of import statements that can be discarded and still have the code compile? For this question, assume that the Broccoli class is in the food.vegetables package, and the Apple class is the food.fruit package.</p><pre><code class="language-java">package food;
import food.vegetables.*;
import food.fruit.*;
import java.util.Date;
public class Grocery {
  Apple a; Broccoli b; Date c;
}</code></pre>',585),
	 (2050,'OCA - Chapter 1 - 44','<p>Given the following application, what is the expected output?</p><pre><code class="language-java">public class Keyboard {
	private boolean numLock = true;
	static boolean capLock = false;
	public static void main(String... shortcuts) {
		System.out.print(numLock+" "+capLock);
	}
}</code></pre>',564),
	 (2051,'OCA - Chapter 1 - 45','<p>What is the result of compiling and executing the following class?<br>&nbsp;</p><pre><code class="language-java">public class RollerSkates {
	static int wheels = 1;
	int tracks = 5;
	public static void main(String[] arguments) {
		RollerSkates s = new RollerSkates();
		int feet=4, tracks = 15;
		System.out.print(feet + tracks + s.wheels);
	}
}</code></pre>',529),
	 (2052,'OCA - Chapter 1 - 46','<p>What is the result of compiling and executing the following class?</p><pre><code class="language-java">package sports;
public class Bicycle {
	String color = "red";
	private void printColor(String color) {
		color = "purple";
		System.out.print(color);
	}
	public static void main(String[] rider) {
		new Bicycle().printColor("blue");
	}
}</code></pre>',565),
	 (2053,'OCA - Chapter 1 - 47','<p>Which statements about calling the compilation command javac and the execution command java are true?</p><p><br>I. java may use a period . to separate packages.<br>II. javac takes a .java file and returns a .class file.<br>III. java may use a slash (/) to separate packages.</p>',485),
	 (2054,'OCA - Chapter 1 - 48','<p>What is the result of compiling and executing the following application?</p><pre><code class="language-java">package forecast;
public class Weather {
	private static boolean heatWave = true;
	public static void main() {
		boolean heatWave = false;
		System.out.print(heatWave);
	}
}</code></pre>',483),
	 (2055,'OCA - Chapter 1 - 50','<p>Which statement about the JVM is true?</p>',486),
	 (2119,'VueJS_directives_Q25','<p>Quelle ligne doit-on utiliser pour que rawHtml soit interprété en tant que HTML ?</p><p>&nbsp;</p><pre><code class="language-plaintext">rawHtml: ''&lt;span style="color:red"&gt;Rouge&lt;/span&gt;''</code></pre>',832),
	 (2120,'VueJS_directives_Q26','<p>Quelle ligne doit-on utiliser pour que rawHtml soit interprété en tant que texte brut et non en tant que HTML ?</p><p>&nbsp;</p><pre><code class="language-plaintext">rawHtml: ''&lt;span style="color:red"&gt;Rouge&lt;/span&gt;''</code></pre>',832);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2154,'VueJS_directives_Q27','<p>Qu''est-ce qui est affiché suite à l''exécution de ce code ?</p><p>&nbsp;</p><pre><code class="language-plaintext">new Vue({
	el: ''#app'',
  	data: {
		movieTitle: ''The Matrix''
  	}
});</code></pre><pre><code class="language-plaintext">&lt;div id="app"&gt;
  &lt;h1 v-once&gt;{{ movieTitle }}&lt;/h1&gt;
  
  &lt;button v-on:click="movieTitle = ''The Matrix Reloaded''"&gt;Change Movie Title&lt;/button&gt;
&lt;/div&gt;</code></pre><p>&nbsp;</p>',835),
	 (2220,'OCA - Chapter 6 - Custom Question 6','<p>What is the result of the following code?</p><pre><code class="language-java">public class Modem {
	private String host;
	private int port;
	public Modem(String host, int port) {
		this.host = host;
		this.port = port;
	}
	public static void dial() {
		Modem m = new Modem("excilys.com",443);
		m.connect();
		System.out.println("Connected to Oxyl");
	}
	public void connect() throws IOException {
		Socket soc = new Socket();
		try {
			soc.connect(new InetSocketAddress(host, port), 1518);
		} catch( IOException exc ) {
			System.out.println("Z");
		} finally {
			soc.close();
			System.out.println("A");
		}
} }</code></pre>',63),
	 (2233,'OCA - Chapter 6 - Question 8','<p>What can be done to get the following code to compile and run? (Assume that the options are independent of each other. Choose all that apply)</p><pre><code class="language-java">public float parseFloat( String s ){
	float f = 0.0f; // 1
	try{
		f = Float.valueOf( s ).floatValue(); // 2
		return f ; // 3
	} catch(NumberFormatException nfe){
		f = Float.NaN ; // 4
		return f; // 5
	} finally {
		return f; // 6
	}
	return f ; // 7
}</code></pre>',63),
	 (2303,'OCP - Chapter 4 - enthuware.ocpjp.v8.2.1791','<p>Identify correct statements about the following code: (select 1 responce)&nbsp;</p><pre><code class="language-java">List&lt;String&gt; vals = Arrays.asList("a", "b");
String join = vals.parallelStream().reduce("_", (a, b)-&gt;a.concat(b));
System.out.println(join);</code></pre>',12),
	 (2563,'OCP - Chapter 8 - Q_5','<p>Given the following code:</p><pre><code class="language-java">public class Data implements java.io.Serializable{
	public static String f1;
	public static transient int f2;
	public transient boolean f3;
	public final static String f4 = "4";
	public String f5 = "5";
	
	public static void main(String[] args) {
		Data d = new Data();
		d.f1 = "f1";
		d.f2 = 2;
		d.f3 = true;
	}
}</code></pre><p>Which fields of the above class will have the same values when the object referred to by the variable ''d'' is serialized and deserialized in another JVM?</p>',16),
	 (2707,'OCA - Chapter 4 - Custom3','<p>What is the output of the following code?</p><pre><code class="language-java">import java.util.*;
import java.util.function.*;
public class Employee {
	private static String name;
	public Employee(String name) { this.name = name; }
	public Boolean canBePromoted() {
		return this.name.equals("Jean-Charles");
	}
}

class EmployeePromoted {
	private static void print(List employees, Predicate checker) {
		for (Employee employee : employees) {
			System.out.print(checker.test(employee));
		}
	}
	public static void main(String[] args) {
		List employees = new ArrayList&lt;&gt;();
		employees.add(new Employee("Jean-Charles"));
		employees.add(new Employee("Jean-Eudes"));
		print(employees, e -&gt; e.canBePromoted());
	}
}</code></pre>',61),
	 (2711,'OCA - Chapter 4 - Q18 : Creating Constructors','<p>Which of the following are true?</p>',61),
	 (2713,'OCA - Chapter 4 - Q20 : New object and This()','<p>Which code can be inserted to have the code print 2?</p><pre><code class="language-java">public class BirdSeed {
	private int numberBags;
	boolean call;
	public BirdSeed() {
		// LINE 1
		call = false;
		// LINE 2
	}
	public BirdSeed(int numberBags) { this.numberBags = numberBags; }
	public static void main(String[] args) {
		BirdSeed seed = new BirdSeed();
		System.out.println(seed.numberBags);
	}
}</code></pre>',61),
	 (2742,'OCP - Chapter 6 - Question 1','<p>Which of the following pairs fills in the blanks to make this code compile?</p><pre><code class="language-java">5: public void read() ___________ SQLException {
6: ___________ new SQLException();
7: }</code></pre>',14);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2775,'OCP - Chapter 6 - Question 6','<p>What is the output of the following code?</p><pre><code class="language-java">import java.io.*;
public class AutocloseableFlow {
	static class Door implements AutoCloseable {
		public void close() {
			System.out.print("D");
			throw new RuntimeException();
		}
	}
	static class Window implements Closeable {
		public void close() {
			System.out.print("W");
			throw new RuntimeException();
		}
	}
	public static void main(String[] args) {
		try { Door d = new Door(); Window w = new Window() } {
			System.out.print("T");
		} catch (Exception e) {
			System.out.print("E");
		} finally { System.out.print("F"); }
} }</code></pre>',14),
	 (2791,'OCP - Chapter 6 - E1Q27 (Red : 6S0GG106173)','<p>What is the output of the following code?</p><pre><code class="language-java">import java.io.*;
public class AutocloseableFlow {
	static class Door implements AutoCloseable {
		public void close() { System.out.print("D"); }
	}
	static class Window implements Closeable {
		public void close() { System.out.print("W"); }
	}
	public static void main(String[] args) {
		try (Door d = new Door(); Window w = new Window()) {
			System.out.print("T");
		} catch (Exception e) {
			System.out.print("E");
		} finally { System.out.print("F"); }
} }</code></pre>',14),
	 (2795,'OCP - Chapter 6 - E3Q14 (Ref : 6S0GG106280)','<p>What is the output of the following code?</p><pre><code class="language-java">import java.io.*;
public class AutocloseableFlow {
	static class Door{
		public void close() { System.out.print("D"); }
	}
	static class Window {
		public void close() { System.out.print("W"); }
	}
	public static void main(String[] args) {
		try (Door d = new Door(); Window w = new Window()) {
			System.out.print("T");
			throw new RuntimeException();
		} catch (Exception e) {
			System.out.print("E");
		} finally { System.out.print("F"); }
} }</code></pre>',14),
	 (2813,'OCP - Chapter 6 - Q20 (Ref : 6S0GG106166)','<p>What is the output of the following code?</p><pre><code class="language-java">import java.io.*;
public class AutocloseableFlow {
	static class Door implements AutoCloseable {
		public void close() {
			System.out.print("D");
			throw new RuntimeException();
		}
	}
	static class Window implements Closeable {
		public void close() {
			System.out.print("W");
			throw new RuntimeException();
		}
	}
	public static void main(String[] args) {
		try (Door d = new Door(); Window w = new Window()) {
			System.out.print("T");
			throw new RuntimeException();
		} catch (Exception e) {
			System.out.print("E");
		} finally { System.out.print("F"); }
} }</code></pre>',14),
	 (2814,'OCP - Chapter 6 - Q27 (Red : 6S0GG106173)','<p>What is the output of the following code?</p><pre><code class="language-java">import java.io.*;
public class AutocloseableFlow {
	static class Door implements AutoCloseable {
		public void close() { System.out.print("D"); }
	}
	static class Window implements Closeable {
		public void close() { System.out.print("W"); }
	}
	public static void main(String[] args) {
		try (Door d = new Door(); Window w = new Window()) {
			System.out.print("T");
		} catch (Exception e) {
			System.out.print("E");
		} finally { System.out.print("F"); }
} }</code></pre>',14),
	 (2836,'OCA - Chapter 3 - JavaDataTypes_Q1','Which of the following declarations does not compile?',60),
	 (2837,'OCA - Chapter 3 - JavaDataTypes_Q2','<p>Which of the following is not a valid class declaration ?</p>',60),
	 (2838,'OCA - Chapter 3 - JavaDataTypes_Q3','<p>Which converts a primitive to a wrapper class object without using autoboxing ?</p>',60),
	 (2839,'OCA - Chapter 3 - JavaDataTypes_Q4','<p>How do you force garbage collection to occur at a certain point ?</p>',60),
	 (2840,'OCA - Chapter 3 - JavaDataTypes_Q5','<p>Which of the following does not compile ?</p>',60);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2841,'OCA - Chapter 3 - JavaDataTypes_Q6','<p>Which best describes what the "new" keyword does ?</p>',60),
	 (2842,'OCA - Chapter 3 - JavaDataTypes_Q7','<p>Which of the following lists of primitive numeric types is presented in order from smallest to largest data type ?</p>',60),
	 (2843,'OCA - Chapter 3 - JavaDataTypes_Q8','<p>Suppose foo is a reference to an instance of a class. Which of the following is not true about foo.bar ?</p>',60),
	 (2844,'OCA - Chapter 3 - JavaDataTypes_Q9','<p>Which two primitives have wrapper classes that are not merely the name of the primitive with an uppercase letter?</p>',60),
	 (2845,'OCA - Chapter 3 - JavaDataTypes_Q10','<p>Which of the following is not a wrapper class?</p>',60),
	 (2846,'OCA - Chapter 3 - JavaDataTypes_Q11','<p>Which statement is true about primitives?</p>',60),
	 (2847,'OCA - Chapter 3 - JavaDataTypes_Q12','<p>Which of these class names best follows standard Java naming conventions?</p>',60),
	 (2848,'OCA - Chapter 3 - JavaDataTypes_Q13','<p>Which of the following is true about String instance variables?</p>',60),
	 (2849,'OCA - Chapter 3 - JavaDataTypes_Q14','<p>Which of the following is true about primitives?</p>',60),
	 (2850,'OCA - Chapter 3 - JavaDataTypes_Q15','<p>Which is correct about an instance variable of type String ?</p>',60);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2851,'OCA - Chapter 3 - JavaDataTypes_Q16','<p>Which of the following is a wrapper class?</p>',60),
	 (2852,'OCA - Chapter 3 - JavaDataTypes_Q17','<p>Which of the following is not a valid variable name?</p>',60),
	 (2853,'OCA - Chapter 3 - JavaDataTypes_Q18','<p>What is true of the finalize() method?</p>',60),
	 (2855,'OCA - Chapter 3 - JavaDataTypes_Q20','<p>Which of the following lists of primitive types are presented in order from smallest to largest data type?</p>',60),
	 (2856,'OCA - Chapter 3 - JavaDataTypes_Q21','<p>Which of the following is not a valid order for elements in a class?</p>',60),
	 (2857,'OCA - Chapter 3 - JavaDataTypes_Q22','<p>Which is correct about a local variable of type String?</p>',60),
	 (2910,'OCA - Chapter 3 - Custom3','<p>Which of the following are valid differences between creating Dates in Java 7 (and earlier) and Java 8? (Choose all that apply)</p>',60),
	 (2945,'OCP - Chapter 7 - Enthuware-Question 1104','<p>Consider the following code:&nbsp;</p><pre><code class="language-java">public class Student {
	private Map marksObtained = new HashMap();
	private ReadWriteLock lock = new ReentrantReadWriteLock();
	public void setMarksInSubject(String subject, Integer marks){
		// 1 INSERT CODE HERE
		try{ marksObtained.put(subject, marks); }
		finally{ // 2 INSERT CODE HERE } 
	}
	public double getAverageMarks(){ // valid code that computes average }
} </code></pre><p>What should be inserted at //1 and //2?</p>',15),
	 (2946,'OCP - Chapter 7 - Enthuware-Question 1106','<p>Consider the following code: What should be inserted at //1 and //2?</p><pre><code class="language-java">public class Student {
	private Map marksObtained = new HashMap();
	private ReadWriteLock lock = new ReentrantReadWriteLock();
	public void setMarksInSubject(String subject, Integer marks){
		// valid code to set marks for a given subject
	}
	public double getAverageMarks(){
	//1 - INSERT CODE HERE double
	sum = 0.0;
	try{
		for(Integer mark : marksObtained.values()){
			sum = sum + mark;
		}
	return sum/marksObtained.size();
	}finally{ //2 - INSERT CODE HERE }
} }</code></pre>',15),
	 (2952,'OCP - Chapter 7 - Enthuware - Question 1108','<p>You have multiple threads in your application that need to generate random numbers between 1 to 10 (both inclusive) frequently. Which of the following statements would you use considering overhead and contention as the main criteria?</p>',15);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2956,'OCP - Chapter 7 - Enthuware - Question 1138','<p>You have a collection (say, an ArrayList) which is read by multiple reader threads and which is modified by a single writer thread. The collection allows multiple concurrent reads but does not tolerate concurrent read and write. Which of the following strategies will you use to obtain best performance ?</p>',15),
	 (2958,'OCP - Chapter 7 - Enthuware - Question 1080','<p>Given:</p><pre><code class="language-java">public class Counter{
	//1
	public void increment(){
		//2
	}
	//other valid code
}</code></pre><p>This class is supposed to keep an accurate count for the number of times the increment method is called. Several classes share an instance of this class and call its increment method. What should be inserted at //1 and //2?</p>',15),
	 (2960,'OCP - Chapter 7 - Enthuware - Question 1257','<p>Which of the following statements are true regarding the Fork/Join framework?</p>',15),
	 (2962,'OCP - Chapter 7 - Enthuware - Question1078','<p>Consider the following class:</p><pre><code class="language-java">public class Counter {
	private int count;
	public void increment(){
		System.out.println(count++);
	}
}</code></pre><p>If two threads call the increment() method on the same Counter instance simultaneously, which of the following are possible outputs? (Assume that there are no other calls to the Counter instance.)</p>',15),
	 (2986,'OCP - Chapter 1 - Q 17','<p>Consider the code of Test.java file:</p><pre><code class="language-java">package com.udayan.ocp;
class Player {
	String name;
	int age; Player() {
		this.name = "Yuvraj";
		this.age = 36;
	}
	public String toString() { return name + ", " + age; }
	public Class getClass() { return super.getClass(); }
}
public class Test {
	public static void main(String[] args) {
		System.out.println(new Player());
} }</code></pre><p>What will be the result of compiling and executing Test class?</p>',9),
	 (3024,'OCP - Chapter 1 - Q12','<p>Consider below code:&nbsp;</p><pre><code class="language-java">//Child.java package com.udayan.ocp;
class Parent {
	public void m() {
		System.out.println("Parent");
	}
}
public abstract class Child extends Parent { //Line 9
	public static void main(String [] args) { //Line 10
		new Parent().m(); //Line 11
	}
} </code></pre><p>What will be the result of compiling and executing Child class?</p>',9),
	 (3028,'OCP - Chapter 1 - Q47','<p>Given the following code:</p><pre><code class="language-java">class Outer {
	public static void innerPrint() {}
	static { 
		class Inner {
			{ System.out.println("I''m in"); }
		} 
		new Inner();
	}
}
public class TestOuter {
	public static void main(String[] args) {
		//Insert
	}
}</code></pre><p>Which of the following options can replace //Insert in order to print “I’m in”?</p>',9),
	 (3066,'OCP - Chapter 10 - Question 6','<p>Identify correct statement(s) regarding the benefit of using PreparedStatement over Statement. Please select 1 option.</p>',57),
	 (3070,'OCP - Chapter 10 - Question 10','<p>Identify the correct statement regarding a JDBC Connection: Please select 1 option.</p>',57),
	 (3071,'OCP - Chapter 10 - Q1','<p>Which interfaces or classes are in a database-specific JAR file ? (Choose all that apply)</p>',57);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3072,'OCP - Chapter 10 - Q2','<p>Which are required parts of a JDBC URL? (Choose all that apply)</p>',57),
	 (3073,'OCP - Chapter 10 - Q3','<p>Which of the following is a valid JDBC URL ?</p>',57),
	 (3074,'OCP - Chapter 10 - Q4','<p>What file is required inside a JDBC 4.0+ driver JAR ?</p>',57),
	 (3075,'OCP - Chapter 10 - Q5','<p>Suppose that you have a table named animal with two rows. What is the result of the following code ?</p><pre><code class="language-java">6: Connection conn = new Connection(url, username, password);
7: Statement stmt = conn.createStatement();
8: ResultSet rs = stmt.executeQuery("select count(*) from animal");
9: if (rs.next()) System.out.println(rs.getInt(1));</code></pre>',57),
	 (3076,'OCP - Chapter 10 - Q6','<p>Which of the following are true ? (Choose all that apply)</p>',57),
	 (3077,'OCP - Chapter 10 - Q7','<p>Which of the following can fill in the blank ? (Choose all that apply)&nbsp;</p><pre><code class="language-java">public void stmt(Connection conn, int b) throws SQLException {
	Statement stmt = conn.createStatement(____, b);
}</code></pre>',57),
	 (3078,'OCP - Chapter 10 - Q8','<p>Given a valid conn object of type Connection, what will happen if you run this code when the requested mode is not supported ?&nbsp;</p><pre><code class="language-java">conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);</code></pre>',57),
	 (3079,'OCP - Chapter 10 - Q9','<p>Which of the options can fill in the blanks in order to make the code compile ?&nbsp;</p><pre><code class="language-java">boolean bool = stmt.____(sql);
int num = stmt.____(sql);
ResultSet rs = stmt.______(sql);</code></pre>',57),
	 (3080,'OCP - Chapter 10 - Q10','<p>Suppose that the table animal has five rows and this SQL statement updates all of them. What is the result of this code ?</p><pre><code class="language-java">public static void main(String[] args) throws SQLException {
	Connection conn = DriverManager.getConnection("jdbc: derby: zoo");
	Statement stmt = conn.createStatement();
	int result = stmt.executeUpdate("update animal set name = name");
	System.out.println(result);
}</code></pre>',57),
	 (3081,'OCP - Chapter 10 - Q11','<p>Suppose that the table food has five rows and this SQL statement updates all of them. What is the result of this code ?</p><pre><code class="language-java">public static void main(String[] args) {
	Connection conn = DriverManager.getConnection("jdbc: derby: zoo");
	Statement stmt = conn.createStatement();
	int result = stmt.executeUpdate("update food set amount = amount + 1");
	System.out.println(result);
}</code></pre>',57);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3082,'OCP - Chapter 10 - Q12','<p>Which is the correct order in which to close database ressources ?</p>',57),
	 (3083,'OCP - Chapter 10 - Q13','<p>There are currently 100 rows in the table species before inserting a new row. What is the output of the following code ?</p><pre><code class="language-java">try (Connection conn = DriverManager.getConnection("jdbc: derby: zoo");
Statement stmt = conn.createStatement()) {
	ResultSet rs = stmt.executeQuery("select count(*) from species");
	int num = stmt.executeUpdate("INSERT INTO species VALUES (3, ''Ant'', .05)");
	rs.next();
	System.out.println(rs.getInt(1));
}</code></pre>',57),
	 (3084,'OCP - Chapter 10 - Q14','<p>Which of the following can fill in the blank correctly ? (Choose all that apply)&nbsp;</p><pre><code class="language-java">ResultSet rs = stmt.executeQuery(sql);
if (rs.next()) { ______ }</code></pre>',57),
	 (3085,'OCP - Chapter 10 - Q15','<p>Which of the following can fill in the blank to print the month, date, year, hour, minute and second ?</p>',57),
	 (3086,'OCP - Chapter 10 - Q16','<p>Suppose that you have a table with three rows. The names in those rows are Anna, Betty, and Cat. What does the following output ?</p><pre><code class="language-java">String sql = "select name from animal";
try (Connection conn = DriverManager.getConnection("jdbc: derby: zoo");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql)) {
		rs.next();
		rs.previous();
		rs.previous();
		rs.next();
		rs.next();
		rs.absolute(2);
		System.out.println(rs.getString(1));
	}</code></pre>',57),
	 (3087,'OCP - Chapter 10 - Q17','<p>Which of the following methods move the cursor without returning a boolean ?</p>',57),
	 (3088,'OCP - Chapter 10 - Q18','<p>Suppose that you have a table animal with three rows. The names in those rows are Anna, Betty, and Cat. What does the following output ?</p><pre><code class="language-java">String sql = "select name from animal order by id";
try (Connection conn = DriverManager.getConnection("jdbc: derby: zoo");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql)) {
		rs.absolute(0);
		rs.next();
		System.out.println(rs.getString(1));
	}</code></pre>',57),
	 (3089,'OCP - Chapter 10 - Q19','<p>In a table animal with 10 rows, how many times does true get output by the following ? (Choose all that apply)&nbsp;</p><pre><code class="language-java">String sql = "select * from animal";
try (Connection conn = DriverManager.getConnection("jdbc: derby: zoo");
	Statement stmt = conn.createStatement( ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	ResultSet rs = stmt.executeQuery(sql)) {
		System.out.println(rs.absolute(0));
		System.out.println(rs.absolute(5));
		System.out.println(rs.previous());
		System.out.println(rs.relative(-2));
		System.out.println(rs.relative(-100));
		}</code></pre>',57),
	 (3090,'OCP - Chapter 10 - Q20','<p>In a table animal with 10 rows, how many times does true get output by the following ? (Choose all that apply)&nbsp;</p><pre><code class="language-java">String sql = "select * from animal";
try (Connection conn = DriverManager.getConnection("jdbc: derby: zoo"); 
     Statement stmt = conn.createStatement( ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 
     ResultSet rs = stmt.executeQuery(sql)) {
	System.out.println(rs.beforeFirst());
	System.out.println(rs.absolute(5));
	System.out.println(rs.previous());
	System.out.println(rs.relative(-2));
	System.out.println(rs.afterLast());
}</code></pre>',57),
	 (3102,'VueJS_bases_Q12','<p>Laquelle des déclarations suivantes définit le mieux Vue.js ?</p>',3);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3103,'VueJS_bases_Q13','<p>Pourquoi Vue.js est-il appelé framework progressif ?</p>',3),
	 (3104,'VueJS_bases_Q14','<p>Quelle est l''utilisation principale de Vue.js ?</p>',3),
	 (3105,'VueJS_bases_Q15','<p>Parmi les propositions suivantes, laquelle est la bonne façon d''installer Vue.js dans votre projet ?</p>',841),
	 (3106,'VueJS_bases_Q16','<p>Parmi les propositions suivantes, laquelle est un des avantages à utiliser Vue.js ?</p>',3),
	 (3143,'GIT_W3school_QUIZv3_1_25','<p>Qu''est-ce que Git ?</p>',755),
	 (3144,'GIT_W3school_QUIZv3_2_25','<p>Git est l''équivalent de GitHub</p>',755),
	 (3145,'GIT_W3school_QUIZv3_3_25','<p>Quelle commande pour récupérer la version de Git ?</p>',755),
	 (3146,'GIT_W3school_QUIZv3_4_25','<p>Quelle option utiliser pour définir le nom d''utilisateur par défaut pour tous les dépôts git d''un ordinateur ?</p>',824),
	 (3147,'GIT_W3school_QUIZv3_5_25','<p>Quelle commande pour définir l''email sur le dépôt courant ?</p>',824),
	 (3149,'GIT_W3school_QUIZv3_6_25','<p>Quelle commande pour ajouter tous les fichiers et changements du répertoire courant à l''environnement de “staging” du dépôt Git ?</p>',770);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3150,'GIT_W3school_QUIZv3_7_25','<p>Quelle commande pour récupérer le statut actuel du dépôt Git ?</p>',771),
	 (3151,'GIT_W3school_QUIZv3_8_25','<p>Quelle commande pour initialiser un dépôt Git dans le répertoire courant ?</p>',750),
	 (3152,'GIT_W3school_QUIZv3_9_25','<p>Git ajoute automatiquement les nouveaux fichiers du répertoire au dépôt et commence à suivre chacun de leurs changements.</p>',770),
	 (3153,'GIT_W3school_QUIZv3_10_25','<p>L''historique des commits Git est automatiquement supprimé:</p>',749),
	 (3154,'GIT_W3school_QUIZv3_11_25','<p>Quelle commande permet de "commit" (fixer dans l''historique des changements des fichiers) les changements en “staging” (les changements que l''on a sélectionnés) pour le dépôt Git ?</p>',752),
	 (3155,'GIT_W3school_QUIZv3_12_25','<p>Quelle commande permet de "commit" (fixer dans l''historique des changements des fichiers) avec le message “New email” dans l''historique.</p>',774),
	 (3156,'GIT_W3school_QUIZv3_13_25','<p>Quelle commande permet de voir l''historique des "commits" du dépôt ?</p>',816),
	 (3157,'GIT_W3school_QUIZv3_14_25','<p>Quelle commande permet de voir les options disponibles pour la commande de commit ?</p>',774),
	 (3158,'GIT_W3school_QUIZv3_15_25','<p>Dans Git, une “branch” (branche en français) c''est:</p>',778),
	 (3159,'GIT_W3school_QUIZv3_16_25','<p>Quelle est la commande pour créer une nouvelle branche nommée “new-email” ?</p>',778);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3160,'GIT_W3school_QUIZv3_17_25','<p>Quelle est la commande pour se déplacer vers la "branch" nommée “new-email” ?</p>',778),
	 (3161,'GIT_W3school_QUIZv3_18_25','<p>Quelle est l''option, lors d''un déplacement vers une "branch", de créer la branche si elle n''existe pas encore ?</p>',797),
	 (3162,'GIT_W3school_QUIZv3_19_25','<p>Quelle est la commande pour fusionner la branche courante avec la branche “new-email”</p>',803),
	 (3163,'GIT_W3school_QUIZv3_20_25','<p>Quelle est la commande pour supprimer la branche “new-email”</p>',798),
	 (3165,'GIT_W3school_QUIZv3_22_25','<p>Quelle est la commande pour “push” (pousser nos changements vers un dépôt distant) le dépôt courant vers le dépôt distant "origin" ?</p>',752),
	 (3166,'GIT_W3school_QUIZv3_23_25','<p>Quelle est la commande pour récupérer tous les changements synchronisés sur le dépôt distant “origin” ?</p>',753),
	 (3167,'GIT_W3school_QUIZv3_24_25','<p>Quelle est la commande pour montrer les différences entre la branche actuelle et la branche nommée “new-email” ?</p>',816),
	 (3169,'GIT_W3school_QUIZv3_25_25','<p>Git Pull est la combinaison de:</p>',812),
	 (3200,'OCP11_CHAP14_Review_17','<p>Quelles propositions peuvent indépendamment remplir les blancs pour que le code compile ?</p><pre><code class="language-java">1: public class Generic________ {
2:   public static void main(String[] args) {
3:     Generic&lt;String&gt; g = new Generic________();
4:     Generic&lt;String&gt; g2 = new Generic();
5:   }
6: }</code></pre>',204),
	 (3204,'SPRING_AOP_1','<p>Quel problème résout l''AOP ? &nbsp;</p>',154);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3209,'OCP11_CHAP14_Review_25','<p>Quel est le résultat du code suivant ?</p><pre><code class="language-java">var map = new HashMap&lt;Integer, Integer&gt;();
map.put(1, 10);
map.put(2, 20);
map.put(3, null);
map.merge(1, 3, (a,b) -&gt; a + b);
map.merge(3, 3, (a,b) -&gt; a + b);
System.out.println(map);</code></pre>',32),
	 (3212,'SPRING_AOP_4','<p>Qu''est-ce qu''un <i><strong>Advice </strong></i>?</p>',154),
	 (3217,'SPRING_AOP_9','<p>A quoi fait référence le mot <i><strong>weaving</strong></i> &nbsp;(tissage) en AOP?</p>',154),
	 (3229,'VueJS_directives_Q28','<p>Quelle est l''abréviation pour v-bind: ?</p>',836),
	 (3230,'VueJS_directives_Q29','<p>Quelle est l''abréviation pour v-on: ?</p>',835),
	 (3231,'VueJS_directives_Q30','<p>Quelle est l''abréviation pour v-model: ?</p>',837),
	 (3232,'VueJS_directives_Q31','<p>Lequel des modificateurs suivants est très utile pour améliorer les performances des appareils mobiles ?</p>',832),
	 (3234,'VueJS_directives_Q32','<p>Lequel des modificateurs d''événement suivants devrions-nous utiliser pour effectuer l''événement de clic une seule fois ?</p>',832),
	 (3246,'Node_Events1','<p>Quel est le résultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import EventEmitter from "events";

const emitter = new EventEmitter();
emitter.on("logMessage", console.log);
emitter.emit("logMessage", "a");
emitter.emit("logMessage", "b");</code></pre>',23),
	 (3247,'Node_Events2','<p>Quel est le résultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import EventEmitter from "events";

EventEmitter.on("logMessage", console.log);
EventEmitter.emit("logMessage", "a");
EventEmitter.emit("logMessage", "b");</code></pre>',23);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3249,'Node_Events3','<p>Quel est le résultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import EventEmitter from "events";

const emitter = new EventEmitter();
emitter.once("logMessage", console.log);
emitter.emit("logMessage", "a");
emitter.emit("logMessage", "b");</code></pre>',23),
	 (3250,'Node_Events4','<p>Quel est le résultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import EventEmitter from "events";

const emitter = new EventEmitter();
emitter.on("logMessage", console.log);
emitter.emit("a");
emitter.emit("b");</code></pre>',23),
	 (3252,'Node_Events5','<p>Quel est le résultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import EventEmitter from "events";

const emitter = new EventEmitter();
emitter.once("logMessage", console.log);
emitter.on("logMessage", console.log);
emitter.emit("logMessage", "a");
emitter.emit("logMessage", "b");</code></pre>',23),
	 (3268,'Node_Events6','<p>Quel est le résultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import EventEmitter from "events";

const myEmitter = new EventEmitter();
myEmitter.on(''event'', (arg) =&gt; {
  setImmediate(() =&gt; {
    console.log(arg);
  });
});
console.log("a")
myEmitter.emit(''event'', ''b'');
console.log("c")</code></pre>',23),
	 (3517,'VueJS_directives_Q33','<p>Laquelle de ces propositions n''est pas une directive ?</p>',832),
	 (3518,'VueJS_CLI_Q9','<p>Comment peut-on appeler un composant personnalisé qui a pour nom my-component ?</p>',825),
	 (3519,'VueJS_CLI_Q10','<p>Quels sont les avantages à utiliser Vue CLI pour créer des applications web ?</p>',852),
	 (3520,'VueJS_lifecycle_Q4','<p>Quel est le bon ordre d''exécution de ces hooks de composant ?</p>',827);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3521,'VueJS_lifecycle_Q5','<p>Quel est le bon ordre d''exécution de ces hooks de composant ?</p>',827),
	 (3522,'Node: CLI','<p>Que se passe-t''il quand on écrit node dans la console sans argument?</p>',22),
	 (3523,'VueJS_lifecycle_Q6','<p>Laquelle de ces propositions n''est pas un lifecycle hook en Vue.js ?</p>',827),
	 (3524,'VueJS_lifecycle_Q7','<p>Laquelle de ces propositions n''est pas un lifecycle hook en Vue.js ?</p>',827),
	 (3525,'Node: CLI_2','<p>Quelle raccourci REPL correspond à .exit?</p>',22),
	 (3526,'Node: CLI_3','<p>Quelle raccourci REPL correspond à .break?</p>',22),
	 (3527,'Node: CLI_4','<p>Peut-on lancer le REPL depuis un fichier? Si oui, comment?</p>',22),
	 (3528,'Node: CLI_5','<p>En REPL, il est nécessaire de require les sous-modules de Node pour pouvoir les utiliser.</p>',22),
	 (3530,'Node: CLI_6','<p>La console affiche en REPL les informations suivantes. Quel va être le résultat une fois que l''on appuiera sur enter?</p><pre><code class="language-javascript">&gt; [ ''a'', ''b'', ''c'' ]
[ ''a'', ''b'', ''c'' ]
&gt; _.length</code></pre>',22),
	 (3531,'Node: CLI_7','<p>Y a-t''il un équivalent à _ pour récupérer les valeurs en REPL? Si oui, lequel?</p>',22);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3606,'VueJS_CLI_Q11','<p>Quelle est la commande pour installer Vue CLI ?</p>',852),
	 (3607,'VueJS_CLI_Q12','<p>Quelle est la commande pour créer un projet my-project avec Vue CLI ?</p>',852),
	 (3644,'OCP11_CHAP18_Review_24','<p>Quelles propositions concernant le code suivant sont correctes ?</p><pre><code class="language-java">public class TicketManager {
    private int tickets;
    private static TicketManager instance;
    private TicketManager() {}
    static synchronized TicketManager getInstance() {      // k1
        if (instance==null) instance = new TicketManager(); // k2
        return instance;
    }
 
    public int getTicketCount() { return tickets; }
    public void addTickets(int value) {tickets += value;}  // k3
    public void sellTickets(int value) {
        synchronized (this) { // k4
            tickets -= value;
        }
    }
}</code></pre>',419),
	 (3873,'Node: CLI_8','<p>async/await &nbsp;n''est pas supporté en REPL</p>',22),
	 (3876,'Node: CLI_9','<p>Pour démarrer un server REPL, quelle autre écriture est possible que:</p><pre><code class="language-javascript">new repl.REPLServer();</code></pre>',22),
	 (3879,'Node: CLI_10','<p>Il est possible de créer de nouvelles commandes REPL comme .break ou .exit</p>',22),
	 (3890,'Node: CLI_11','<p>defineCommand prend en deuxième paramètre soit un objet soit une fonction. Quelle écriture est préférable?</p>',22),
	 (3893,'Node: CLI_12','<p>Quels sont les propriétés qu''options peut avoir dans le code suivant qui sera utilisé?</p><p>&nbsp;</p><pre><code class="language-javascript">replServer.defineCommand("sayhello", options);</code></pre>',22),
	 (3895,'Node: CLI_13','<p>Quels sont les propriétés qu''options peut avoir dans le code suivant qui sera utilisé?</p><p>&nbsp;</p><pre><code class="language-javascript">replServer.defineCommand("sayhello", options);</code></pre>',22),
	 (3956,'Node: CLI_14','<p>Comment peut-on démarrer le debugger de Node en CLI?</p>',22);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3957,'Node: CLI_15','<p>Comment peut-on mettre un breakpoint sur lequel le debugger de Node s''arrête?</p>',22),
	 (3958,'Node: CLI_16','<p>Comment peut-on suivre l''état d''une variable en mode debugger depuis la CLI?</p>',22),
	 (3959,'Node: Buffers_1','<p>Comment peut-on créer un Buffer en Node.JS?</p>',24),
	 (3960,'Node: Buffers_2','<p>_____ est moins performant mais garanti l''intégrité et sécurité des données, tandis que ______ est plus performant au prix de potentielles vulnérabilités</p>',24),
	 (3961,'Node: Buffers_3','<p>Quel est le cas d''utilisation de Buffer.from()?</p>',24),
	 (3984,'VueJS_VueX_Q1','<p>Qu''est-ce que VueX ?</p>',844),
	 (3985,'VueJS_VueX_Q2','<p>Comment installer VueX ?</p>',849),
	 (3986,'Node: Buffers_4','<p>Quel est le résultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.from(18);
buffer.write("Hello", "utf-8");
console.log(buffer.toString());</code></pre>',24),
	 (3987,'Node: Buffers_5','<p>Quel est le résultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.alloc(18);
buffer.write("Hello world", "utf16le");
console.log(buffer.toString());</code></pre>',24),
	 (3988,'Node: Buffers_6','<p>Quel est le résultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.alloc(18);
buffer.write("Hello", "utf16le");
console.log(buffer.toJSON());</code></pre>',24);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3989,'Node: Buffers_7','<p>Quel est le résultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.alloc(18);
buffer.write("Hello", "utf16le");
console.log(buffer);</code></pre>',24),
	 (3990,'VueJS_VueX_Q3','<p>Est-ce que c''est possible de muter directement l''état du store ?</p>',846),
	 (3991,'Node: Buffers_8','<p>Quel est le résultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.from("Hello");
console.log(buffer.toString());</code></pre>',24),
	 (3994,'VueJS_VueX_Q4','<p>Pourquoi la gestion d''état (state management) est-elle importante ?</p>',844),
	 (3996,'Node: Buffers_10','<p>Quel est le résultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.alloc(5, "a")
console.log(buffer);</code></pre>',24),
	 (3997,'VueJS_VueX_Q5','<p>Quelle partie de Vuex est chargée d''apporter directement des modifications au data store ?</p>',846),
	 (3999,'VueJS_VueX_Q7','<p>Quelle partie de Vuex est responsable de la gestion de la logique qui peut déclencher des changements dans le data store ?</p>',846),
	 (4000,'Node: Buffers_11','<p>Comment mesurer la taille d''un Buffer (nommé buff) ?</p>',24),
	 (4002,'VueJS_VueX_Q8','<p>Quel est le mot clé pour déclencher une mutation ?</p>',848);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (4023,'VueJS_VueX_Q9','<p>Quelle est la syntaxe la plus courante pour accéder aux actions d''un store Vuex dans un composant ?</p>',849),
	 (4024,'Node: Buffers_12','<p>Quel est le résultat du code suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.from("Hello world");
console.log(buffer[0]);</code></pre>',24),
	 (4025,'Node: Buffers_13','<p>Peut-on itérer sur un Buffer?</p>',24),
	 (4026,'Node: Buffers_14','<p>Quel type d''objet Javascript est équivalent aux Buffer de Node.JS?</p>',24),
	 (4030,'Node: Buffers_15','<p>Quel est le résultat du code suivant?&nbsp;</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.from("Hello world")
const copiedBuffer = buffer.slice();
copiedBuffer[0]++;
console.log(buffer.toString(), copiedBuffer.toString());
</code></pre>',24),
	 (4031,'Node: Buffers_16','<p>Quel est le résultat du code suivant?&nbsp;</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.from("Hello world")
const copiedBuffer = Uint8Array.prototype.slice.call(buffer);
copiedBuffer[0]++;
console.log(buffer.toString(), copiedBuffer.toString());
</code></pre>',24),
	 (4033,'VueJS_VueX_Q10','<p>Quelle opération sur le store Vuex est asynchrone ?</p>',846),
	 (4035,'Node: Buffers_17','<p>Si l''on passe un Uint8Array en argument à la méthode Buffer.isBuffer(), quel est le résultat?<br>&nbsp;</p>',24),
	 (4037,'Node: Buffers_18','<p>Quel est le résultat du code suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.alloc(25)
buffer.write("Hello")
buffer.write(" world")
console.log(buffer.toString());
</code></pre>',24),
	 (4038,'Node: Buffers_19','<p>Quel est le résultat du code suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buf1 = Buffer.alloc(5).fill(''?'');
const buf2 = Buffer.alloc(5).fill(''!'');
buf1.copy(buf2);
console.log(buf1.toString())</code></pre>',24);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (4044,'AOP 1','<p>Considérant cet aspect :&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">@Component
@Aspect
public class MathAOP {
	
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Pointcut(value = "execution(* com.excilys.kataspring.service.MathService.*(..))")
	private void multiplyMethod() {}
	
	@Around(value="multiplyMethod()")
	public double multiply(ProceedingJoinPoint joinpoint) {
		try {
			joinpoint.proceed();
		} catch (Throwable e) {
			logger.info(e.getMessage());
		}
		return 2;
	}
}</code></pre><p>Que retournera un appel à la méthode MathService.multiply(3, 4) ?</p>',154),
	 (4045,'AOP 2','<p>En considérant l''aspect suivant :&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">@Component
@Aspect
public class MathAOP {
	
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Pointcut(value = "execution(* com.excilys.kataspring.service.MathService.*(..))")
	private void multiplyMethod() {}
	
	@Around(value="multiplyMethod()")
	public double multiply(ProceedingJoinPoint joinpoint) {
		try {
			return (double)joinpoint.proceed();
		} catch (Throwable e) {
			logger.error(e.getMessage());
		}
		return 2;
	}
}</code></pre><p>Que retournera un appel à la méthode MathService.multiply(3,4) ?</p><p>&nbsp;</p>',154),
	 (4046,'AOP 3','<p>En considérant l''aspect suivant :&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">@Component
@Aspect
public class MathAOP {
	
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Pointcut(value = "execution(* com.excilys.kataspring.service.MathService.*(..))")
	private void multiplyMethod() {}
	
	@Before(value="multiplyMethod()")
	public void beforMultiply(JoinPoint joinpoint) {
		logger.info("--in before aop");
	}
	
	@Around(value="multiplyMethod()")
	public double multiply(ProceedingJoinPoint joinpoint) {
		logger.info("--in around aop");
		try {
			return (double)joinpoint.proceed();
		} catch (Throwable e) {
			logger.info(e.getMessage());
		}
		return 2;
	}
}</code></pre><p>A l''appel de la méthode MathService.multiply(3,4), que contiendront les logs ?</p><p>&nbsp;</p>',154),
	 (4047,'AOP 4','<p>En considérant l''aspect suivant :&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">@Component
@Aspect
public class MathAOP {
	
     private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Pointcut(value = "execution(* com.excilys.kataspring.service.MathService.*(..))")
	private void multiplyMethod() {}
	
	@Before(value="multiplyMethod()")
	public void beforMultiply(JoinPoint joinpoint) {
		logger.info("----------------in before aop");
	}
	
	@Around(value="multiplyMethod()")
	public double multiply(ProceedingJoinPoint joinpoint) {
		logger.info("---------------in around aop");
		
		return 2;
	}
}</code></pre><p>A l''appel de la méthode MathService.multiply(3,4), que contiendront les logs ?</p><p>&nbsp;</p>',154),
	 (4048,'AOP 5','<p>Lesquels sont des Advice valides ? (plusieurs réponses attendues)</p>',154),
	 (4049,'AOP 6','<p>Lesquels sont des Advice valides ? (plusieurs réponses attendues)</p>',154),
	 (4050,'AOP 7','<p>Lesquels sont des Advice valides ? (plusieurs réponses attendues)</p>',154),
	 (4051,'Node: Buffers_20','<p>On peut itérer directement sur un Buffer</p>',24),
	 (4052,'Node: Buffers_21','<p>Un Buffer rempli les conditions du protocole itérateur, nécessaire pour pouvoir être itérable (avec par exemple for…of)&nbsp;</p>',24),
	 (4053,'Node: Buffers_22','<p>Quelles fonctions existent pour itérer sur les valeurs d''un Buffer buff?</p>',24);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (4054,'Node: Buffers_23','<p>Comment peut-on vérifier l''égalité entre deux buffers?</p>',24),
	 (4088,'Spring 3','<p>Vous souhaitez créer un aspect qui permet de logguer le temps d’exécution d’une méthode de votre module métier. Vous n’avez pas besoin de vous occuper des exceptions. Par quelle annotation devriez-vous remplacer XXXX ?</p><p>&nbsp;</p><pre><code class="language-java">@Aspect
public class TimerLoggingAspect {
	XXXX(“org.my.service.Component.work()”)
	public Object measureTime(ProceedingJoinPoint pjp) throws Throwable {
		……
	}
}</code></pre><p><br>&nbsp;</p>',154),
	 (4089,'Spring 4','<p>Que se passe-t-il losqu''un bean annoté avec @Autowired n''est pas trouvé dans le context ?&nbsp;</p>',154),
	 (4090,'Spring 5','<p>Sélectionner les annotations AOP valides</p>',154),
	 (4103,'Spring 17','<p>Vous souhaitez exécuter une méthode advice (AOP) après un point de jointure (join point), mais seulement dans le cas où celle-ci se déroule sans problème, c’est-à-dire sans lever d’exception. Comment annoter cette méthode ?</p>',154),
	 (4109,'Git 1','<p>Quelle commande affiche pour chaque ligne de code du fichier index.html la révision et l’auteur correspondant à la dernière modification de cette ligne ?</p>',816),
	 (4112,'Git 4','<p>&nbsp;Quelle commande permet de push une branche “feature” qui n’existe pas sur le dépôt distant ?</p>',776),
	 (4113,'Git 5','<p>Quelle commande permet de récupérer les nouvelles données d’un dépôt distant sans pour autant combiner les données avec les fichiers de votre espace de travail ?&nbsp;</p>',753),
	 (4114,'Git 6','<p>Quelle fonctionnalité de Github met à disposition une interface Web conviviale pour notifier les membres d’une équipe projet de la fin d’un développement et permet ensuite que les changements proposés soient revus puis intégrés dans la branche master ?</p>',754),
	 (4115,'Git 7','<p>Quelle commande devrait être utilisée pour annuler un commit sans supprimer le commit de l’historique ?&nbsp;</p>',775);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (4116,'Git 8','<p>Quelle option de la ligne de commande permet de spécifier un commentaire de commit à l’exécution de git commit ?</p>',774),
	 (4117,'Git 9','<p>Que fait la commande git commit ?</p>',774),
	 (4118,'Git 10','<p>Qu’est-ce qui est vrai à propos des branches Git ? (Plusieurs réponses attendues)</p>',778),
	 (4119,'Git 11','<p>A l’exécution de <i>git clone &lt;remote repository&gt;</i>, quels fichiers sont ajoutés au répertoire local ?</p>',762),
	 (4120,'Git 12','<p>Quel fichier mis à la racine de votre dépôt est utilisé par Github pour afficher un résumé ou de la documentation relative à votre projet ?</p>',749),
	 (4121,'Git 13','<p>On considère l’historique de commits suivant :&nbsp;</p><p><img src="https://lh3.googleusercontent.com/e7jWeIJLVsOkeMEeplmkk9Up6qZ_1RYSo-aUF1NSvOFbu2i-alWzBf4rdabSZN5sXBCYch6ZG1dleefrnc0nT9qrKkj6zs5MBj5tSkUBr3W4uQZKHB1LFXSgfoeAEpV3jTdm2Bg"></p><p>La HEAD se situe au commit F, vous réalisez que vos derniers commits sont incorrects et vous voulez donc changer votre branche courante pour pointer vers le commit C et faire en sorte que tous vos fichiers de travail soient identiques à ceux du commit C. Parmi les propositions suivantes, quelle est celle que vous devriez exécuter ?</p><p><br>&nbsp;</p>',790),
	 (4122,'Git 14','<p>&nbsp;Qu’est ce qui est vrai à propos de la commande git init ?</p>',760),
	 (4123,'Git 15','<p>Que fait la commande git remote show origin ? (Plusieurs réponses attendues)</p>',749),
	 (4127,'Spring Core 1','<p>Quelle affirmation est vraie ?</p>',147),
	 (4128,'Spring Core 2','<p>Quelles affirmations sont vraies ?</p>',147);

INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 1, 314);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 0, 314);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'cars', 0, 364);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'cars carts', 0, 364);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ccars arts', 0, 364);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 364);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 1, 364);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '-, +, =, --', 0, 365);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '%, *, /, +', 0, 365);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '=, +, /, *', 1, 365);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '^, +, -, ==', 0, 365);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '*, /, %, --', 1, 365);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'public byte getNose(String nose)', 0, 366);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'public void setHead(int head)', 1, 366);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'public String getShoulders()', 1, 366);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'public long isMouth()', 0, 366);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'public void gimmeEars()', 0, 366);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'public boolean isToes()', 1, 366);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'One line needs to be changed for this code to compile', 1, 367);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Two lines need to be changed for this code to compile', 0, 367);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Three lines need to be changed for this code to compile', 0, 367);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'If the code is fixed to compile, none of the cells in the 2D array have a value of 0.', 0, 367);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'If the code is fixed to compile, half of the cells in the 2D array have a value of 0.', 1, 367);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'If the code is fixed to compile, all of the cells in the 2D array have a value of 0.', 0, 367);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'An Error should be thrown if a file system resource becomes temporarily unavailable.', 0, 368);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'An application should never catch an Error.', 1, 368);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Error is a subclass of Exception, making it a checked exception.', 0, 368);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It is possible to catch and handle an Error thrown in an application.', 1, 368);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'An Error should be thrown if a user enters invalid input.', 0, 368);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'forest.Bird', 1, 369);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'savana.sand.Wave', 0, 369);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'jungle.tree.Huicongo', 1, 369);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'java.lang.Object', 1, 369);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'forest.Sloth', 0, 369);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'forest.ape.bonobo', 0, 369);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 370);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 370);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 370);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 370);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 370);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'None of the above - this code doesn''t compile', 0, 370);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Leaves growing', 0, 371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'ing', 0, 371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'wing', 1, 371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 0, 371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'false false false', 0, 372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'true true true', 0, 372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'false true true', 0, 372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'false false true', 1, 372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'It does not compile', 0, 372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'One', 0, 373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Two', 0, 373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Three', 1, 373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Four', 0, 373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Five', 0, 373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'None. The code does not compile', 0, 373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Lines 15 and 17', 1, 374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Lines 15, 16 and 21', 1, 374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Line 17', 1, 374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Lines 17, 18 and 20', 0, 374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Line 20', 0, 374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Line 21', 0, 374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '1234', 0, 375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1234.0', 1, 375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '1234.0L', 1, 375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '1234l', 0, 375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '1234L', 0, 375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', '1_234', 0, 375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 1, 376);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 376);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 376);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'This is an infinite loop', 0, 376);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 376);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'A', 0, 377);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '6', 0, 377);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile', 0, 377);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code compiles but throws a NullPointerException at runtime', 1, 377);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws a different exception at runtime', 0, 377);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The output is not guaranteed', 0, 377);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'List a = new ArrayList();', 0, 378);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'List b = new ArrayList();', 0, 378);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'List c = new ArrayList();', 1, 378);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'List d = new ArrayList();', 0, 378);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'List e = new ArrayList();', 1, 378);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'List f = new ArrayList();', 0, 378);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'No objects are eligible for garbage collection.', 0, 379);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One object is eligible for garbage collection.', 1, 379);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two objects are eligible for garbage collection.', 0, 379);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'No objects are guaranteed to be garbage collected.', 1, 379);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'One object is guaranteed to be garbage collected', 0, 379);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Two objects are guaranteed to be garbage collected.', 0, 379);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None. The code compiles and prints swim!', 0, 380);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'None. The code compiles and prints a stack trace', 0, 380);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'One', 1, 380);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Two', 0, 380);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Three', 0, 380);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'One', 1, 381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Two', 0, 381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Three', 0, 381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None. It doesn''t compile', 0, 381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'None. It throws an exception at runtime', 0, 381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'I only', 0, 382);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'II only', 0, 382);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'III only', 0, 382);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'IV only', 0, 382);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'I or II, or both', 0, 382);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'None of the above', 1, 382);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '5', 1, 383);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '7', 0, 383);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '8', 0, 383);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 383);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 0, 383);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0 1', 0, 384);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1 1', 0, 384);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '1 2', 1, 384);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '2 2', 0, 384);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 384);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles but produces an exception at runtime', 0, 384);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'b', 1, 385);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'black', 0, 385);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'lack', 0, 385);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 385);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 0, 385);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'default', 1, 386);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'protected', 0, 386);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'static', 1, 386);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'private', 0, 386);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'final', 0, 386);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'abstract', 1, 386);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'null', 0, 387);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'shoelace', 0, 387);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'shoelaceshoelace', 0, 387);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 1, 387);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'This is an infinite loop', 0, 387);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles but throws an exception at runtime', 0, 387);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'If the file does not contain a package statement, then the compiler considers the class part of the java.lang package.', 0, 388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The compiler assumes every class implicitly imports the java.lang.* package.', 1, 388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The compiler assumes every class implicitly imports the java.util.* package.', 0, 388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Java requires every file to declare a package statement.', 0, 388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Java requires every file to declare at least one import statement.', 0, 388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'If the class declaration does not extend another class, then it implicitly extends the java.lang.Object class.', 1, 388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Grow!', 0, 389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Growing!', 0, 389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Super Growing!', 0, 389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It does not compile because of line m1', 1, 389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'It does not compile because of line m2', 0, 389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'It does not compile because of line m3', 0, 389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The declaration of name does not compile', 0, 390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The declaration of _number does not compile', 0, 390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The declaration of profit$$$ does not compile', 0, 390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The println statement does not compile', 1, 390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles and runs successfully', 0, 390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles and throws an exception at runtime', 0, 390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'x--, ++x', 1, 391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'x--, x++', 0, 391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '--x, x++', 0, 391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '--x, ++x', 0, 391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'public Big(boolean stillIn)', 0, 392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'public Trouble()', 1, 392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'public Trouble(int deep)', 1, 392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'public Trouble(String now, int... deep)', 0, 392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'public Trouble(long deep)', 1, 392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'public Trouble(double test)', 0, 392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'final int min, max = 100;', 0, 393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'final int min = 0, max = 100;', 0, 393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'int min, max = 100;', 0, 393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'int min = 0, max = 100;', 0, 393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'static int min, max = 100;', 1, 393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'static int min = 0, max = 100;', 1, 393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Both right-hand sides of the ternary expression will be evaluated at runtime.', 0, 394);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'A switch statement may contain at most one default statement', 1, 394);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'A single if-then statement can have multiple else statements.', 0, 394);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The | and || operator are interchangeable, always producing the same results at runtime.', 0, 394);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The ! operator may not be applied to numeric expressions.', 1, 394);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'r', 0, 395);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'e', 0, 395);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ed', 1, 395);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'red', 0, 395);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 395);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles but throws an exception at runtime', 0, 395);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '_____()', 1, 396);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '%run()', 0, 396);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'check-Activity()', 0, 396);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '$Hum2()', 1, 396);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'sing\\\\3()', 0, 396);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'po#ut ()', 0, 396);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Inheritance is better than using static methods for accessing data in other classes.', 0, 397);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Inheritance allows a method to be overridden in a subclass, possibly changing the expected behavior of other methods in a superclass', 1, 397);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Inheritance allows objects to inherit commonly used attributes and methods', 1, 397);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It is possible to create a Java class that does not inherit from any other', 0, 397);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Inheritance tends to make applications more complicated', 0, 397);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'I only', 0, 398);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'II only', 0, 398);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'II and III', 0, 398);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'I, III and IV', 0, 398);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'I, II, III, and IV', 1, 398);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'None are true', 0, 398);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '2 2', 0, 399);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '2 3', 0, 399);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '3 2', 1, 399);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '3 3', 0, 399);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 399);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles but throws an exception at runtime', 0, 399);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Character', 1, 400);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Byte', 1, 400);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Double', 0, 400);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'long', 0, 400);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'String', 1, 400);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Object', 0, 400);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It prints true', 0, 401);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It prints false', 0, 401);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It doesn''t compile due to line k1', 0, 401);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It doesn''t compile due to line k2', 1, 401);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'It doesn''t compile due to another line', 0, 401);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '/** Insert */ in next method **/', 0, 402);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '/****** Find the kitty cat */', 1, 402);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '// Is this a bug ?', 1, 402);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '/ Begin method - performStart() /', 0, 402);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '/*** TODO: Call grandma ***/', 1, 402);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', '# Updated code by Patti', 0, 402);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'import static food.Grass.getGrass;
    import static food.Grass.seeds', 1, 403);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'import static food.*;', 0, 403);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'static import food.Grass.*;', 0, 403);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'import food.Grass.*;', 0, 403);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'static import food.Grass.getGrass; 
    static import food.Grass.seeds;', 0, 403);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'import static food.Grass.*;', 1, 403);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '[Natural History, Science]', 0, 404);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '[Natural History, Science, Art]', 0, 404);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile.', 0, 404);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code compiles but throws an exception at runtime.', 1, 404);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Change name to _name', 1, 405);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Change 10017 to _10017', 0, 405);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Change 10017 to 10017_', 0, 405);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Change 10017 to 10_0_17', 1, 405);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Change int to _int', 0, 405);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '[]', 0, 406);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '[0, 01, 1, 10]', 1, 406);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '[0, 01, 10, 1]', 0, 406);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '[0, 1, 01, 10]', 0, 406);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 406);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles but throws an exception at runtime.', 0, 406);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'final, package-private', 0, 407);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'class, static', 0, 407);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'protected, instance', 0, 407);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'public, static', 1, 407);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'default, public', 0, 407);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'One', 1, 408);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Four', 0, 408);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Five', 0, 408);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 408);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 0, 408);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The javac command compiles a source text file into a set of machine instructions.', 0, 409);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The java command compiles a .class file into a .java file.', 0, 409);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The javac command compiles a .java file into a .class file.', 1, 409);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The javac command compiles a source text file into a bytecode file.', 1, 409);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The java command compiles a .java file into a .class file.', 0, 409);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The javac command compiles a .class file into a .java file.', 0, 409);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 410);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 410);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 410);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 410);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 410);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Five', 0, 410);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'boolean', 0, 411);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'short', 1, 411);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'int', 0, 411);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'byte', 1, 411);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'long', 0, 411);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'float', 1, 411);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 1, 412);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 412);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 412);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 412);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 412);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '145', 0, 413);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1045', 0, 413);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '24, followed by a stack trace', 0, 413);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '245', 1, 413);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile because of line p1', 0, 413);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code does not compile because of line p2', 0, 413);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'can, cup', 0, 414);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'cup, can', 0, 414);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile', 0, 414);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'This is an infinite loop', 0, 414);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 1, 414);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'public static void main(String... widgets)', 1, 415);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'public static void main(String sprockets)', 0, 415);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'protected static void main(String[] args)', 0, 415);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'public static int void main(String[] arg)', 0, 415);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'public static final void main(String []a)', 1, 415);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'public static void main(String[] data)', 1, 415);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Line 8', 0, 416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Line 9', 0, 416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Line 10', 1, 416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Line 11', 1, 416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Line 12', 1, 416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Line 13', 0, 416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Line h1', 1, 417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Line h2', 1, 417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Line h3', 1, 417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Line h4', 0, 417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Line h5', 0, 417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Line h6', 0, 417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'FileNotFoundException', 0, 418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'ArithmeticException', 1, 418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'IOException', 0, 418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Exception', 0, 418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'IllegalArgumentException', 1, 418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'RuntimeException', 1, 418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It only prints Hello', 0, 419);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It only prints Goodbye', 0, 419);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It only prints See you again', 0, 419);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It does not compile because of line g1', 0, 419);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'It does not compile because of line g2', 0, 419);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'None of the above', 1, 419);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'protected and package-private (blank)', 0, 420);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'public and public', 1, 420);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'package-private (blank) and protected', 1, 420);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'protected and protected', 1, 420);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'private and public', 0, 420);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'package-private (blank) and package-private (blank)', 0, 420);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '15', 0, 421);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It does not compile because of line q1', 1, 421);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It does not compile because of line q2', 0, 421);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It does not compile because of line q3', 0, 421);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'It does not compile because of line q4', 0, 421);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'It compiles but throws an exception at runtime', 0, 421);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 422);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 422);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 422);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 422);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 422);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Five', 0, 422);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'A catch block can never appear after a finally block', 1, 423);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'A try block must be followed by a catch block.', 0, 423);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'A finally block can never appear after a catch block', 0, 423);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A try block must be followed by a finally block', 0, 423);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A try block can have zero or more catch blocks', 1, 423);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'A try block can have zero or more finally blocks', 0, 423);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '49', 0, 424);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '13', 1, 424);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '18', 0, 424);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '99', 0, 424);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'It does not compile', 0, 424);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'An object can be assigned to an inherited interface reference variable without an explicit cast.', 1, 425);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The compiler can prevent all explicit casts that lead to an exception at runtime13', 0, 425);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Casting an object to a reference variable does not modify the object in memory', 1, 425);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'An object can be assigned to a subclass reference variable without an explicit cast', 0, 425);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'An object can be assigned to a superclass reference variable without an explicit cast', 1, 425);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'An implicit cast of an object to one of its inherited types can sometimes lead to a ClassCastException at runtime.', 0, 425);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 0, 426);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1', 0, 426);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '2', 0, 426);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 426);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 0, 426);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The output is not guaranteed', 1, 426);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 427);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 1, 427);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 427);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 427);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 427);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'throw, finally, throws', 0, 428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'throws, catch, throw', 0, 428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'catch, finally, throw', 0, 428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'finally, catch, throw', 0, 428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'throws, finally, throw', 1, 428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The println causes one line of output.', 0, 429);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The println causes two lines of output.', 1, 429);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The println causes three lines of output.', 0, 429);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code terminates successfully', 0, 429);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code throws an exception at runtime', 1, 429);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'abstract methods, override, inheritance', 0, 430);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'concrete methods, overload, inheritance', 0, 430);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'virtual methods, overload, interfaces', 0, 430);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'inheritance, abstract, polymorphism', 0, 430);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'virtual methods, override, polymorphism', 1, 430);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Fall', 0, 431);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Spring', 0, 431);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile', 0, 431);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code throws an exception on line s1', 0, 431);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code throws an exception on line s2', 1, 431);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None. The code compiles and runs whithout issue', 0, 432);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 432);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 432);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 1, 432);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 432);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '5, LONG', 0, 433);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '6, LONG', 1, 433);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '5, null', 0, 433);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '6, null', 0, 433);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 433);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles but throws an exception at runtime', 0, 433);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None. The code compiles and produces a stack trace at runtime', 0, 434);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 434);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 434);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 1, 434);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 434);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Five', 0, 434);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Optimization and platform independence', 0, 435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Platform independence and encapsulation', 0, 435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Platform independence and inheritance', 0, 435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Object orientation and encapsulation', 1, 435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Inheritance and polymorphism', 0, 435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'false false', 0, 436);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'false true', 0, 436);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'true false', 0, 436);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'true true', 0, 436);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 1, 436);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles but throws an exception at runtime', 0, 436);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 1, 437);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1', 0, 437);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '2', 0, 437);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 437);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 0, 437);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The output is not guaranteed', 0, 437);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Every do-while loop can be rewritten as a for-each loop.', 0, 438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Every for-each loop can be rewritten as a do-while loop.', 1, 438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Every for-each loop can be rewritten as a traditional for loop.', 1, 438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Every for-each loop can be rewritten as a while loop.', 1, 438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Every traditional for loop can be rewritten as a for-each loop.', 0, 438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Every while loop can be rewritten as a for-each loop.', 0, 438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'This is an infinite loop', 0, 439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 1, 439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 0, 441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1', 1, 441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '3', 0, 441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '9', 0, 441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'This is an infinite loop', 0, 441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code does not compile', 0, 441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None, the class compiles without issue', 0, 442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 1, 442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Five', 0, 442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Access modifier in a class', 0, 443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Execution path in a switch statement', 1, 443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Method name', 0, 443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Modifier in an abstract interface method', 0, 443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Modifier in an interface method with a body', 1, 443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Variable name', 0, 443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'computer-laptop-', 0, 447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'laptop-computer-', 0, 447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'laptop-laptop-', 1, 447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of the above', 0, 447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Just getNumRakes()', 0, 458);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Just getNumShovels()', 0, 458);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Both methods', 1, 458);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Neither method', 0, 458);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'p', 0, 471);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'q', 0, 471);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'r', 0, 471);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of these', 1, 471);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 1, 475);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 475);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 475);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 475);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'filter()', 0, 483);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'forEach()', 1, 483);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'replace()', 0, 483);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'sort()', 0, 483);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'ArrayDeque', 0, 507);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'ArrayList', 1, 507);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TreeSet', 0, 507);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'All of these allow nulls.', 0, 507);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 562);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 562);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 562);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 562);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'I', 0, 592);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'II', 0, 592);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'I and II', 1, 592);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'I, II, and III', 0, 592);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'withFlatMap(list); withoutFlatMap(list);', 0, 749);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'withFlatMap(queue); withoutFlatMap(queue);', 1, 749);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Both pairs disprove the claim.', 0, 749);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Neither pair disproves this claim.', 0, 749);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '1235', 0, 849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '3215', 0, 849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '41235', 0, 849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile.', 1, 849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code runs successfully.', 0, 870);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code throws an exception on line 18.', 0, 870);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code throws an exception on line 19.', 1, 870);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile.', 0, 870);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code does not compile.', 0, 917);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code compiles but prints an exception at runtime', 0, 917);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The program runs and prints all students in the file', 0, 917);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The program runs but may only print some students in the files.', 1, 917);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 928);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 928);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 928);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 928);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Both methods compile and are equivalent to each other.', 0, 930);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Neither method compiles', 1, 930);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Only one of the methods compiles.', 0, 930);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The methods compile, but one method may lead to a resource leak', 0, 930);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'irregular file, regular file', 0, 937);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'regular file, opaque file', 0, 937);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'symbolic link, regular file', 1, 937);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'symbolic link, symbolic directory', 0, 937);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The first stream statement does not compile.', 0, 971);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The second stream statement does not compile.', 0, 971);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Both statements compile but are unlikely to print the same results at runtime.', 0, 971);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of the above', 1, 971);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Zero', 0, 980);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 980);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 980);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 980);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 1, 997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '10', 0, 997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile.', 0, 997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of the above.', 0, 997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '{1975=[Escort], 1967=[Thunderbird, Mustang]}', 1, 999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '{Escort=[1975], Thunderbird=[1967], Mustang=[1967]}', 0, 999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile', 0, 999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The application throws an exception at runtime because the stream is not parallel', 0, 999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'aCataHat HatCat', 1, 1000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'CatHat CatHat', 0, 1000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile because concat1() returns an Optional.', 0, 1000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile for a different reason.', 0, 1000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 0, 1004);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '10', 1, 1004);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '12', 0, 1004);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of the above', 0, 1004);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None. The code compiles as is', 0, 1014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 1014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 1014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 1014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code terminates successfully without any output.', 0, 1030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code does not compile due to line s1.', 0, 1030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile due to line s2.', 1, 1030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of the above', 0, 1030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'System.out.println(rs.getString());', 0, 1032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'System.out.println(rs.getString("0"));', 0, 1032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'System.out.println(rs.getString("1"));', 0, 1032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'System.out.println(rs.getString("title"));', 1, 1032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'There is a compiler error on the line of code that creates the Statement.', 0, 1033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'There is a compiler error on the line of code that creates the ResultSet.', 1, 1033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'This code compiles and runs without error.', 0, 1033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'This code throws a SQLException at runtime.', 0, 1033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code compiles and runs without error.', 1, 1040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code does not compile.', 0, 1040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code compiles but throws an exception at runtime on line r1.', 0, 1040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code compiles but throws an exception at runtime on line r2.', 0, 1040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code terminates successfully without any output.', 1, 1045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code does not compile due to line s1.', 0, 1045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile due to line s2.', 0, 1045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of the above', 0, 1045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Jeanne Scott', 0, 1046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Scott Jeanne', 1, 1046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code compiles, but the output is neither of these.', 0, 1046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code throws a SQLException at runtime.', 0, 1046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '.java', 0, 1068);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '.properties', 0, 1068);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Both of the above', 0, 1068);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Neither of the above', 1, 1068);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'engine 241', 0, 1075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'moteur 241', 0, 1075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'moteur null', 0, 1075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code throws an exception at runtime.', 1, 1075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'engine 241', 1, 1076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'moteur 241', 0, 1076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'moteur null', 0, 1076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code throws an exception at runtime.', 0, 1076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'null', 0, 1081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'black', 0, 1081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'white', 0, 1081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code throws an exception at runtime.', 1, 1081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'null', 0, 1082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '4', 1, 1082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '6', 0, 1082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code throws an exception at runtime.', 0, 1082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0 0', 0, 1087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '0 1', 0, 1087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile.', 1, 1087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code compiles but throws an exception at runtime', 0, 1087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The application completes without printing anything.', 0, 1110);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Yummy!', 0, 1110);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'One line of this application fails to compile.', 0, 1110);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Two lines of this application fail to compile.', 1, 1110);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'polymorphism', 0, 1116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'concrete methods in interfaces', 0, 1116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'multiple inheritance', 0, 1116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'backward compatibility', 1, 1116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les objets Singleton peuvent être modifiés avec un setter', 0, 1159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Les constructeurs d''une classe Singleton doivent obligatoirement être private', 1, 1159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Un objet Singleton doit être nommé "instance"', 0, 1159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les objets Singleton peuvent être de protected ou private', 0, 1159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'S''assure qu''il n''y a qu''une seule et unique instance en mémoire', 1, 1159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Requière une méthode public static pour récupérer l''instance du Singleton', 1, 1159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Modèle MVC', 0, 1214);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Modèle MVVM', 1, 1214);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Une méthode proposée par Vue qui permet de faire des boucles', 0, 1217);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un objet proposé par Vue qui permet de créer des méthodes, gérer des données et lier un template à tout ça', 1, 1217);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Une méthode enregistrée, qui va se lancer seulement si une donnée est chargée', 0, 1217);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Parce qu''on peut créer des méthodes dans les composants et pas les instances', 0, 1230);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Parce qu''on peut ré-utiliser des composants facilement', 1, 1230);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'On utilise la méthode map()', 0, 1231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'On utilise les props', 1, 1231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'On utilise la propriété "sendToChild"', 0, 1231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Ce sont des fonctions qui s''exécutent à différents stades de la construction et de la mise à jour d''un composant.', 1, 1232);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Ce sont des fonctions qui permettent de créer et de supprimer des composants.', 0, 1232);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ces méthodes servent à envoyer des données partout dans notre application, on l''appelle aussi le "bus à événement".', 0, 1232);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-for', 1, 1233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-loop', 0, 1233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-every', 0, 1233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 1, 1234);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 0, 1234);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-show', 1, 1235);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-if', 0, 1235);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-model', 0, 1235);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-bind', 0, 1235);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'beforeMount', 1, 1237);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'mounted', 0, 1237);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'beforeUpdate', 0, 1237);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'updated', 0, 1237);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'DisposableBean', 0, 1257);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Singleton', 0, 1257);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Services', 0, 1257);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Spring beans', 1, 1257);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Un framework', 1, 1283);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Une bibliothèque', 0, 1283);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Aspect Oriented Programming', 1, 1294);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Aspect Oriented Programs', 0, 1294);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Aspect Oriente Programming', 0, 1294);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Aucune de ces réponses n’est vraie', 0, 1294);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les fonctions async', 1, 1298);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Les callbacks', 1, 1298);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Les promesses avec .then().catch()', 1, 1298);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Rien en particulier, le code s''execute de manière synchrone', 0, 1298);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Les Thread', 0, 1298);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'async function ma_fonction() {}', 1, 1300);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'function async ma_fonction(){}', 0, 1300);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'const ma_fonction = async () => {}', 1, 1300);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'async const ma_fonction = () => {}', 0, 1300);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'function ma_fonction() {}', 0, 1300);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'const ma_fonction = () => {}', 0, 1300);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'async function ma_fonction() {}', 1, 1304);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'function async ma_fonction(){}', 0, 1304);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'const ma_fonction = async () => {}', 1, 1304);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'async const ma_fonction = () => {}', 0, 1304);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'function ma_fonction() {}', 1, 1304);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'const ma_fonction = () => {}', 1, 1304);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les Promesses', 1, 1306);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Les Callbacks', 0, 1306);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'fetch', 1, 1317);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'axios', 0, 1317);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'promise', 0, 1317);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'callback', 0, 1317);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'get', 0, 1317);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'const', 1, 1318);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'var', 0, 1318);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'let', 0, 1318);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'final', 0, 1318);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'const', 0, 1319);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'var', 0, 1319);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'let', 1, 1319);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'final', 0, 1319);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'function ma_fonction(a, b=12) {}', 1, 1320);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'function ma_fonction(a, b:12) {}', 0, 1320);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'function ma_fonction(a, b ? b : 12) {}', 0, 1320);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'function ma_fonction(a, b=?12) {}', 0, 1320);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Il permet la destructuration d''array, qui permet une manipulation plus simple du contenu d''un array (copie, ajout, suppression, split...)', 1, 1321);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Il permet la destructuration d''objets, qui permet une manipulation plus simple du contenu d''un objet (copie, ajout, suppression, split...)', 0, 1321);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Pour les fonctions, remplace l''API apply et permet de passer les valeurs d''un array d''une fonction comme étant la liste des paramètres.', 1, 1321);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Permet de décrire une fonction  avec un nombre indéfini de paramètres', 1, 1321);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '(param) => param;', 1, 1322);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '(param) => { return param }', 1, 1322);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'param => { return param; }', 1, 1322);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'param1, param2 => param1;', 0, 1322);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '(param1, param2) => param1+param2;', 1, 1322);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'param => return param', 0, 1322);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'param => param', 1, 1322);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Propriété d''ECMAScript qui permet de modifier une variable avant sa déclaration, tant qu''elle est déclarée', 1, 1323);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Propriété d''ECMAScript qui empêche de modifier une variable avant sa déclaration', 0, 1323);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Propriété d''ECMAScript qui permet de lire une variable avant sa déclaration, tant qu''elle est déclarée', 1, 1323);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Propriété d''ECMAScript qui empêche de lire une variable avant sa déclaration, tant qu''elle est déclarée', 0, 1323);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'oui', 0, 1324);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'non', 1, 1324);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'oui', 0, 1325);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'non', 1, 1325);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '''My name is ${name} !''', 0, 1326);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '`My name is ${name} !`', 1, 1326);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'On ne peut pas', 0, 1326);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '''My name is {name} !''', 0, 1326);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '`My name is {name} !`', 0, 1326);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', '`My name is {name} !`', 0, 1326);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'const [a, , b] = [1,2,3];', 1, 1327);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'const { a } = { a: "valeur1", b: "valeur2" }', 1, 1327);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'const { a, ...rest } = { a: "valeur1", b: "valeur2" }', 1, 1327);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'const [a, ...rest] = [1,2,3];', 1, 1327);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'const { ...rest, b } = { a: "valeur1", b: "valeur2" }', 0, 1327);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'const [...rest, b] = [1,2,3];', 0, 1327);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'script, template, methods', 0, 1328);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'template, script, style', 1, 1328);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'script, template, css', 0, 1328);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'body, script, style', 0, 1328);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-bind:kiwi="kiwi"', 1, 1334);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-key:kiwi="kiwi"', 0, 1334);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-model="kiwi"', 0, 1334);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', ':kiwi="kiwi"', 1, 1334);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-id', 0, 1338);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-loop', 0, 1338);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-key', 1, 1338);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-while', 0, 1338);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-model', 1, 1341);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-bind', 0, 1341);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-store', 0, 1341);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-input', 0, 1341);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'var text = new vue(){ // options }', 0, 1371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'var text = new object({ // options })', 0, 1371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'var text = new Vue({ // options })', 1, 1371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'var text = new text({ // options })', 0, 1371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '[ ]', 0, 1372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '{{ }}', 1, 1372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-model', 0, 1372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Pour éviter les fuites de mémoire (memory leak)', 0, 1373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Pour des raisons de performance lors de la manipulation de grands tableaux', 0, 1373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Pour forcer la copie et éviter les conflits de données entre composants', 1, 1373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'En utilisant setInterval dans methods', 0, 1374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'En utilisant watch', 1, 1374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'En utilisant MutationObserver', 0, 1374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 1, 1375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 0, 1375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-pre', 0, 1381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-once', 0, 1381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-bind', 1, 1381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-html', 0, 1381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 0, 1388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 1, 1388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 1, 1389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 0, 1389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'int main()', 0, 1390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'public void main(String[] args)', 0, 1390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'public static void main(String... values)', 1, 1390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'public static int main(String things)', 0, 1390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'public void main(String... arguments)', 0, 1390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'public static void main(String items[])', 1, 1390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'public static void main(String[] case)', 0, 1390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'caillou 18 Je suis ton père !', 0, 1391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'caillou 18 Je', 0, 1391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'javac Main.java; java Main caillou 18 Je suis ton père !', 0, 1391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Le code ne compile pas', 1, 1391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'caillou 18 Je suis ton père !', 1, 1392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'caillou 18 Je', 0, 1392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'javac Main.java; java Main caillou 18 Je suis ton père !', 0, 1392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Le code ne compile pas', 0, 1392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'javac Main.java ; java Main monsieur le ministre', 0, 1393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'javac Main.java ; java Main "monsieur le ministre"', 1, 1393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'java Main monsieur le ministre', 0, 1393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'java Main "monsieur le ministre"', 0, 1393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'java Main.java monsieur le ministre', 0, 1393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'java Main.java "monsieur le ministre"', 1, 1393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le protocole itérateur', 0, 1404);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Le protocole itérable', 1, 1404);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'La fonction next, avec un ou zéro argument, qui retourne un objet de deux valeurs: value et done.', 1, 1407);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'La fonction next, avec un ou zéro argument, qui retourne une valeur', 0, 1407);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les fonctions asynchrones', 0, 1416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Les générateurs', 1, 1416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Les constructeurs', 0, 1416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les itérateurs', 0, 1416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'yield newValue;', 1, 1417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'return newValue;', 1, 1417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'function* myGenerator()', 1, 1418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '*function myGenerator()', 0, 1418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'generator myGenerator()', 0, 1418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'generator* myGenerator()', 0, 1418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'On peut faire plusieurs exports nommés par module mais un seul export par défaut', 1, 1428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'L''export par défaut permet d''exporter l''ensemble du module, ce qu''on ne peut pas faire avec l''export nommé', 0, 1428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'L''export par défaut ne fonctionne que dans le dossier du module où il est défini, alors que l''export nommé n''est pas limité', 0, 1428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'L''export nommé ne fonctionne que dans le dossier du module où il est défini, alors que l''export par défaut n''est pas limité', 0, 1428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'target', 1, 1435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'handler', 1, 1435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'trap', 1, 1435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'symbol', 0, 1435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'reflect', 0, 1435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '-c', 0, 1438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '-C', 0, 1438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '-cp', 1, 1438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '-d', 0, 1438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '-f', 0, 1438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', '-p', 0, 1438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '-c', 1, 1439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '-C', 1, 1439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '-cp', 0, 1439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '-d', 0, 1439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '-f', 1, 1439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', '-p', 0, 1439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'data-binding', 1, 1440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'caching', 1, 1440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'access control', 1, 1440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'inheritance', 0, 1440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Reflect', 1, 1441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Symbol', 0, 1441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Generator', 0, 1441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 0, 1442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 1, 1442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Une class de Spring.', 0, 1443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un objet créé par le framework AOP afin de mettre en oeuvre les contrats d’aspects.', 1, 1443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Un proxy fourni par Spring conteneur.', 0, 1443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Un JDK dynamic proxy.', 0, 1444);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un JDK  CGLIB proxy.', 0, 1444);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Un JDK dynamic proxy or a CGLIB proxy.', 1, 1444);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Aucune de ces réponses.', 0, 1444);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'JDK dynamic proxy', 1, 1445);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'CGLIB proxy', 0, 1445);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Aspect Oriented Proxy', 0, 1446);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Aspect Observable Programming', 0, 1446);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Aspect Oriented Programming', 1, 1446);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Aspect Objet Programming', 0, 1446);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Join cut', 0, 1447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Point cut', 0, 1447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Join Point', 1, 1447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Advice', 0, 1447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Toutes les méthodes peuvent être des proxy.', 0, 1449);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Seules les classes qui implémentent au moins une interface peuvent être des proxy.', 0, 1449);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Les proxy AOP sont créés par Spring dans le but d’implémenter les aspect contracts.', 1, 1449);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les proxy AOP sont toujours créés avec un proxy dynamique JDK.', 0, 1449);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Un advice peut rendre proxy un constructeur de classe.', 0, 1451);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un code statique d’initialisation peut être ciblé par un point cut.', 0, 1451);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Un point cut peut selectionner des méthodes qui ont une annotation personnalisée.', 1, 1451);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'La combinaison de point cut par les opérateurs “&&”, “||” et “!” n’est pas supporté.', 0, 1451);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les méthodes publiques', 1, 1455);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Toutes les méthodes quelque soit leur visibilité', 0, 1455);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Toutes les méthodes excepté les méthodes privés', 0, 1455);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les méthodes publiques et protected', 0, 1455);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Il s’agit de l’exécution de toutes les méthodes publiques qui renvoient une valeur.', 0, 1456);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Il s’agit de l’exécution de toutes les méthodes publiques.', 1, 1456);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Il s’agit de l’exécution de toutes les méthodes publiques qui ont au moins un paramètre.', 0, 1456);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Il s’agit de l’exécution de toutes les méthodes publiques qui appartiennent au paquet par défaut de Java.', 0, 1456);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'mounted, beforeCreate, created, destroyed', 0, 1485);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'created, beforeMount, mounted, updated', 1, 1485);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'created, beforeUpdate, updated, mounted', 0, 1485);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'destroyed, created, updated, mounted', 0, 1485);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-for', 0, 1486);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-model', 1, 1486);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-bind', 0, 1486);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-on', 0, 1486);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Non', 0, 1487);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Oui', 1, 1487);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-model', 0, 1488);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-bind', 0, 1488);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-on', 1, 1488);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-for', 0, 1488);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Liaison de données bidirectionnelle où la partie de vue de l''application (UI) est mise à jour automatiquement lorsque le modèle de données est modifié.', 1, 1489);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Liaison de données unidirectionnelle où la partie de vue de l''application (UI) est mise à jour automatiquement lorsque le modèle de données est modifié.', 0, 1489);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Liaison de données bidirectionnelle où la partie de vue de l''application (UI) n''est pas mise à jour automatiquement. On a besoin d''écrire quelque code personnalisé pour la mettre à jour chaque fois un modèle de données est modifié.', 0, 1489);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Liaison de données unidirectionnelle où la partie de vue de l''application (UI) n''est pas mise à jour automatiquement. On a besoin d''écrire quelque code personnalisé pour la mettre à jour chaque fois un modèle de données est modifié.', 0, 1489);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 1, 1498);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 0, 1498);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-show', 1, 1500);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-if', 0, 1500);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-show', 0, 1501);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-if', 1, 1501);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 0, 1506);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 1, 1506);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Non', 1, 1511);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Oui', 0, 1511);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'base^exponent', 0, 1521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Math.pow(base, exponent)', 1, 1521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Math.pow(exponent, base)', 0, 1521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'base**exponent', 1, 1521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '9', 0, 1522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '8', 1, 1522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ce code ne compile pas', 0, 1522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ce code retourne une erreur', 0, 1522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '6', 0, 1522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'array.indexOf(val) !== -1', 1, 1523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'array.includes(val)', 1, 1523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'array.includes(val, -1)', 0, 1523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'array.includes(val) !== -1', 0, 1523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'array.includes(1,1)', 1, 1524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'array.includes(1, 2)', 0, 1524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'array.includes(2, -1)', 0, 1524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'array.includes(1)', 1, 1524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'array.includes(0, 0)', 1, 1524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'array.includes(0, 1)', 0, 1524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'ES7', 0, 1525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'ES8', 1, 1525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ES9', 0, 1525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'ES10', 0, 1525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Permet de lire plus facilement les actions asynchrones comme des actions synchrones', 1, 1528);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Renvoi toujours une erreur lorsque la promesse est rejetée', 1, 1528);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Permet de plus facilement faire plusieurs actions asynchrones en parallèle', 0, 1528);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Aucune différence', 0, 1530);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'return await va throw une erreur si ma_fonction a une erreur, ce qui n''est pas le cas du return', 1, 1530);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'return await implique des pertes de performances et est déconseillé', 0, 1530);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'try...catch', 1, 1534);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '.catch()', 0, 1534);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Les erreurs sont retournés à la place de la réponse, il faut faire un check pour savoir si la fonction retourne un objet erreur', 0, 1534);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'undefined', 1, 1535);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'null', 0, 1535);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Une erreur est retourné', 0, 1535);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A l''execution, JS rajoute le await car il reconnait que c''est une fonction asynchrone', 0, 1535);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Pour faire le rendu d’une liste d’éléments ', 1, 1584);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Pour itérer sur les propriétés d’un objet', 1, 1584);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Avec la balise <template>', 1, 1584);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Avec la directive v-if', 1, 1584);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-for="item in items"', 0, 1588);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-for="(item, index) in items"', 0, 1588);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-for="item of items"', 0, 1588);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Toutes les propositions ', 1, 1588);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-for="value in object"', 0, 1589);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-for="(value, name) in object"', 0, 1589);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-for="(value, name, index) in object"', 0, 1589);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Toutes les propositions ', 1, 1589);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '1 2 3 4 5 6 7 8 9 10', 1, 1590);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '0 1 2 3 4 5 6 7 8 9', 0, 1590);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '0 1 2 3 4 5 6 7 8 9 10', 0, 1590);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Le code ne compile pas', 0, 1590);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Facebook', 0, 1603);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Evan You', 1, 1603);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Google', 0, 1603);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Object.keys', 0, 1604);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Object.values', 1, 1604);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Object.entries', 0, 1604);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Array.from', 0, 1604);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Array.entries', 0, 1604);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Array.keys', 0, 1604);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'Array.values', 0, 1604);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Object.keys', 0, 1605);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Object.values', 0, 1605);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Object.entries', 1, 1605);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Array.from', 0, 1605);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Array.entries', 0, 1605);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Array.keys', 0, 1605);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'Array.values', 0, 1605);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 1, 1606);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 0, 1606);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'On passe par le store', 0, 1607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Global Events', 0, 1607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Event Bus', 1, 1607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Event Dispatch', 0, 1607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'configurable', 1, 1608);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'writable', 1, 1608);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'enumerable', 1, 1608);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'value', 1, 1608);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'get', 1, 1608);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'set', 1, 1608);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'L''attribut scoped dans la balise <style>', 1, 1609);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'La directive v-scope', 0, 1609);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'La propriété scoping:true', 0, 1609);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'configurable', 0, 1610);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'writable', 0, 1610);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'enumerable', 1, 1610);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'value', 0, 1610);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'get', 0, 1610);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'set', 0, 1610);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 1, 1611);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 0, 1611);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'configurable', 0, 1612);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'writable', 1, 1612);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'enumerable', 0, 1612);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'value', 1, 1612);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'get', 0, 1612);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'set', 0, 1612);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'ES7', 0, 1613);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'ES8', 0, 1613);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ES9', 1, 1613);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'ES10', 0, 1613);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'ES11', 0, 1613);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'ABC', 0, 1618);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'BC', 1, 1618);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Rien ne s''affiche', 0, 1618);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'CB', 0, 1618);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'B', 0, 1618);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Aucune de ses options', 0, 1618);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'nativeEvent', 0, 1637);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '$event', 1, 1637);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'e.native', 0, 1637);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'e', 0, 1637);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-on:click.self', 1, 1638);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-on:click.once', 0, 1638);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-on:click.this', 0, 1638);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-on:click.once', 1, 1639);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-on:click.prevent.once', 0, 1639);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-on:click.stop', 0, 1639);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-on:click.passive', 0, 1639);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-on:click.prevent', 0, 1640);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-on:click.self.prevent', 1, 1640);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-on:click.prevent.self', 0, 1640);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Un objet itérable asynchrone', 1, 1691);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un objet itérable synchrone', 1, 1691);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Un array', 1, 1691);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Un ReadableStream', 1, 1691);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Possède le symbole Symbol.asyncIterator', 1, 1692);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'La méthode next() retourne une Promesse', 1, 1692);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Il ne peut être itéré qu''avec for await...of', 1, 1692);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'On peut l''itéré avec for...of ou for await...of', 0, 1692);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Possède le symbole Symbol.iterator', 0, 1692);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'La méthode next() retourne une valeur quelconque', 0, 1692);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Possède le symbole Symbol.asyncIterator', 0, 1693);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'La méthode next() retourne une Promesse', 0, 1693);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Il ne peut être itéré qu''avec for await...of', 0, 1693);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'On peut l''itéré avec for...of ou for await...of', 1, 1693);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Possède le symbole Symbol.iterator', 1, 1693);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'La méthode next() retourne une valeur quelconque', 1, 1693);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'synchrone/asynchrone', 1, 1694);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'asynchrone/synchrone', 0, 1694);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '[arrayA, arrayB].flat()', 1, 1695);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '[arrayA, arrayB].flatten()', 0, 1695);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Array.flatten([arrayA, arrayB])', 0, 1695);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Array.flat([arrayA, arrayB])', 0, 1695);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '[1, 2, [3, 4, [5, 6]]].flat(2)', 1, 1696);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '[1, 2, [3, 4, [5, 6]]].flat(1)', 0, 1696);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'On ne peut pas supprimer tous les sous-tableaux avec flat directement', 0, 1696);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '[
  [''foo'', ''bar''],
  [''baz'', 42]
]', 0, 1697);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Ce code retourne une erreur', 0, 1697);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Object { "foo": "bar", "baz": 42 }', 1, 1697);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Object { "bar": "foo", "42": baz }', 0, 1697);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Une Map', 1, 1698);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un Array de [clé, valeur]', 1, 1698);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Un Objet', 0, 1698);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Un Set', 0, 1698);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '    try {
      const response = await fetch(url);
    } catch (e) {
      console.log("caught error")
    }', 1, 1699);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '    try {
      const response = await fetch(url);
    } catch () {
      console.log("caught error")
    }', 0, 1699);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '    try {
      const response = await fetch(url);
    } catch {
      console.log("caught error")
    }', 1, 1699);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Non', 1, 1746);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Oui', 0, 1746);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'this.$router.push(url)', 1, 1762);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'this.$router.go(url)', 0, 1762);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'this.$router.change(url)', 0, 1762);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vue Router est incapable de gérer des routes dynamiques', 0, 1766);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'La concordance dynamique des routes n''est pas utilisée', 1, 1766);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Les paramètres doivent être définis dans des propriétés calculées', 0, 1766);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Le composant nécessite une propriété dans Data spéciale pour permettre le routage dynamique', 0, 1766);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '<router-view>', 0, 1767);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '<router-anchor>', 0, 1767);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '<router-link>', 1, 1767);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<router-url>', 0, 1767);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'this.$route.vars[''id'']', 0, 1768);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'this.$route.query.id', 0, 1768);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'this.$route.params.id', 1, 1768);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'this.$route.document.id', 0, 1768);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'function sayHello(text){
  const name = text;
  //print name
  console.log(`Hello ${name}`)
}', 1, 1769);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'function sayHello(text){
  const name = text;
  console.log(`Hello ${name}`)
}', 0, 1769);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Function@1fee6fc', 0, 1769);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Le code retourne une erreur', 0, 1769);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'class A { a(){return 1} }', 1, 1770);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Ce code retourne une TypeError car class n''est pas une fonction', 0, 1770);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '50', 1, 1771);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '10', 0, 1771);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ce code retourne une erreur', 0, 1771);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'null', 0, 1772);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '25', 1, 1772);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ce code retourne une erreur', 0, 1772);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'undefined', 0, 1772);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'null', 0, 1773);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '25', 1, 1773);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ce code retourne une erreur', 0, 1773);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'undefined', 0, 1773);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'console.log(adventurer.dog?.name);', 1, 1774);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'console.log(adventurer.dog ? adventurer.dog.name : undefined);', 1, 1774);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'console.log(adventurer.dog && adventurer.dog.name);', 0, 1774);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ce code n''a pas d''erreurs', 0, 1774);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Non', 0, 1775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Oui, en préfixant par #', 1, 1775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Oui, avec le mot-clé private', 0, 1775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les modules avec des dépendances cycliques ne compilent pas', 1, 1779);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Les packages avec des dépendances cycliques ne compilent pas', 0, 1779);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Une dépendance cyclique implique toujours exactement deux modules', 0, 1779);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Une dépendance cyclique implique toujours trois ou plus de modules', 0, 1779);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Une dépendance cyclique implique toujours au moins deux requires', 1, 1779);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Un module anonyme peut être impliqué dans une dépendance cyclique avec un module automatique', 0, 1779);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Un nouveau répertoire sera toujours créé', 0, 1813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un nouveau répertoire sera créé seulement si /mammal/kangaroo/ existe', 1, 1813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Si le code crée un répertoire, il sera accessible à /kang/joey', 1, 1813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Si le code crée un répertoire, il sera accessible à mammal/kangaroo/joey', 1, 1813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Le code ne compile pas', 0, 1813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Le code compile mais soulève une exception durant l''exécution ', 0, 1813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Il n''y a pas de différence', 0, 1834);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Promise.allSettled est plus performant que Promise.all', 0, 1834);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Il vaut mieux utiliser Promise.allSettled plutôt que Promise.all car plus récent', 0, 1834);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Promise.all renvoie un reject si une des promesse fail, alors que Promise.allSettled ne fail jamais', 1, 1834);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Promise.allSettled renvoie un reject si une des promesse fail, alors que Promise.all ne fail jamais', 0, 1834);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Ils répondent à des cas d''usages différents', 1, 1834);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '[{ status: "fulfilled", value: 3 },  { status: "rejected", reason: "foo" }]', 1, 1845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '"foo"', 0, 1845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '[{ status: "rejected", reason: "foo" }, { status: "fulfilled", value: 3 }]', 0, 1845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ce code retourne une erreur', 0, 1845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'On obtient un array, mais on ne peut pas prévoir le contenu', 0, 1845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'hash ', 1, 1848);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'history', 0, 1848);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'finished waiting', 1, 1850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Une Syntax Error  sera envoyée', 0, 1850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Rien ne sera affiché', 0, 1850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ce code tourne indéfiniment', 0, 1850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'finished waiting', 0, 1851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Une Syntax Error  sera envoyée', 1, 1851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Rien ne sera affiché', 0, 1851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ce code tourne indéfiniment', 0, 1851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'public void main(String[] args)', 0, 2008);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'public static void main()', 0, 2008);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'private static void start(String[] mydata)', 0, 2008);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'public static final void main(String[] mydata)', 1, 2008);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '.java', 0, 2009);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '.bytecode', 0, 2009);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '.class', 1, 2009);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '.dll', 0, 2009);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code does not compile because of lines 1 and 2', 0, 2010);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code does not compile because of line 4', 1, 2010);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile because of line 5', 0, 2010);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code compiles without issue', 0, 2010);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Objects are grouped as procedures, separate from the data they act on.', 1, 2011);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'An object can take many forms via casting.', 0, 2011);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'An object can hold data, referred to as attributes.', 0, 2011);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'An object can perform actions, via methods.', 0, 2011);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Interface variables', 0, 2012);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Class variables', 0, 2012);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Instance variables', 0, 2012);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Local variables', 1, 2012);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'java.util', 0, 2013);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'java.lang', 1, 2013);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'system.lang', 0, 2013);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'java.system', 0, 2013);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '// Add 5 to the result', 0, 2014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '/*** TODO: Fix bug 12312 ***/', 0, 2014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '# Add configuration value', 1, 2014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '/* Read file from system ****/', 0, 2014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It can only contain one class declaration.', 0, 2015);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It can contain one public class declaration and one public interface definition.', 0, 2015);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It must define at least one public class.', 0, 2015);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It may define at most one public class.', 1, 2015);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '2, 0, 1', 0, 2016);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '2, 2, 1', 1, 2016);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '1, 0, 1', 0, 2016);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '0, 2, 1', 0, 2016);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The class will not compile if it contains unused import statements.', 0, 2017);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Unused import statements can be removed from the class without causing a class to become unable to be compiled.', 1, 2017);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The class will not compile if a duplicate import statement is present.', 0, 2017);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'If a class contains an import statement for a class used in the program that cannot be found, it can still compile.', 0, 2017);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It does not compile', 1, 2018);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It compiles but throws an exception at runtime.', 0, 2018);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It compiles and outputs 5.', 0, 2018);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It compiles and outputs 15.', 0, 2018);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'I only', 0, 2019);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'III only', 0, 2019);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'II and III', 0, 2019);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None are true', 1, 2019);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'import widget.*;', 0, 2020);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '// Widget Manager', 0, 2020);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'package sprockets;', 0, 2020);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'int facilityNumber;', 1, 2020);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Every class is required to include a package declaration.', 0, 2021);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'To create a new package, you need to add a package.init file to the directory.', 0, 2021);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Packages allow you to limit access to classes, methods, or data from classes outside the package.', 1, 2021);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It is not possible to restrict access to objects and methods within a package.', 0, 2021);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'javac Manager
java Manager', 0, 2022);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'javac Manager.java
java Manager', 1, 2022);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'javac Manager
java Manager.class', 0, 2022);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'javac Manager.java
java Manager.class', 0, 2022);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'platform independence', 0, 2023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'object orientation', 0, 2023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'inheritance', 0, 2023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'encapsulation', 1, 2023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'i', 0, 2024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '55', 0, 2024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '56', 0, 2024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It does not compile', 1, 2024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It can be run on any computer with a compatible JVM.', 1, 2025);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It can only be executed on the same type of computer that it was created on.', 0, 2025);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It can be easily read and modified in a standard text editor.', 0, 2025);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It requires the corresponding .java that created it to execute.', 0, 2025);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'A colon (:)', 0, 2026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'An end-of-line character', 0, 2026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'A tab character', 0, 2026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A semicolon (;)', 1, 2026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code does not compile due to line 6.', 0, 2027);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code does not compile due to line 7.', 0, 2027);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '31', 1, 2027);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '61', 0, 2027);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Line 1', 0, 2028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Line 2', 0, 2028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Line 3', 1, 2028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Line 4', 0, 2028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Encapsulation', 0, 2029);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Object oriented', 0, 2029);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Inheritance', 0, 2029);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Platform independence', 1, 2029);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It prevents Java bytecode from being easily decoded/decompiled.', 1, 2030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It supports platform independence.', 0, 2030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It manages memory for the application.', 0, 2030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It translates Java instructions to machine instructions.', 0, 2030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Package variables', 0, 2031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Class variables', 1, 2031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Instance variables', 0, 2031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Local variables', 0, 2031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'television.actor.recurring.Marie', 0, 2032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'movie.directors.John', 0, 2032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'television.actor.Package', 1, 2032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'movie.NewRelease', 0, 2032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'import statements, package statement, class declaration', 0, 2033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'package statement, class declaration, import statement', 0, 2033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'class declaration, import statements, package declaration', 0, 2033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'package statement, import statements, class declaration', 1, 2033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Zero', 0, 2034);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 2034);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 2034);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 1, 2034);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'java forest.Deer deer 5 "White-tailed deer"', 0, 2035);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'java forest.Deer "White-tailed deer" deer 3', 0, 2035);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'java forest.Deer Red deer White-tailed deer', 1, 2035);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'java forest.Deer My "deer White-tailed"', 0, 2035);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The java command compiles a .java file into a .class file.', 0, 2036);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The javac command compiles a .java file into a .class file.', 1, 2036);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The java command compiles a .class file into a .java file.', 0, 2036);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The javac command compiles a .class file into a .java file.', 0, 2036);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Java is a procedural programming language.', 0, 2037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Java allows method overloading.', 1, 2037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Java allows operator overloading.', 0, 2037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Java allows direct access to objects in memory.', 0, 2037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'import, class, null', 0, 2038);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'import, interface, void', 0, 2038);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'package, int, int', 0, 2038);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'package, class, long', 1, 2038);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '2 5', 1, 2039);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '8 5', 0, 2039);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '6 5', 0, 2039);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 2039);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Inheritance requires that a class that extends another class be in the same package.', 0, 2040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The program must spend extra time/resources at runtime jumping through multiple layers of inheritance to determine precise methods and variables.', 0, 2040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Method signature changes in parent classes may break subclasses that use overloaded methods.', 0, 2040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Developers minimize duplicate code in new classes by sharing code in a common parent class. ', 1, 2040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '//////// Walk my dog', 1, 2041);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '#! Go team!', 0, 2041);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '/ Process fails at runtime /', 0, 2041);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of the above', 0, 2041);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'public static void main(String... arguments)', 0, 2042);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'public static void main(String arguments)', 1, 2042);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'public static final void main(String[] arguments)', 0, 2042);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'public static void main(String[] arguments)', 0, 2042);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'a1 and a3', 0, 2043);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'a2 and a4', 1, 2043);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'a2, a3, and a4', 0, 2043);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'a1, a2, a3, and a4', 0, 2043);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'A class declaration', 1, 2044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'A package statement', 0, 2044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'At least one import statement', 0, 2044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The public modifier', 0, 2044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '.jav', 0, 2045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '.class', 0, 2045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '.source', 0, 2045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '.java', 1, 2045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code does not compile because of line 2.', 0, 2046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code does not compile because of line 3.', 0, 2046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile because of line 6.', 1, 2046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code compiles without issue.', 0, 2046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'dog.puppy.female.KC', 1, 2047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'dog.puppy.Georgette', 0, 2047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'dog.Webby', 0, 2047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'java.lang.Object', 0, 2047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Encapsulation', 0, 2048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Object orientation', 1, 2048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Platform independence', 0, 2048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Polymorphism', 0, 2048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 1, 2049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1', 0, 2049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '2', 0, 2049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '3', 0, 2049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'true false', 0, 2050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'false false', 0, 2050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It does not compile.', 1, 2050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It compiles but throws an exception at runtime.', 0, 2050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code does not compile.', 0, 2051);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '5', 0, 2051);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '10', 0, 2051);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '20', 1, 2051);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'red', 0, 2052);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'purple', 1, 2052);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'blue', 0, 2052);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It does not compile', 0, 2052);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'I only', 0, 2053);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'II only', 0, 2053);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'I and II', 1, 2053);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'I, II and III', 0, 2053);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'true', 0, 2054);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'false', 0, 2054);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It does not compile', 0, 2054);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It compiles but throws an error at runtime.', 1, 2054);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The JVM schedules garbage collection on a predictable schedule.', 0, 2055);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The JVM ensures that the application will always terminate.', 0, 2055);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The JVM requires a properly defined entry point method to execute the application.', 1, 2055);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A Java compiled code can be run on any computer.', 0, 2055);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '<p>En utilisant les doubles moustaches : {{ rawHtml }}</p>', 0, 2119);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '<p>En utilisant la directive `v-html` : <span v-html="rawHtml"></span></p>', 1, 2119);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '<p>En utilisant les doubles moustaches : {{ rawHtml }}</p>', 1, 2120);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '<p>En utilisant la directive `v-html` : <span v-html="rawHtml"></span></p>', 0, 2120);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The Matrix', 1, 2154);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The Matrix Reloaded', 0, 2154);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Rien n''est affiché', 0, 2154);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'If host is not accessible , print:  "ZA"', 0, 2220);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'If host is not accessible , print:  "Z"', 0, 2220);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '  print:  "Connected to Oxyl"', 0, 2220);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'This code does not compile', 1, 2220);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Remove line 3, 7', 1, 2233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Remove line 7', 1, 2233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Remove line 5, 6', 1, 2233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Remove line 5', 0, 2233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Remove line 3, 6', 1, 2233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It will always print  _ab', 0, 2303);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It will always print either  _ab  or  _ba', 0, 2303);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It will print either  _ab  or  _a_b', 1, 2303);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It will print any of the following: 
_ab, _ba, _a_b,_b_a', 0, 2303);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'f3, f5', 0, 2563);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'f5', 0, 2563);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'f4, f5', 1, 2563);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'f1, f4, f5', 0, 2563);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'truefalse', 0, 2707);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'falsetrue', 0, 2707);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'falsefalse', 1, 2707);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'truetrue', 0, 2707);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'this code does not compile.', 0, 2707);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'You can call the default constructor written by the compiler using this().', 0, 2711);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'You can access a private constructor with the main() method.', 1, 2711);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'this() can be called from anywhere in a constructor.', 0, 2711);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'this() can be called from any instance method in the class.', 0, 2711);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'this.variableName can be called from any instance method in the class.', 1, 2711);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'this.variableName can be called from any static method in the class.', 0, 2711);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'You must include a default constructor in the code if the compiler does not include one.', 0, 2711);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Replace line 2 with this(2);', 0, 2713);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Replace line 1 with BirdSeed(2);', 0, 2713);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Replace line 2 with BirdSeed(2);', 0, 2713);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Replace line 1 with new BirdSeed(2);', 0, 2713);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Replace line 2 with new BirdSeed(2);', 0, 2713);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Replace line 1 with this(2);', 1, 2713);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'throw on line 5 and throw on line 6', 0, 2742);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'throw on line 5 and throws on line 6', 0, 2742);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'throws on line 5 and throw on line 6', 1, 2742);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'throws on line 5 and throws on line 6', 0, 2742);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'None of the above. SQLException is a checked exception and cannot be thrown.', 0, 2742);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'None of the above. SQLException is a runtime exception and cannot be thrown.', 0, 2742);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'TWF', 0, 2775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'TWDF', 0, 2775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TWDEF', 0, 2775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'TWF followed by an exception', 0, 2775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'TWDF followed by an exception', 0, 2775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'TWEF followed by an exception', 0, 2775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'The code does not compile.', 1, 2775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'TF', 0, 2791);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'TEF', 0, 2791);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TDWF', 0, 2791);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'TWDF', 1, 2791);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A compilation error is thrown.', 0, 2791);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'TWF', 0, 2795);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'TWDF', 0, 2795);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TWDEF', 0, 2795);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'TWF followed by an exception.', 0, 2795);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'TWDF followed by an exception.', 0, 2795);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'TWEF followed by an exception.', 0, 2795);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'The code does not compile.', 1, 2795);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'TWF', 0, 2813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'TWDF', 0, 2813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TWDEF', 1, 2813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'TWF followed by an exception.', 0, 2813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'TWDF followed by an exception.', 0, 2813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'TWEF followed by an exception.', 0, 2813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'The code does not compile.', 0, 2813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'TF', 0, 2814);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'TEF', 0, 2814);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TDWF', 0, 2814);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'TWDF', 1, 2814);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A compilation error is thrown.', 0, 2814);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'double num1, int num2 =0;', 1, 2836);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'int num1, num2 =0;', 0, 2836);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'int num1, num2;', 0, 2836);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'int num1 =0, num2 =0;', 0, 2836);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'class _Outside {}', 0, 2837);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'class 5MainSt {}', 1, 2837);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'class Cost$ {}', 0, 2837);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'class building {}', 0, 2837);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Call the convertToObject() method', 0, 2838);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Call the asObject() method', 0, 2838);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Call the toObject() method', 0, 2838);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Call the constructor of the wrapper class', 1, 2838);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None of the others', 1, 2839);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Call System.requireGc()', 0, 2839);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Call System.forceGc()', 0, 2839);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Call System.gc()', 0, 2839);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'double num = 2.718;', 0, 2840);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'double num = 2._718;', 1, 2840);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'double num = 2.7_1_8;', 0, 2840);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'They all compile', 0, 2840);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Creates a copy of an existing object and treats it as a new one', 0, 2841);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Instantiates a new object', 1, 2841);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Switches an object reference to a new one', 0, 2841);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Creates a new primitive', 0, 2841);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'short, int, byte, long', 0, 2842);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'short, byte, int, long', 0, 2842);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'byte, short, int, long', 1, 2842);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'int, short, byte, long', 0, 2842);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It can be used to read from bar', 0, 2843);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It can be used to write to bar', 0, 2843);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'bar is an instance variable', 0, 2843);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'bar is a local variable', 1, 2843);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'byte and char', 0, 2844);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'byte and int', 0, 2844);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'None of the others', 0, 2844);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'char and int', 1, 2844);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Integer', 0, 2845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'String', 1, 2845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Double', 0, 2845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Long', 0, 2845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'You can create your own primitives types', 0, 2846);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'String is a primitive', 0, 2846);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Primitive types can be set to null', 0, 2846);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Primitives types begin with a lowercase letter', 1, 2846);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'FooBar', 1, 2847);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'fooBar', 0, 2847);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'FOO_BAR', 0, 2847);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'F_o_o_B_a_r', 0, 2847);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'They can never be set from outside the class they are defined in.', 0, 2848);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'They can be set to null.', 1, 2848);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'They can only be set once per run of the program.', 0, 2848);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'They can only be set in the constructor.', 0, 2848);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'You can store a primitive directly into an ArrayList.', 0, 2849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'You can convert a wrapper class object to primitive by calling valueOf().', 0, 2849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'You can call methods on a primitive.', 0, 2849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'You can convert a primitive to a wrapper class object simply by assigning it.', 1, 2849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It defaults to an empty string.', 0, 2850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'it does not have a default value.', 0, 2850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It defaults to null.', 1, 2850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It will not compile without initializing on the declaration line.', 0, 2850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Object', 0, 2851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'int', 0, 2851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Integer', 1, 2851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Int', 0, 2851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Blue', 0, 2852);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'blue$', 0, 2852);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '2blue', 1, 2852);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '_blue', 0, 2852);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It may be called zero or more times.', 0, 2853);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It may be called one or more times.', 0, 2853);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It may be called exactly once', 0, 2853);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It may be called zero or one time', 1, 2853);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'char, double, float, bigint', 0, 2855);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'char, byte, float, double', 0, 2855);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'byte, char, float, double', 1, 2855);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'byte, char, double, float', 0, 2855);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Constructor, instance variables, method names', 0, 2856);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Method names, instance variables', 0, 2856);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Instance variables, constuctor, method names', 0, 2856);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'All orders are valid', 1, 2856);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It will not compile without initializing on the declaration line', 0, 2857);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It defaults to null', 0, 2857);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It does not have a default value', 1, 2857);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It defaults to an empty string', 0, 2857);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Creating an object with the current date
      - old way :  LocalDate d = LocalDate.now();
      - new way :  Date d = new Date();', 0, 2910);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Importing  
      - old way :  import java.util.*;
      - new way :  import java.time.*;', 1, 2910);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Creating an object with the current date and time              
      - old way :  Date d = new Date();
      - new way :  LocalDateTime dt = LocalDateTime.now();', 1, 2910);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Month indexes were always 1 based', 0, 2910);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'In Java 7 and  earlier,the Date class represented both the date and time', 1, 2910);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'lock.writeLock().acquire();
and
lock.writeLock().release();', 0, 2945);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'lock.writeLock().lock();
and
lock.writeLock().unlock();', 1, 2945);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'lock.acquire();
and
lock.release();', 0, 2945);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'lock.readLock().lock();
and
lock.readLock().unlock();', 0, 2945);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'lock.lock();
and
lock.unlock();', 0, 2946);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'lock.readLock();
and
lock.readUnlock();', 0, 2946);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'lock.read();
and
lock.unlock();', 0, 2946);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'lock.readLock().lock();
and
lock.readLock().unlock();', 1, 2946);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'int r = (int) (Math.random(1, 10));', 0, 2952);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'int r = ThreadLocalRandom.current().nextInt(1, 10);', 0, 2952);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'int r = ThreadLocalRandom.current().nextInt(1, 11);', 1, 2952);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'int r = ThreadSafeRandom.nextInt(1, 11);', 0, 2952);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'synchronize all access to the collection', 0, 2956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'make the collection variable final', 0, 2956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'make the collection variable final and volatile', 0, 2956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Wrap the collection into its synchronized version using Collections.synchronizedCollection()', 0, 2956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Encapsulate the collection into another class and use ReadWriteLock to manage read and write access', 1, 2956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'int count; at //1
AtomicInteger.increment(count); at //2', 0, 2958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'synchronized int count; at //1
count++ at //2', 0, 2958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'AtomicInteger count = 0; at //1
count++; at //2', 0, 2958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'AtomicInteger count = new AtomicInteger(0); at //1
count++; at //2', 0, 2958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'AtomicInteger count = new AtomicInteger(0); at //1
count.incrementAndGet(); at //2', 1, 2958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The worker threads in the ForkJoinPool extend java.lang.Thread and are created by a factory', 1, 2960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The worker threads in the ForkJoinPool implement Executor', 0, 2960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'One worker thread may steal work from another worker thread', 1, 2960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A ForkJoinPool can be viewed as a pool of workers in a circular queue', 0, 2960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The tasks submitted to a ForkJoinPool sit on the leaves of the task tree', 0, 2960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0 1', 1, 2962);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1 1', 0, 2962);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '0 0', 1, 2962);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '1 2', 0, 2962);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Exception at run time', 0, 2962);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Compilation error', 1, 2986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'null, 0', 0, 2986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Yuvraj, 36', 0, 2986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Text containing @ symbol', 0, 2986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Compilation error at Line 9', 0, 3024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Compilation error at Line 10', 0, 3024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Compilation error at Line 11', 0, 3024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Parent', 1, 3024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Outer.new Inner();', 0, 3028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Outer.innerPrint();', 1, 3028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'new Outer();', 1, 3028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Outer.Inner.innerPrint();', 0, 3028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'new Inner();', 0, 3028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Inner.innerPrint();', 0, 3028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'PreparedStatement allows BLOB and CLOB on all databases.', 0, 3066);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'PreparedStatement offers protection against SQL injection attacks.', 1, 3066);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'PreparedStatement allows transactions to span across multiple databases.', 0, 3066);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'PreparedStatement allows easier customization of joins at run time.', 0, 3066);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'When a JDBC Connection is created, it is in commit mode is undetermined.', 0, 3070);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'When a JDBC Connection is created, it is in auto-commit mode.', 1, 3070);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'When a JDBC Connection is created, its commit mode depends on the parameters used while creating the connection.', 0, 3070);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'When a JDBC Connection is created, its auto-commit feature is disabled.', 0, 3070);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Driver', 0, 3071);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Driver''s implementation', 1, 3071);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'DriverManager', 0, 3071);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'DriverManager''s implementation', 0, 3071);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Statement', 0, 3071);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Statement''s implementation', 1, 3071);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Connection parameters', 0, 3072);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Database name', 1, 3072);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'jdbc', 1, 3072);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Location of database', 0, 3072);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Port', 0, 3072);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Password', 0, 3072);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'jdbc: sybase: localhost: 1234/db', 1, 3073);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'jdbc: : sybase: : localhost: : /db', 0, 3073);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'jdbc: : sybase: : localhost: : 1234/db', 0, 3073);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'sybase: localhost: 1234/db', 0, 3073);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'sybase: : localhost: : /db', 0, 3073);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'sybase: : localhost: : 1234/db', 0, 3073);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'java.sql.Driver', 0, 3074);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'META-INF/java.sql.Driver', 0, 3074);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'META-INF/db/java.sql.Driver', 0, 3074);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'META-INF/database/java.sql.Driver', 0, 3074);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'META-INF/service/java.sql.Driver', 1, 3074);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 0, 3075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '2', 0, 3075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'There is a compiler error on line 6', 1, 3075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'There is a compiler error on line 9', 0, 3075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'There is a compiler error on another line', 0, 3075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'A runtime exception is thrown', 0, 3075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Calling Class.forName() is mandatory in JDBC 4.0', 0, 3076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Class.forName() throws a ClassNotFoundException if the driver class is not found', 1, 3076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Class.forName() throws a SQLException if the driver class is not found', 0, 3076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'DriverManager.getConnection() throws   a ClassNotFoundException if the driver class is not found', 0, 3076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'DriverManager.getConnection() throws   a SQLException if the driver class is not found', 1, 3076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'ResultSet.CONCUR_READ_ONLY', 0, 3077);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'ResultSet.CONCUR_UPDATABLE', 0, 3077);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ResultSet.TYPE_FORWARD_ONLY', 1, 3077);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'ResultSet.TYPE_REVERSE_ONLY', 0, 3077);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'ResultSet.TYPE_SCROLL_INSENSITIVE', 1, 3077);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'ResultSet.TYPE_SCROLL_SENSITIVE', 1, 3077);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'A ClassNotFoundException is thrown', 0, 3078);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'A NoSuchTypeException is thrown', 0, 3078);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'A SQLException is thrown', 0, 3078);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A TypeNotFoundException  is thrown', 0, 3078);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code will run without throwing an exception', 1, 3078);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'None of the above. The code will not compile', 0, 3078);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'execute, executeQuery, executeUpdate', 0, 3079);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'execute, executeUpdate, executeQuery', 1, 3079);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'executeQuery, execute, executeUpdate', 0, 3079);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'executeQuery, executeUpdate, execute', 0, 3079);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'executeUpdate, execute, executeQuery', 0, 3079);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'executeUpdate, executeQuery, execute', 0, 3079);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 0, 3080);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1', 0, 3080);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '5', 1, 3080);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 3080);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A SQLException is thrown', 0, 3080);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'A different exception is thrown', 0, 3080);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 0, 3081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1', 0, 3081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '5', 0, 3081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 1, 3081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A SQLException is thrown', 0, 3081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'A different exception is thrown', 0, 3081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Connection, ResultSet, Statement', 0, 3082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Connection, Statement, ResultSet', 0, 3082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ResultSet, Connection, Statement', 0, 3082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'ResultSet, Statement, Connection', 1, 3082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Statement, Connection, ResultSet', 0, 3082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Statement, ResultSet, Connection', 0, 3082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '100', 0, 3083);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '101', 0, 3083);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile', 0, 3083);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A SQLException is thrown', 1, 3083);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A different exception is thrown', 0, 3083);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'String s = rs.getString(0);', 0, 3084);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'String s = rs.getString(1);', 1, 3084);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'String s = rs.getObject(0);', 0, 3084);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'String s = rs.getObject(1);', 0, 3084);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Object s = rs.getObject(0);', 0, 3084);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Object s = rs.getObject(1);', 1, 3084);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'rs.getDate("d");', 0, 3085);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'rs.getLocalDate("d");', 0, 3085);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'rs.getLocalDateTime("d");', 0, 3085);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'rs.getLocalTime("d");', 0, 3085);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'rs.getTime("d");', 0, 3085);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'rs.getTimeStamp("d");', 1, 3085);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Anna', 0, 3086);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Betty', 0, 3086);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Cat', 0, 3086);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 3086);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A SQLException is thrown', 1, 3086);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'absolute()', 0, 3087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'afterFirst()', 0, 3087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'afterLast()', 1, 3087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'beforeFirst()', 1, 3087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'beforeLast()', 0, 3087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'previous()', 0, 3087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Anna', 1, 3088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Betty', 0, 3088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Cat', 0, 3088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 3088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A SQLException is thrown', 0, 3088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'A SQLException is thrown', 0, 3089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 3089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 3089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 1, 3089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 3089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Five', 0, 3089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'The code does not compile', 0, 3089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'One', 0, 3090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Two', 0, 3090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Three', 0, 3090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Four', 0, 3090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Five', 0, 3090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code does not compile', 1, 3090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'A SQLException is thrown', 0, 3090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vue.js est une bibliothèque JavaScript open source utilisée pour développer des interfaces utilisateur', 0, 3102);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Vue.js est un framework JavaScript front open source utilisé pour développer des interfaces utilisateur', 1, 3102);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Vue.js est une situation d''exécution JavaScript open source et multi-plateforme qui exécute le programme JavaScript en dehors d''un navigateur Web', 0, 3102);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Vue.js est une bibliothèque JavaScript conçue pour faciliter la traversée et l''administration de l''arborescence HTML DOM, la gestion des événements, l''activité CSS et Ajax', 0, 3102);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vue.js est appelé framework progressif car il nous permet de créer des interfaces utilisateur dynamiques et des applications web monopage', 0, 3103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Vue.js est appelé framework progressif car il suit les dernières normes JavaScript', 0, 3103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Vue.js est appelé framework progressif car il est continuellement modifié et développé.', 1, 3103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Toutes les propositions', 0, 3103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vue.js est une bibliothèque JavaScript qui crée des interfaces utilisateur pour les applications web monopage en divisant l''interface utilisateur en composants', 0, 3104);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Vue.js utilise le modèle MVVM pour lier des données à certains éléments DOM', 0, 3104);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Vue.js est un framework JavaScript dynamique fréquemment utilisé pour développer des interfaces utilisateur.', 1, 3104);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Toutes les propositions', 0, 3104);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'En utilisant CDN en incluant la balise <script> dans le fichier HTML', 0, 3105);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'En utilisant Node Package Manager (NPM)', 0, 3105);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'À l''aide de Bower', 0, 3105);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Toutes les propositions', 1, 3105);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vue.js est de très petite taille', 0, 3106);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'La documentation de Vue.js est très simple et complète', 0, 3106);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Vue.js est de nature flexible', 0, 3106);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Toutes les propositions', 1, 3106);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Un système de contrôle de version.', 1, 3143);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un langage de programmation.', 0, 3143);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Une plateforme de dépôt à distance', 0, 3143);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Un raccourcis pour "Github"', 0, 3143);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Faux', 1, 3144);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Vrai', 0, 3144);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git --version', 1, 3145);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'getGitVersion', 0, 3145);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git help version', 0, 3145);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'gitVersion', 0, 3145);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '--global', 1, 3146);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Rien de spécifique, c''est le comportement par défaut', 0, 3146);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '--all', 0, 3146);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '--A', 0, 3146);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git config user.email', 1, 3147);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git config email', 0, 3147);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git email.user', 0, 3147);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git add --all', 1, 3149);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git add --files', 0, 3149);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git add', 0, 3149);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git status', 1, 3150);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '--status', 0, 3150);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git config --status', 0, 3150);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git getStatus', 0, 3150);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git init', 1, 3151);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'initialize git', 0, 3151);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'start git', 0, 3151);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git start', 0, 3151);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Faux', 1, 3152);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Vrai', 0, 3152);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'l''historique n''est jamais effacé automatiquement', 1, 3153);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'tous les mois', 0, 3153);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'toutes les 2 semaines (la durée d''un sprint agile typique)', 0, 3153);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'chaque année', 0, 3153);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git commit', 1, 3154);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git com', 0, 3154);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git snapshot', 0, 3154);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git save', 0, 3154);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git commit -m "New email"', 1, 3155);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git commit message "New email"', 0, 3155);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git commit -mess "New email"', 0, 3155);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git commit -log "New email"', 0, 3155);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git log', 1, 3156);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git commits', 0, 3156);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git --full-log', 0, 3156);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git history', 0, 3156);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git commit -help', 1, 3157);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git commit readme', 0, 3157);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'gitHelp commit', 0, 3157);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git commitHelp', 0, 3157);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Une version séparée du dépôt principal', 1, 3158);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un petit bout de bois utilisé pour taper les commandes', 0, 3158);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Une partie secrète de Git config', 0, 3158);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Rien, c''est un terme inventé pour cette question', 0, 3158);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git branch new "new-email"  ', 0, 3159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git newBranch "new-email"', 0, 3159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git branch new-email', 1, 3159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git add branch "new-email"', 0, 3159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git checkout new-email', 1, 3160);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git branch -move new-email', 0, 3160);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git checkout branch new-email', 0, 3160);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git branch new-email', 0, 3160);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '-b', 1, 3161);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '-newbranch', 0, 3161);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '-all', 0, 3161);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '-new', 0, 3161);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git merge new-email', 1, 3162);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git add new-email', 0, 3162);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git commit -merge new-email', 0, 3162);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git branch -d new-email', 1, 3163);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git delete branch new-email', 0, 3163);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git delete new-email', 0, 3163);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git gone new-email', 0, 3163);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git push origin', 1, 3165);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git merge remote', 0, 3165);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git remote commit', 0, 3165);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git remote push', 0, 3165);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git fetch origin', 1, 3166);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git get log origin', 0, 3166);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git status remote origin', 0, 3166);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git origin help', 0, 3166);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git diff new-email', 1, 3167);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git log new-email', 0, 3167);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git status new-email', 0, 3167);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git changes new-email', 0, 3167);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'fetch et merge', 1, 3169);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'branch et checkout', 0, 3169);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'add et commit', 0, 3169);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'A la ligne 1, remplacer le blanc avec <>', 0, 3200);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'A la ligne 1, remplacer le blanc avec <T>', 1, 3200);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'A la ligne 1, remplacer le blanc avec <?>', 0, 3200);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A la ligne 3, remplacer le blanc avec <>', 1, 3200);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A la ligne 3, remplacer le blanc avec <T>', 0, 3200);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'A la ligne 3, remplacer le blanc avec <?>', 0, 3200);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'L''AOP permet de faire l''injection de dépendance ', 0, 3204);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'L''AOP permet de séparer les problématiques transverses (techniques) de la logique métier ', 1, 3204);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'L''AOP permet de mieux tester son application', 0, 3204);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '{1=10, 2=20}', 0, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '{1=10, 2=20, 3=null}', 0, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '{1=10, 2=20, 3=3}', 0, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '{1=13, 2=20}', 0, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '{1=13, 2=20, 3=null}', 0, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', '{1=13, 2=20, 3=3}', 1, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'Le code ne compile pas', 0, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('H', 'Le code lève une exception à l''exécution', 0, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'C''est un point d''exécution', 0, 3212);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', ' un module définissant des greffons et leurs points d''activation', 0, 3212);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'C''est la fonctionnalité qui est appliquée à l''aide d''AOP.', 1, 3212);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'mécanisme de liaison d''un aspect au programme', 1, 3217);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'une annotation', 0, 3217);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Aucune', 0, 3229);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', ';', 0, 3229);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', ':', 1, 3229);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'bind', 0, 3229);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Aucune', 0, 3230);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '@', 1, 3230);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', ':', 0, 3230);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'on', 0, 3230);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Aucune', 1, 3231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '@', 0, 3231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', ':', 0, 3231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', ';', 0, 3231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'model', 0, 3231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '.directive', 0, 3232);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '.once', 0, 3232);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '.capture', 0, 3232);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '.passive', 1, 3232);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '<a @click.prevent-once="dotask"></a>', 0, 3234);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '<a @click.once="dotask"></a>', 1, 3234);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '<a @click.prevent="dotask"></a>', 0, 3234);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<a @click.passive="dotask"></a>', 0, 3234);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Rien ne s''affiche', 0, 3246);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'a', 0, 3246);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'b', 0, 3246);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'a puis b', 1, 3246);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Une erreur apparait', 0, 3246);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'logMessage, a', 0, 3246);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Rien ne s''affiche', 0, 3247);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'a', 0, 3247);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'b', 0, 3247);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'a puis b', 0, 3247);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Une erreur apparait', 1, 3247);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'logMessage, a', 0, 3247);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Rien ne s''affiche', 0, 3249);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'a', 1, 3249);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'b', 0, 3249);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'a puis b', 0, 3249);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Une erreur apparait', 0, 3249);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'logMessage, a', 0, 3249);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Rien ne s''affiche', 1, 3250);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'a', 0, 3250);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'b', 0, 3250);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'a puis b', 0, 3250);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Une erreur apparait', 0, 3250);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'logMessage, a', 0, 3250);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Rien ne s''affiche', 0, 3252);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'a', 0, 3252);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'b', 0, 3252);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'ab', 0, 3252);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'aab', 1, 3252);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'logMessage, a', 0, 3252);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'aabb', 0, 3252);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Rien ne s''affiche', 0, 3268);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'abc', 0, 3268);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'bac', 0, 3268);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'acb', 1, 3268);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Une erreur survient', 0, 3268);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-cloak', 0, 3517);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-view', 1, 3517);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-memo', 0, 3517);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-pre', 0, 3517);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '@my-component', 0, 3518);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', ' v-my-component', 0, 3518);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-bind:my-component', 0, 3518);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<my-component></my-component>', 1, 3518);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Il permet d''utiliser très simplement Babel, TypeScript, ESLint, PostCSS, PWA, tests unitaires et tests end-to-end.', 1, 3519);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Il dispose d''un système de plugin permettant à la communauté de construire et de partager des solutions réutilisables pour des besoins communs.', 1, 3519);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Le code ES2015 natif peut être envoyé sans effort pour les navigateurs modernes. ', 1, 3519);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Il permet d''utiliser des composants à fichier unique (*.vue).', 1, 3519);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'mounted, beforeCreate, created, destroyed', 0, 3520);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'created, beforeUpdate, update, mounted', 0, 3520);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'mounted, created, beforeCreate, updated', 0, 3520);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'beforeMount, mounted, updated, destroyed', 1, 3520);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'create, mount, update, destroy', 0, 3521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'created, beforeMount, mounted, updated', 1, 3521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'created, beforeUpdate, update, mounted', 0, 3521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'mounted, created, beforeCreate, updated', 0, 3521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Ouvre l''éditeur REPL de Node', 1, 3522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Rien ne se passe', 0, 3522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Une erreur bash', 0, 3522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'created', 0, 3523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'didMount', 1, 3523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'beforeMount', 0, 3523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'mounted', 0, 3523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'created', 0, 3524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'beforeMount', 0, 3524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'willMount', 1, 3524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'mounted', 0, 3524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Ctrl+S', 0, 3525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Ctrl+R', 0, 3525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ctrl+D', 1, 3525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ctrl+C', 0, 3525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Ctrl+S', 0, 3526);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Ctrl+R', 0, 3526);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ctrl+D', 0, 3526);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ctrl+C', 1, 3526);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Non', 0, 3527);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Disponible nativement dans node', 0, 3527);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Cela nécessite d''importer le module repl', 1, 3527);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 0, 3528);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 1, 3528);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '3', 1, 3530);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Uncaught TypeError: Cannot read property ''length'' of undefined', 0, 3530);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Il est impossible de savoir ce qui sera affiché', 0, 3530);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '_ récupère les valeurs et les erreurs', 0, 3531);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '_error', 1, 3531);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Non', 0, 3531);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'npm install -g vue/cli', 0, 3606);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'npm install -g @vue/cli', 1, 3606);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'install -g @vue/cli', 0, 3606);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'install -g vue/cli', 0, 3606);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'vue-cli create my-project', 0, 3607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'vue-cli my-project create', 0, 3607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'vue my-project create', 0, 3607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'vue create my-project', 1, 3607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le code compile sans problème', 1, 3644);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Le code ne compile pas à cause de la ligne k2', 0, 3644);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Le code ne compile pas à cause de la ligne k3', 0, 3644);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les locks récupérés aux lignes k1 et k4 portent sur le même objet', 0, 3644);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'La classe protège correctement l''attribut tickets des race conditions', 0, 3644);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Au plus une instance de TicketManager sera créée dans une application qui utilise cette classe', 1, 3644);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 0, 3873);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 1, 3873);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'repl.start()', 1, 3876);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'repl.begin()', 0, 3876);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Il n''y a pas d''autres écritures équivalente', 0, 3876);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'new repl.start()', 0, 3876);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'new repl.begin()', 0, 3876);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 1, 3879);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 0, 3879);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Objet', 1, 3890);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Fonction', 0, 3890);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'help', 1, 3893);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'action', 1, 3893);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'description', 0, 3893);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'func', 0, 3893);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'configurable', 0, 3893);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'help', 1, 3895);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'action', 1, 3895);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'description', 0, 3895);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'func', 0, 3895);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'configurable', 0, 3895);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Il n''y a pas de debugger natif pour Node.JS, contrairement à un navigateur', 0, 3956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'node inspect <fileName>', 1, 3956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'node debug <fileName>', 0, 3956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'node dbg <fileName>', 0, 3956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Ecrire debugger; dans le code créé un breakpoint', 1, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Ecrire debugger(); dans le code créé un breakpoint', 0, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ecrire setBreapoint(); dans le code', 0, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ecrire setBreapoint; dans le mode REPL de la CLI', 0, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Ecrire setBreapoint(); dans le mode REPL de la CLI', 1, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Ecrire setBreapoint; dans le code', 0, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'Ecrire debugger(); dans le mode REPL de la CLI', 0, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('H', 'Ecrire debugger; dans le mode REPL de la CLI', 0, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'On ne peut pas', 0, 3958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'watch(''maVariable'') dans le code', 0, 3958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'watch(''maVariable'') dans le REPL de la CLI', 1, 3958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'new Buffer();', 0, 3959);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Buffer.from();', 1, 3959);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Buffer.alloc();', 1, 3959);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Buffer.malloc();', 0, 3959);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Buffer.allocUnsafe();', 1, 3959);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Buffer.alloc(); / Buffer.from();', 0, 3960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Buffer.alloc(); / Buffer.allocUnsafe();', 1, 3960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Buffer.allocUnsafe(); / Buffer.alloc();', 0, 3960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Buffer.from(); / Buffer.alloc();', 0, 3960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Buffer.allocUnsafe(); / Buffer.from(); ', 0, 3960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Buffer.from(); / Buffer.allocUnsafe();', 0, 3960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Buffer.from(); permet d''utiliser des sources extérieurs en paramètre et garde l''application sécurisée.', 1, 3961);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Buffer.from(); et Buffer.alloc(); sont complètement interchangeables.', 0, 3961);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Il faut préferrer Buffer.from(); à Buffer.alloc(); pour les allocations de nombres de bites', 0, 3961);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'VueX est un gestionnaire d''état et une bibliothèque pour des applications Vue.js.', 1, 3984);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'VueX est une commande utilisée en Vue.js.', 0, 3984);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'VueX est un composant de Vue.js.', 0, 3984);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'VueX est déjà inclus dans Vue.js, pas besoin de l''installer', 0, 3985);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'En utilisant un lien CDN dans une balise <script>', 1, 3985);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'En ligne de commande avec npm', 1, 3985);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'En ligne de commande avec yarn', 1, 3985);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le code retourne une erreur TypeError [ERR_INVALID_ARG_TYPE]', 1, 3986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Hello', 0, 3986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '{ type: ''Buffer'', data: [ 72, 101, 108, 108, 111 ] }', 0, 3986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<Buffer 48 65 6c 6c 6f>', 0, 3986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le code retourne une erreur TypeError [ERR_INVALID_ARG_TYPE]', 0, 3987);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Hello world', 0, 3987);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '{
  type: ''Buffer'',
  data: [
     72,   0, 101,  0, 108,   0, 108,
      0, 111,   0, 32,   0, 119,   0,
    111,   0, 114,  0
  ]
}', 0, 3987);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<Buffer 48 00 65 00 6c 00 6c 00 6f 00 20 00 77 00 6f 00 72 00>', 0, 3987);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Hello wor', 1, 3987);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le code retourne une erreur TypeError [ERR_INVALID_ARG_TYPE]', 0, 3988);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Hello', 0, 3988);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '{
  type: ''Buffer'',
  data: [
     72,   0, 101,  0, 108,   0, 108,
      0, 111
  ]
}', 1, 3988);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<Buffer 48 00 65 00 6c 00 6c 00 6f 00 20 00 77 00 6f 00 72 00>', 0, 3988);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le code retourne une erreur TypeError [ERR_INVALID_ARG_TYPE]', 0, 3989);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Hello', 0, 3989);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '{
  type: ''Buffer'',
  data: [
     72,   0, 101,  0, 108,   0, 108,
      0, 111
  ]
}', 0, 3989);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<Buffer 48 00 65 00 6c 00 6c 00 6f 00 20 00 77 00 6f 00 72 00>', 1, 3989);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 0, 3990);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 1, 3990);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le code retourne une erreur TypeError [ERR_INVALID_ARG_TYPE]', 0, 3991);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Hello', 1, 3991);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '{
  type: ''Buffer'',
  data: [
     72,   0, 101,  0, 108,   0, 108,
      0, 111
  ]
}', 0, 3991);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<Buffer 48 00 65 00 6c 00 6c 00 6f 00 20 00 77 00 6f 00 72 00>', 0, 3991);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'La synchronisation des données d''une application peut devenir trop complexe à mesure qu''une application se développe et s''étend. ', 1, 3994);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Cela nous permet de créer une source unique de vérité pour les données de notre application.', 1, 3994);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Elle garantit que toutes les copies de données sont indépendantes les unes des autres.', 0, 3994);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les composants de notre application doivent pouvoir accéder aux données et les mettre à jour, quel que soit leur emplacement dans la codebase.', 1, 3994);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le code retourne une erreur TypeError [ERR_INVALID_ARG_TYPE]', 0, 3996);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Hello', 0, 3996);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '<Buffer 61 61 61 61 61>', 1, 3996);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<Buffer 61 00 00 00 00>', 0, 3996);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le state', 0, 3997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Les getters', 0, 3997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Les actions', 0, 3997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les mutations', 1, 3997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le state', 0, 3999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Les getters', 0, 3999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Les actions', 1, 3999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les mutations', 0, 3999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Buffer.byteLength(buff)', 1, 4000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Buffer.biteLength(buff)', 0, 4000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'buff.length()', 0, 4000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Buffer.length(buff)', 0, 4000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'buff.byteLength()', 0, 4000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'buff.biteLength()', 0, 4000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'trigger', 0, 4002);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'commit', 1, 4002);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'initiate', 0, 4002);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'call', 0, 4002);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '...mapActions()', 1, 4023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '...generateActions()', 0, 4023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '...listActions()', 0, 4023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '...getActions()', 0, 4023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'H', 0, 4024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'undefined', 0, 4024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '72', 1, 4024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 1, 4025);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 0, 4025);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Objet', 0, 4026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'TypedArray', 0, 4026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Uint8Array', 1, 4026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Array', 0, 4026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Aucune équivalence', 0, 4026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Hello world, Iello world', 0, 4030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Iello world, Iello world', 1, 4030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TypeError', 0, 4030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Iello world, Hello world', 0, 4030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Hello world, Iello world', 1, 4031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Iello world, Iello world', 0, 4031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TypeError', 0, 4031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Iello world, Hello world', 0, 4031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'un getter', 0, 4033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'une mutation', 0, 4033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'une action', 1, 4033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'true', 0, 4035);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'false', 1, 4035);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Hello', 0, 4037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', ' world', 1, 4037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Hello world', 0, 4037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'TypeError', 0, 4037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '?????', 1, 4038);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', ' !!!!!', 0, 4038);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TypeError', 0, 4038);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '12', 0, 4044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '2', 1, 4044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '3', 0, 4044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '4', 0, 4044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '2', 0, 4045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '12', 1, 4045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Rien un exception est loggée', 0, 4045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Le code ne compile pas', 0, 4045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '--in around aop
--in before aop', 1, 4046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '--in before aop
--in around aop', 0, 4046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '--in around aop', 0, 4046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '--in before aop', 0, 4046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '--in around aop
--in before aop', 0, 4047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '--in before aop
--in around aop', 0, 4047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '--in around aop', 1, 4047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '--in before aop', 0, 4047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Before', 1, 4048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Pointcut', 0, 4048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'AfterReturn', 0, 4048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'After', 1, 4048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Around', 1, 4049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Aspect', 0, 4049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'AfterReturning', 1, 4049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'AfterThrow', 0, 4049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Around', 1, 4050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Aspect', 0, 4050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'AfterResult', 0, 4050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'AfterThrowing', 1, 4050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 1, 4051);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 0, 4051);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 0, 4052);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 1, 4052);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'buff.values()', 1, 4053);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'buff.entries()', 1, 4053);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'buff.keys()', 1, 4053);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'buff1.equals(buff2)', 1, 4054);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Buffer.equals(buff1, buff2)', 0, 4054);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'buff1 === buff2', 0, 4054);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'AfterReturning', 0, 4088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Before', 0, 4088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'After', 0, 4088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Around', 1, 4088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Rien, le contexte démarre normalement', 0, 4089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Une exception est lancée et le contexte démarre normalement', 1, 4089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Une exception est lancée et le programme s''arrête', 0, 4089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Aucune proposition au dessus', 0, 4089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '@EnableAspect', 0, 4090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '@Pointcut', 1, 4090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '@Around', 1, 4090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '@Between', 0, 4090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '@Before', 1, 4090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', '@AfterReturning', 1, 4090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'AfterSuccess', 0, 4103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'AfterReturning', 1, 4103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'AfterThrowing', 0, 4103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'After', 0, 4103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git show -blame index.html', 0, 4109);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git blame index.html', 1, 4109);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git show --blame index.html', 0, 4109);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git show -b index.html', 0, 4109);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git push --set-remote origin feature', 0, 4112);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git push --force', 0, 4112);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git push --set-upstream origin feature', 1, 4112);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git push --upstream origin feature', 0, 4112);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git checkout', 0, 4113);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git pull', 0, 4113);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git pull --offline', 0, 4113);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git fetch', 1, 4113);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Clone', 0, 4114);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Fork', 0, 4114);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Pull request', 1, 4114);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Notify', 0, 4114);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git revert', 1, 4115);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git reset', 0, 4115);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git undo', 0, 4115);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git commit --undo', 0, 4115);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '-m', 1, 4116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '-a', 0, 4116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '-i', 0, 4116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '-l', 0, 4116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Elle commite les changements locaux vers le dépôt distant en omettant la “staging area” ', 0, 4117);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Elle commite les changements locaux vers la staging area', 0, 4117);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Elle commite les changements de la staging area vers le dépôt distant', 0, 4117);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Elle commite les changements de la staging area vers le dépôt local', 1, 4117);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les branches permettent de travailler indépendamment sur différents bugs ou fonctionnalités en parallèle', 1, 4118);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Vous pouvez créer de multiples branches locales et ne pousser que certaines d’entre elles vers le dépôt distant', 1, 4118);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Vous pouvez créer de multiples branches mais vous devez merger sur master avant de basculer d’une branche à l’autre', 0, 4118);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les fichiers du premier commit de la branche master du dépôt distant', 0, 4119);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'La dernière version des fichiers de la branche master du dépôt distant', 1, 4119);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Aucun fichier n’est récupéré, seul un dépôt vide est créé', 0, 4119);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'La dernière version des fichiers de la branche la plus récente du dépôt distant', 0, 4119);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'document.md', 0, 4120);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'README.md', 1, 4120);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'introduction.md', 0, 4120);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'README.doc', 0, 4120);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git reset --hard HEAD~4', 0, 4121);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git reset --hard HEAD~~', 0, 4121);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git reset --hard HEAD~3', 1, 4121);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git reset --hard HEAD~2', 0, 4121);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le premier git commit effectué après git init crée une branche master', 0, 4122);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'C’est une commande que l’on exécute une seule fois pour initialiser un dépôt Git', 1, 4122);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Elle doit être exécutée à chaque changement de branche', 0, 4122);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Elle crée un nouveau répertoire .init dans votre répertoire de travail courant', 0, 4122);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Elle liste l’historique des commits de origin', 0, 4123);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Elle liste les utilisateurs qui ont travaillé sur le dépôt distant', 0, 4123);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Elle donne l’URL du dépôt distant', 1, 4123);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Elle liste l’ensemble des références distantes qui ont été pullées', 1, 4123);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'ApplicationContext est une classe qui étends BeanFactory', 0, 4127);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'BeanFactory est une classe qui étends ApplicationContext', 0, 4127);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ApplicationContext est une interface qui étends BeanFactory', 1, 4127);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'BeanFactory est une interface qui étends ApplicationContext', 0, 4127);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'BeanFactory charge les beans à la demande', 1, 4128);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'BeanFactory charge les beans au démarrage de l''application', 0, 4128);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ApplicationContext charge les beans à la demande', 0, 4128);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'ApplicationContext charge les beans au démarrage de l''application', 1, 4128);

