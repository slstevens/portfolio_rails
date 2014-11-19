// "myAwesomeDropzone" is the camelized version of the HTML element's ID
Dropzone.options.newProjectImage = {
  paramName: "project_image[image]", // The name that will be used to transfer the file

  init: function() {
    // this.on("addedfile", function(file) { alert("Added file. The file path is" + file )});
    this.on("success", function(file) { location.reload(); });
    // this.on("success", function(file) { $('#imagesList').append('<li><img src="' + this + '" /></li>') });
  }
};


    	// $('#imagesList').append('<li><img src="' + this + '" /></li>'); 
