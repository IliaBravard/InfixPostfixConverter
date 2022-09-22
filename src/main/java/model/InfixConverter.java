package model;

/**
 * @author Ilia Bravard - igbravard
 * CIS175 - Fall 2022
 * Sep 22, 2022
 */

import java.util.Stack; // Allows for the use of the built-in stack data structure

/**
 * This class is the model class that converts a postfix expression to an infix
 * expression.
 */
public class InfixConverter {

	// The fields of the class
	private Stack<String> infixStack;
	private String pExpression;

	/**
	 * This is the default no-argument constructor.
	 */
	public InfixConverter() {
	}

	/**
	 * This is the non-default constructor that sets the fields of this class
	 * 
	 * @param expression - the postfix expression to be converted
	 */
	public InfixConverter(String expression) {
		setInfixStack(new Stack<>());
		setpExpression(expression);
	}

	// Generating the needed accessors and mutators for this class
	public Stack<String> getInfixStack() {
		return infixStack;
	}

	public void setInfixStack(Stack<String> infixStack) {
		this.infixStack = infixStack;
	}

	public String getpExpression() {
		return pExpression;
	}

	public void setpExpression(String pExpression) {
		this.pExpression = pExpression;
	}

	/**
	 * This method converts a postfix expression to an infix expression
	 * 
	 * @return the converted infix expression
	 */
	public String convertPostfix() {
		String postfix = this.getpExpression();
		String infix = "";
		for (int i = 0; i < postfix.length(); i++) { // For each character in the postfix expression ...
			char ch = postfix.charAt(i);

			if (Character.isLetterOrDigit(ch)) { // Checks whether the current character is an operand
				infixStack.push(ch + ""); // If it is, push it immediately on to the stack
			} else { // Else, evaluate the expression and push it on to the stack
				String op1 = infixStack.pop();
				String op2 = infixStack.pop();
				infixStack.push("(" + op2 + ch + op1 + ")"); // Adding the round brackets
			}
		}
		infix += infixStack.pop(); // Returns the whole expression
		setpExpression(infix);
		return this.getpExpression();
	}

	/**
	 * This method validates the user's infix expression.
	 * 
	 * @return true - the expression is good for converting; false otherwise
	 */
	public boolean validateInput() {
		boolean isValid;
		String input = this.getpExpression();

		// Checks whether the infix expression contains any spaces
		if (!input.matches("\\S+")) {
			isValid = false;

			// Checks whether the entered infix contains at least one of the allowed
			// arithmetic operators
		} else if (!(input.contains("+") || input.contains("-") || input.contains("*") || input.contains("/"))) {
			isValid = false;

			// Checks whether any other type of brackets are entered other than rounded
			// brackets
		} else if (input.contains("{") || input.contains("[") || input.contains("]") || input.contains("}")) {
			isValid = false;

			// Checks whether the user entered invalid operators based on the application
			// rules
		} else if (input.contains("^") || input.contains("%")) {
			isValid = false;
		} else {
			isValid = true;
		}
		return isValid;
	}
}