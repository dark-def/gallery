$(document).ready(function(){
//    var like_count
    $(document).ajaxSuccess(function(event, response, settings)  {

        if (response.responseJSON.status == 'success_added'){
            $('.like_counter').text(response.responseJSON.like_count);
            $('.icon-thumbs-up-alt.icon-2x').replaceWith('<a data-remote="true" href="/images/'+response.responseJSON.image_id+'/dislike"><div  class ="icon-thumbs-down-alt icon-2x"></div></a>');
        }

        if (response.responseJSON.status == 'success_deleted') {
            $('.like_counter').text(response.responseJSON.like_count);
            $('.icon-thumbs-down-alt.icon-2x').replaceWith('<a data-remote="true" href="/images/'+response.responseJSON.image_id+'/like"><div class="icon-thumbs-up-alt icon-2x"></div></a> ');
        }
    });

}); // DOCUMENT READY