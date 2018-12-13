package eg.zoo;

public class Rhino extends Animal {
	public Rhino(String name) {
		super(name);
	}

	@Override
	public String toString() {
		return "[Rhino " + getName() + "]";
	}
}
