package test.controller;



import java.sql.SQLException;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.test.util.ReflectionTestUtils;

import controller.UserController;
import dbConnection.SQLConnection;
import models.UserModel;

@RunWith(MockitoJUnitRunner.class)
public class UserControllerTest {
	@InjectMocks
	UserController userController;
	

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
		ReflectionTestUtils.setField(userController, "sql", sql);
	}
	
	@Test
	public void test() throws SQLException {
		//given
		Mockito.when(sql.findUser(MOCKEDNICKNAME)).thenReturn(mockedUser);
		
		//when
		UserModel user = userController.userByNickName(MOCKEDNICKNAME);
		
		//then
		Assert.assertEquals(mockedUser.getPassword(), user.getPassword());
		
	}
	
	
}
