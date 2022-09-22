package model;

/**
 * @author Ilia Bravard - igbravard
 * CIS175 - Fall 2022
 * Sep 22, 2022
 */

import java.util.Stack; // Allows for the use of the built-in stack structure

/**
 * This class is the model class that converts a postfix expression to an infix
 * expression.
 */
public class PostfixConverter {

	private Stack<String> postfixStack; // Instantiating a new object from the stack constructor
	private String iExpression; // Holds the postfix expression
	private boolean isValid;

	/**
	 * This is the default, no-argument constructor.
	 */
	public PostfixConverter() {
	}

	/**
	 * This is the non-default constructor that initializes the fields of this
	 * class.
	 * 
	 * @param expression - the user-entered infix expression
	 */
	public PostfixConverter(String expression) {
		setPostfixStack(new Stack<>());
		setiExpression(expression);
		setValid(false);
	}

	// Generating the needed accessors and mutators
	public String getiExpression() {
		return iExpression;
	}

	public void setiExpression(String iExpression) {
		this.iExpression = iExpression;
	}

	public Stack<String> getPostfixStack() {
		return postfixStack;
	}

	public void setPostfixStack(Stack<String> postfixStack) {
		this.postfixStack = postfixStack;
	}

	public boolean isValid() {
		return isValid;
	}

	public void setValid(boolean isValid) {
		this.isValid = isValid;
	}

	/**
	 * This method determines the method that should be invoked based on the
	 * character value searched at a given iteration.
	 * 
	 * @return the converted postfix expression
	 */
	public String convertInfix() {
		int precedenceValue; // Holds the precedence value for each operator
		String input = this.getiExpression();
		setiExpression(""); // Refreshes the contents of the pExpression instance variable
		for (int i = 0; i < input.length(); i++) { // For each character in the user-entered string, ...
			char currentCharacter = input.charAt(i);

			switch (currentCharacter) {
			case '+':
			case '-':
				precedenceValue = 1; // To avoid magic numbers
				checkOperators(currentCharacter, precedenceValue);
				break;
			case '*':
			case '/':
				precedenceValue = 2;
				checkOperators(currentCharacter, precedenceValue);
				break;
			case '(': // A left bracket is pushed immediately on to the stack
				postfixStack.push(Character.toString(currentCharacter));
				break;
			case ')':
				checkRightParenthesis(currentCharacter);
				break;
			default: // Any operand is added immediately to the postfix expression
				iExpression += currentCharacter;
				break;
			}
		}

		// Flushing the remaining stack content operators
		while (!postfixStack.isEmpty()) {
			iExpression += postfixStack.pop();
		}
		return iExpression; // Returns the converted expression
	}

	/**
	 * This method determines what should be done when a closing parenthesis is
	 * found in the infix expression.
	 * 
	 * @param parenthesis - the right parenthesis to be checked by the method
	 */
	public void checkRightParenthesis(char parenthesis) {
		while (!postfixStack.isEmpty()) {
			String poppedItem = postfixStack.pop(); // Pops the current operator
			if (poppedItem.equals("(")) {
				break; // Terminates the loop if an open parenthesis is found
			} else {
				iExpression += poppedItem; // Else, writes the popped item to the output
			}
		}
	}

	/**
	 * This method determines the action that should be taken when the found
	 * character is an allowed arithmetic operator (+, -, *, or /).
	 * 
	 * @param operator - the character to be checked by the method
	 */
	public void checkOperators(char operator, int precedenceLevel) {
		while (!postfixStack.isEmpty()) {
			String poppedItem = postfixStack.pop();
			if (poppedItem.equals("(")) { // Restacks the structure with the open parenthesis
				postfixStack.push(poppedItem);
				break;
			} else {
				int precedenceCompare;

				// Declaring a new precedence variable to be compared with the parameter passed
				// in the method (precedenceLevel)
				if (poppedItem.equals("+") || poppedItem.equals("-")) {
					precedenceCompare = 1;
				} else {
					precedenceCompare = 2; // For multiplication and division
				}

				if (precedenceLevel > precedenceCompare) {
					postfixStack.push(poppedItem); // Pushes the higher precedence operator to the stack
					break; // Done with the loop
				} else {
					iExpression += poppedItem; // Pops the current operator
				}
			}
		}
		postfixStack.push(operator + ""); // Pushing the same-precedence level operator (left-to-right)
	}

	/**
	 * This method validates the user's infix expression.
	 * 
	 * @return true - the expression is good for converting; false otherwise
	 */
	public boolean validateInput() {
		String input = this.getiExpression();

		// Checks whether the infix expression contains any spaces
		if (!input.matches("\\S+")) {
			this.isValid = false;

			// Checks whether the entered infix contains at least one of the allowed
			// arithmetic operators
		} else if (!(input.contains("+") || input.contains("-") || input.contains("*") || input.contains("/"))) {
			this.isValid = false;

			// Checks whether any other type of brackets are entered other than rounded
			// brackets
		} else if (input.contains("{") || input.contains("[") || input.contains("]") || input.contains("}")) {
			this.isValid = false;

			// Checks whether the user entered invalid operators based on the application
			// rules
		} else if (input.contains("^") || input.contains("%")) {
			this.isValid = false;
		} else {
			this.isValid = true;
		}
		return this.isValid;
	}
}