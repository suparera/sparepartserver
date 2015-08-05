package com.nic.ssp

import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

class TestoController {

    def index() { }
	
	def upload() {
		
//		def  f = request.getFile('image1')
//		println "file size = ${f.size()}"
		def req = request;
		println "upload param:name = ${params.name}"
	}
}
