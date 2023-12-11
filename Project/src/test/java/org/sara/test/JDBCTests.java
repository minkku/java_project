package org.sara.test;

import static org.junit.Assert.fail;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void testConnection() {
		try (
			Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/sara",
				"root",
	            "ezen1234")) {
			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}