/* global Dropzone */

Dropzone.options.newStoredImage = {
    paramName: 'file',
    maxFilesize: 5
};

function dropzone_setup() {
    //$('.dropzone').dropzone();

    // $("#new-stored-image").dropzone( {
    //     url: 'admin/stored_images',
    //     maxFilesize: 5,
    //     uploadMultiple: false,
    //     addRemoveLinks: false,
    //     success: function(file, response){
    //         console.log(file)
    //         console.log(response)
    //         //$.get("/documents/add_thumbnail", {id: response.id.$oid});
    //         //$(file.previewElement).addClass("dz-success");
    //     }
    // });
}


$(document).on('turbolinks:load', function() {
    dropzone_setup();
});
