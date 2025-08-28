package com.pritam44.Todo_management.Exception;

public class InvalidTodoDataException extends RuntimeException  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public InvalidTodoDataException(String message) {
        super(message);
    }

}
