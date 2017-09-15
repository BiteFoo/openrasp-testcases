package person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class FastJsonServlet extends HttpServlet {

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {
        String rootPath = request.getSession().getServletContext().getRealPath("");
        Poc.run(rootPath);
        PrintWriter out = response.getWriter();
        String resultString = "fast json test";
        out.println(resultString);
    }

}
