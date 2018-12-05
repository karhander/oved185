package karolina.zoo;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class RhinoTest {

	@Test
	void rhinoNameJoe() {    //we are checking if the new rhino that we created is called Joe
		Rhino joe = new Rhino("Joe");  //create a new rhino
		assertEquals("Joe", joe.getName());
		
	}

}
