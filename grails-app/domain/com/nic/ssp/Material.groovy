package com.nic.ssp

class Material {
	String 		id
	String  	plant
	Integer 	typeNo
	String 		category
	String 		i
	String 		descr
	String 		poText
	String 		uom
	String 		location
	Integer 	min
	Integer 	max
	Employee	employee
	Integer 	sapQty
	Integer 	countQty
	Double 		pricePerUnit
	Integer 	diff
	Double 		diffBaht
	String 		cc
	Double 		amount
	boolean		haveImage1
	boolean 	haveImage2
	boolean 	haveImage3


	static mapping = {
		id column:'materialNo', generator: "assigned"  
		version false
		typeNo column:'typeNo'
		poText column:'poText'
		employee column: 'picId'
		sapQty column:'sapQty'
		countQty column:'countQty'
		pricePerUnit column:'pricePerUnit'
		diffBaht column:'diffBaht'
		haveImage1 column:'haveImage1'
		haveImage2 column:'haveImage2'
		haveImage3 column:'haveImage3'
	}

	static constraints = {
		plant nullable: true, maxSize: 5
		typeNo nullable: true, max: 90
		category nullable: true
		i nullable: true, maxSize: 1
		descr nullable: true
		poText nullable: true
		uom nullable: true
		location nullable: true
		min nullable: true
		max nullable: true
		employee nullable: true
		sapQty nullable: true
		countQty nullable: true
		pricePerUnit nullable: true
		diff nullable: true
		diffBaht nullable: true
		cc nullable: true
		amount nullable: true
		haveImage1 nullable:false
		haveImage2 nullable:false
		haveImage3 nullable:false
	}

}
