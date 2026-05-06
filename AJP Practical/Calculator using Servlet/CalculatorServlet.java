import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CalculatorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            String n1Str = request.getParameter("txtN1");
            String n2Str = request.getParameter("txtN2");
            String operation = request.getParameter("opr");
            
            double n1 = Double.parseDouble(n1Str);
            double n2 = Double.parseDouble(n2Str);
            double result = 0;
            String opName = "";
            
            if (operation.equals("+")) {
                result = n1 + n2;
                opName = "ADDITION";
            } else if (operation.equals("*")) {
                result = n1 * n2;
                opName = "MULTIPLICATION";
            } else if (operation.equals("/")) {
                if (n2 == 0) {
                    out.print("<h3 style='color:red;'>Error: Cannot divide by zero!</h3>");
                    out.print("<a href='calc.html'>Go Back</a>");
                    return;
                }
                result = n1 / n2;
                opName = "DIVISION";
            } else if (operation.equals("-")) {
                result = n1 - n2;
                opName = "SUBTRACTION";
            }
            
            out.print("<!DOCTYPE html>");
            out.print("<html>");
            out.print("<head>");
            out.print("<meta charset='ISO-8859-1'>");
            out.print("<title>Calculator Result</title>");
            out.print("<style>");
            out.print("body { font-family: Arial; margin: 50px; background-color: #f4f4f4; }");
            out.print(".container { background-color: white; padding: 30px; border-radius: 5px; width: 400px; }");
            out.print("a { background-color: #4CAF50; color: white; padding: 10px 20px; text-decoration: none; border-radius: 4px; display: inline-block; margin-top: 20px; }");
            out.print("a:hover { background-color: #45a049; }");
            out.print("</style>");
            out.print("</head>");
            out.print("<body>");
            out.print("<div class='container'>");
            out.print("<h2>Calculator Result</h2>");
            out.print("<p><strong>First Number:</strong> " + n1 + "</p>");
            out.print("<p><strong>Second Number:</strong> " + n2 + "</p>");
            out.print("<p><strong>Operation:</strong> " + opName + "</p>");
            out.print("<h3 style='color: green;'><strong>Result:</strong> " + result + "</h3>");
            out.print("<a href='calc.html'>Calculate Again</a>");
            out.print("</div>");
            out.print("</body>");
            out.print("</html>");
            
        } catch (NumberFormatException e) {
            out.print("<h3 style='color:red;'>Error: Please enter valid numbers!</h3>");
            out.print("<a href='calc.html'>Go Back</a>");
        } catch (Exception e) {
            out.print("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
            out.print("<a href='calc.html'>Go Back</a>");
        } finally {
            out.close();
        }
    }
}
