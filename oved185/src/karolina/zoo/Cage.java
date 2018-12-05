package karolina.zoo;

import java.util.Set;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Optional;

public class Cage<T extends Animal> { // T means Template, its advantage is that when you instantiate you just write Rhinos and JVM knows that in that cage there can be only rhinos; this way we dont have to do checks when we add animals to the cage if they can be there or not
	static int lastId = 0;  //contatore, mi tiene traccia del ultimo oggetto creato
	
	private Set<T> guests;   //set mette le cose insieme, pero non ordinato (array invece e ordinato)
	
	private int id;
	private int max;
	
	public Cage(int id, int max) {   //this methods creates a new cage
		guests = new HashSet<>();  //understands that guests is a set of Animal, there is no need to specify the type of the HashSet
		lastId += 1;      //means same as ++
		this.id = lastId;
		this.max = max;  //it means that max on the left takes the value of the max in arguments; we could write e.g. mymax = max, means that mymax takes the value of the argument max, but as of convention we write this.max = max; if we wrote max = max it wouldn't mean anything, that's why we write this. or change name completely (if you wish, not a convention, not advised) to distinguish between them 
	}
	
	public int getId() {  //id is private for this class, getter makes it accessible for other classes
		return id;
	}
	
	public boolean add(T animal) {    //adds animal to the cage
		if(max == guests.size()) {
			return false;
		}
		guests.add(animal);
		return true;
	}
	
	public Optional<T> remove(String name) {  //it's like a small container, which can be only 0 (empty), or 1(of); if there is the thing I'm looking for, it gives me 1; if there's not, it gives me 0
		Iterator<T> it = guests.iterator();  //iterator is something like pointer that gets initialized just before the first element in the collection
		while(it.hasNext()) { 				//I do a loop while; if there is the successor, it returns me a value associated with the location (it.next); when it arrives to the last one it returns false, all finished
			T animal = it.next();
			if(animal.getName().equals(name)) {  //if I found a name I am looking for, it removes it
				guests.remove(animal);
				return Optional.of(animal);
			}
		}
		
		return Optional.empty();
	}
	
	@Override  //it's not born in this class, but overrides a method already existing in the other class
		public String toString() {
			return "{Cage " + id + ": " + guests + "}"; 
		}
	
	
	
}
