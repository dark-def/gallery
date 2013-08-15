$(document).ready(function(){
//    var like_count
    $(document).ajaxSuccess(function(event, response, settings)  {

//        like_count = response.responseJSON.like_count

        if (response.responseJSON.status == 'success_added'){
            console.log(response.responseJSON.like_count);
            $('.like_counter').text(response.responseJSON.like_count);
            $('.icon-thumbs-up-alt.icon-2x').replaceWith('<a data-remote="true" href="/images/'+response.responseJSON.image_id+'/dislike"><div  class ="icon-thumbs-down-alt icon-2x"></div></a>');
        }

        if (response.responseJSON.status == 'success_deleted') {
            console.log(response.responseJSON.like_count);
            $('.like_counter').text(response.responseJSON.like_count);
            $('.icon-thumbs-down-alt.icon-2x').replaceWith('<a data-remote="true" href="/images/'+response.responseJSON.image_id+'/like"><div class="icon-thumbs-up-alt icon-2x"></div></a> ');
        }
    });

}); // DOCUMENT READY