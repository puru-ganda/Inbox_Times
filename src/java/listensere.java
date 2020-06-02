import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class listensere implements ServletContextListener {
    Connection co;
   
    public void contextInitialized(ServletContextEvent e) {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            co=DriverManager.getConnection("jdbc:mysql://localhost:3306/emaild","root",null);
        } catch(Exception ee)
        {
            System.out.print("the exception is.."+ee);
        }
        ServletContext sc=e.getServletContext();
        sc.setAttribute("con",co);
    }

    
    public void contextDestroyed(ServletContextEvent e) {
        try
        {
            co.close();
        } catch(Exception eee)
        {
            System.out.print("exception is "+eee);
        }
    }
}
