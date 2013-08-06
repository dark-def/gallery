$(document).ready(function(){

    $('.icon-thumbs-down-alt.icon-2x').hide();

    $(document).ajaxSuccess(function(event, response, settings)  {

        if (response.responseJSON.status == 'success_added'){
            console.log('YOU LIKE IT');
            $('.icon-thumbs-up-alt.icon-2x').hide();
            $('.icon-thumbs-down-alt.icon-2x').show();
        }

        if (response.responseJSON.status == 'success_deleted') {
            console.log('YOU DONT LIKE IT');
            $('.icon-thumbs-up-alt.icon-2x').show();
            $('.icon-thumbs-down-alt.icon-2x').hide();
        }
    });

}); // DOCUMENT READY
