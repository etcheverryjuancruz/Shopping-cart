package test.controller;

import java.sql.SQLException;
import java.util.Hashtable;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.test.util.ReflectionTestUtils;

import controller.MainController;
import dbConnection.SQLConnection;
import models.UserModel;

@RunWith(MockitoJUnitRunner.class)
public class MainControllerTest {
	@InjectMocks
	MainController mainController = new MainController();

	@Mock
	Hashtable<String, String> sessions;

	@Mock
	private static SQLConnection sql;

	@Mock
	private UserModel mockedUser;

	private static final String MOCKEDNICKNAME= "mockedNickName";
	private static final String MOCKEDPASSWORD = "mockedPassword";

	@Before
	public void setUp() throws SQLException {
		mockedUser= Mockito.mock(UserModel.class); 
		sql = Mockito.mock(SQLConnection.class);
		Mockito.when(sql.findUser(Mockito.anyString())).thenReturn(mockedUser);
		Mockito.when(mockedUser.getPassword()).thenReturn(MOCKEDPASSWORD);
		ReflectionTestUtils.setField(mainController, "sql", sql);
	}

	@Test
	public void testLogin() throws Exception {
		// given
		UserModel user = new UserModel();
		user.setPassword(MOCKEDPASSWORD);
		user.setNickName(MOCKEDNICKNAME);

		// when
		String result = mainController.login(user);

		// then
		Assert.assertNotNull("the result should be not null", result);
	}

	@Test
	public void testLoginFail() throws Exception {
		// given
		UserModel user = new UserModel();
		user.setPassword(MOCKEDPASSWORD);
		user.setNickName(MOCKEDNICKNAME);
		Mockito.when(mockedUser.getPassword()).thenReturn("anotherPassword");
		// when
		String result = mainController.login(user);

		// then
		Assert.assertNull("the resutl should be null", result);

	}
	
}
