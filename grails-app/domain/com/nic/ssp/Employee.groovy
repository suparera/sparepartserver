package com.nic.ssp

import java.awt.Window.Type;

class Employee {

	
	String name
	String lname
	String descr
	Boolean isStaff

static mapping = {
    id  generator: 'assigned'
	version false
}

	static constraints = {
		name nullable: true
		lname nullable: true
		descr nullable: true
		isStaff nullable: true
	}
}
