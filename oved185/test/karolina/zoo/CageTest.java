package karolina.zoo;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Optional;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;


class CageTest {
	static Cage<Rhino> firstRhinoCage;
	static Cage<Zebra> firstZebraCage;
	
	@BeforeAll
	public static void initializer() {
		firstRhinoCage = new Cage<>(3);
		firstZebraCage = new Cage<>(2);
	}
	
	@Test
	void idFirst() {
		assertEquals(1, firstRhinoCage.getId());
		assertEquals(2, firstZebraCage.getId());
	}

	@Test
	void tooManyAnimals() {
		Cage<Rhino> cage = new Cage<>(2);
		assertTrue(cage.add(new Rhino("a"))); //I construct a new rhino a, add it to the cage, assertTrue means I can add it because the capacity of the cage allows me for it; 
		assertTrue(cage.add(new Rhino("b")));
		assertFalse(cage.add(new Rhino("c"))); //assertFalse because I cant add a 3rd animal anymore; I'm checking here if the program works right
	
	/*or also:
	 *  Rhino rhino = new Rhino("a");
	 *  cage.add(rhino);
	 *  assert
	 */
	
	
	}
	
	@Test
	/**
	 * check if an inserted animal could be removed
	 */
	void addAndRemove() {
		Cage<Rhino> cage = new Cage<>(2);   	//create a new cage that can contain max 2 animals
		assertTrue(cage.add(new Rhino("a")));   //we added our rhino a
		Optional<Rhino> rhino = cage.remove("a");  //remove added rhino from the cage
		assertTrue(rhino.isPresent());  //makes me sure, that there is a rhino inside the cage
		assertEquals("a", rhino.get().getName());
	}
	
	@Test
	/**
	 * check if removal of an animal not in cage fails
	 */
	void removeNegative() {
		Cage<Rhino> cage = new Cage<>(2);
		Optional<Rhino> rhino = cage.remove("b");
		assertFalse(rhino.isPresent());
	}
	

}
