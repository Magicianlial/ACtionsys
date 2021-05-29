package communication;

import mosquittoClient.ClientMQTT;
import java.util.ArrayList;
import java.util.Iterator;

public class Main {

	public static void connect() {
		
	    ClientMQTT client = new ClientMQTT();
		client.start();
//		JDBC mySQL=new JDBC();
//		mySQL.mySQL();
//		String result = mySQL.getData("SELECT * from category_manage","category");//查询语句
//		mySQL.close();
//		System.out.println(result);
	}
	public static void disconnect() {
		System.out.println("4");
	    ClientMQTT client = new ClientMQTT();
		client.disconnect();
//		JDBC mySQL=new JDBC();
//		mySQL.mySQL();
//		String result = mySQL.getData("SELECT * from category_manage","category");//查询语句
//		mySQL.close();
//		System.out.println(result);
	}
}
