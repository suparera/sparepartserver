package com.nic

class AvatarController {

    def index() {
		
	}
	
	def selectAvatar(){
		println "selectAvatar() called."
	}
	
	def upload_avatar() {
		
		
		// Get the avatar file from the multi-part request
		def f = request.getFile('avatar')
		def website = params.website
		f.transferTo(new File("c://temp/${f.getOriginalFilename()}"))
		println "website = ${website}"
		

	  }
}
