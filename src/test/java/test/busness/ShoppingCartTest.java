package test.busness;

import org.junit.Before;
import org.junit.Test;
import org.junit.Assert;

import business.shoppingCart.IShoppingCart;
import business.shoppingCart.ShoppingCartImpl;

public class ShoppingCartTest {

	IShoppingCart shoppingCart;

	private static final String NAME = "productName";
	private static final String CATEGORY = "productCategory";

	@Before
	public void setUp() {
		shoppingCart = new ShoppingCartImpl();
	}

	@Test
	public void testAddProduct() {
		// when
		shoppingCart.addProduct(NAME, CATEGORY, (float) 20.2, 3);

		// then
		Assert.assertEquals("the actual amount of purchase should be 60.6", 60.6, shoppingCart.getSubtotal(), 0.0001);
	}

}
