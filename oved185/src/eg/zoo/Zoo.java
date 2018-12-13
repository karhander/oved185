package eg.zoo;

public class Zoo {
	public static void main(String[] args) {
		Cage<Rhino> rhinos = new Cage<>(3);
		System.err.println(rhinos);
	}
}
