package karolina.zoo;

public class Rhino extends Animal{
	public Rhino(String name) {
		super(name);     //we can do like this or create an empty constructor in the animal class; the empty constructor  or this serves to create a new animal that extends the class Animal
						//super serves for referring to the principal class which is Animal in this case
	}
	
	@Override
	public String toString() {
		return "[Rhino " + getName() + "]";
	}

}
