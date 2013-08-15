$(document).ready(function(){

    $( document ).ajaxSuccess(function( event) {
        $(event.target.activeElement).closest('.stolen_pics').remove();
    });

}); // DOCUMENT READY

