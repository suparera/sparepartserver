package com.nic.ssp

import com.drew.imaging.ImageMetadataReader
import com.drew.metadata.Metadata
import com.drew.metadata.exif.ExifIFD0Directory
import com.drew.metadata.exif.ExifSubIFDDescriptor
import com.drew.metadata.exif.ExifSubIFDDirectory
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import groovy.json.JsonSlurper;

import grails.converters.*
import net.coobird.thumbnailator.Thumbnails

import javax.imageio.ImageIO
import javax.imageio.ImageReader
import javax.imageio.stream.ImageInputStream
import java.awt.Dimension

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MaterialController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
            println "case searchText null"
            respond Material.list(params), model:[materialInstanceCount: Material.count()]
    }

    def search(Integer max) {
        def searchText = params.searchText
        println "index() searchText=${searchText}"

        params.max = Math.min(max ?: 10, 100)

        def allMatList = Material.findAllByIdLikeOrDescrLikeOrPoTextLike("%${searchText}%", "%${searchText}%", "%${searchText}%")

        def matList = Material.findAllByIdLikeOrDescrLikeOrPoTextLike("%${searchText}%", "%${searchText}%", "%${searchText}%",params)
        println "2 case searchText exist=${searchText}, size = ${matList.size()}"
        respond matList.asList(), model:[
                materialInstanceCount: allMatList.size()
                , searchText:searchText
        ]

    }
	
	def listJson(){
		def results = Material.list()
		render(contentType:"application/json") {
			kind = 'MaterialList'
			materials = array {
				for (m in results){
					material id:m.id, descr: m.descr, category:m.category, min:m.min, max:m.max, location:m.location, employee:m.employee?.name, haveImage1:m.haveImage1, haveImage2:m.haveImage2, haveImage3:m.haveImage3
				}
			}
		}
	}

    def json(Material m) {
        println "m=${m}"
        render(contentType:"text/json") {
            kind='MaterialJson'
            material id:m.id, descr: m.descr, category:m.category, min:m.min, max:m.max, location:m.location, employee:m.employee?.name, haveImage1:m.haveImage1, haveImage2:m.haveImage2, haveImage3:m.haveImage3
        }
    }

    /** used by android
     *
     * @return material list in Json format
     */
    def findAllByIdLikeOrDescrLike(){
        def searchText  = "%${params.searchText}%"

        def results = Material.findAllByIdLikeOrDescrLikeOrPoTextLike(searchText, searchText, searchText)
        println("searchText=${searchText}, result size = ${results.size()}")
        render(contentType:"application/json") {
            kind = 'MaterialList'
            materials = array {
//                for (m in results){
//                    material id:m.id, descr: m.descr, category:m.category, min:m.min, max:m.max, location:m.location, employee:m.employee?.name
//                }
                results.eachWithIndex { Material m, int i ->
                    material _id:i+1, id:m.id, descr: m.descr, category:m.category, min:m.min, max:m.max, location:m.location, employee:m.employee?.name
                }
            }
        }
    }

    /**
     * 2015-07-20 add Thumbnail file size 48
     *      fileFormat %MATNO%-tn.jpg
 *          location : web-app/thumbnails
     * @return
     */
	def uploadJsonAndImage() {
        try {
            def materialJson = params.materialJson
            def slurper = new JsonSlurper().parseText(materialJson)
            def matNo = slurper.id
            def material = Material.get(matNo)
            println "uploadJsonAndImage called. for mat ${material.id}:${material.descr}"
            // image1, check isImage1Change first before work in hard process.
            def realPath = request.getSession().getServletContext().getRealPath("")
            def isImage1Change = params['isImage1Change']
            if(isImage1Change.equals('true')){
                def f = request.getFile('image1')

                if (f != null) {
                    def file = new File("${realPath}/images/${matNo}.jpg")
                    material.setHaveImage1(true)
                    def thumbnailFile = new File("${realPath}/thumbnails/${matNo}-tn.jpg")
                    f.transferTo(file)

                    // find orientation
                    Metadata metadata = ImageMetadataReader.readMetadata(file)
                    def dimension = getDimension(file)
                    def thumbnailScale = (dimension.width > dimension.height ? 48 / dimension.width : dimension.height)
                    ExifIFD0Directory exif = metadata.getFirstDirectoryOfType(ExifIFD0Directory.class)
                    if (exif != null) {
                        int orientation = exif.getInt(ExifIFD0Directory.TAG_ORIENTATION)
                        if (orientation == 6) {
                            Thumbnails.of(file).scale(1.0).rotate(0).toFile(file)
                        }
                        Thumbnails.of(file).scale(thumbnailScale).toFile(thumbnailFile)
                    }
                }
            }

            // image1, check isImage1Change first before work in hard process.
            def isImage2Change = params['isImage2Change']
            if(isImage2Change.equals('true')){
                def f = request.getFile('image2')

                if (f != null) {
                    def file = new File("${realPath}/images/${matNo}-image2.jpg")
                    f.transferTo(file)
                    material.setHaveImage2(true)
                    // find orientation
                    Metadata metadata = ImageMetadataReader.readMetadata(file)
                    ExifIFD0Directory exif = metadata.getFirstDirectoryOfType(ExifIFD0Directory.class)
                    if (exif != null) {
                        int orientation = exif.getInt(ExifIFD0Directory.TAG_ORIENTATION)
                        if (orientation == 6) {
                            Thumbnails.of(file).scale(1.0).rotate(0).toFile(file)
                        }
                    }

                }
            }
            if (material == null) {
                notFound()
                return
            }

            if (material.hasErrors()) {
                respond material.errors, view:'create'
                return
            }

            material.save flush:true

        render { result: "OK" } as JSON
    } catch(Exception e){
            e.printStackTrace()
        }
    }

            def show(Material materialInstance) {
                //println "REALPATH=${request.getSession().getServletContext().getRealPath("")}"
                respond materialInstance
            }

            def create() {
                respond new Material(params)
            }

    @Transactional
    def save(Material materialInstance) {
        if (materialInstance == null) {
            notFound()
            return
        }

        if (materialInstance.hasErrors()) {
            respond materialInstance.errors, view:'create'
            return
        }

        materialInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'material.label', default: 'Material'), materialInstance.id])
                redirect materialInstance
            }
            '*' {
                respond materialInstance, [status: CREATED]
            }
        }
    }

    def edit(Material materialInstance) {
        respond materialInstance
    }

    @Transactional
    def update(Material materialInstance) {
        if (materialInstance == null) {
            notFound()
            return
        }

        if ( !materialInstance.validate() || materialInstance.hasErrors()) {
            respond materialInstance.errors, view:'edit'
            return
        }

        materialInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Material.label', default: 'Material'), materialInstance.id])
                redirect materialInstance
            }
            '*'{ respond materialInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Material materialInstance) {

        if (materialInstance == null) {
            notFound()
            return
        }

        materialInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Material.label', default: 'Material'), materialInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'material.label', default: 'Material'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    public Dimension getDimension(File f){
        ImageInputStream inputStream = ImageIO.createImageInputStream(f);
        final Iterator<ImageReader> readers = ImageIO.getImageReaders(inputStream);
        if (readers.hasNext()) {
            ImageReader reader = readers.next();
            try {
                reader.setInput(inputStream);
                return new Dimension(reader.getWidth(0), reader.getHeight(0));
            } finally {
                reader.dispose();
            }
        }
    }
}
