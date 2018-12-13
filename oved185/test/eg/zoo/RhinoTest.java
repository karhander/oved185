package eg.zoo;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class RhinoTest {

	@Test
	void bobIsBob() {
		Rhino bob = new Rhino("bob");
		assertEquals("bob", bob.getName());
	}

}
