package eg.zoo;

public class Zebra extends Animal{
	public Zebra(String name) {
		super(name);
	}

	@Override
	public String toString() {
		return "[Zebra " + getName() + "]";
	}
}
