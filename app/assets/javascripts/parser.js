$(document).ready(function(){

    $( document ).ajaxSuccess(function( event) {
        $(event.target.activeElement).closest('.stolen_pics').remove();
        $(event.target.activeElement).closest('.parsed_images').remove();
    });

}); // DOCUMENT READY

