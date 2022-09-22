package controller;

/**
 * @author Ilia Bravard - igbravard
 * CIS175 - Fall 2022
 * Sep 22, 2022
 */

import java.io.IOException;
import java.io.PrintWriter; // Allows for the use of the print writer class

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; // Allows for the use of the model class

import model.InfixConverter;

/**
 * Servlet implementation class getInfixServlet
 */

//This annotation/metadata indicates that this class should be handled as a Java servlet in the form of getPostfixServlet
@WebServlet("/getInfixServlet")
public class getInfixServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public getInfixServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pExpression = request.getParameter("postfix"); // Gets the input from the user

		InfixConverter userExpression = new InfixConverter(pExpression);

		PrintWriter writer = response.getWriter(); // Using the PrintWriter to showcase the results

		if (userExpression.validateInput() == false) { // Checks for user validaton
			getServletContext().getRequestDispatcher("/error.jsp").forward(request, response); // Redirecting the server
																								// to another page
		} else { // Else, show the solution
			request.setAttribute("iExpression", userExpression);
			getServletContext().getRequestDispatcher("/solution2.jsp").forward(request, response);
			writer.println(userExpression.convertPostfix());
			writer.close();
		}
	}
}