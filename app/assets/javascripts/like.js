$(document).ready(function(){
    var like_count
    $(document).ajaxSuccess(function(event, response, settings)  {

        like_count = response.responseJSON.like_count

        if (response.responseJSON.status == 'success_added'){
            like_count += 1
            console.log(like_count);
            $('.like_counter').html(like_count);
            $('.icon-thumbs-up-alt.icon-2x').replaceWith('<a data-remote="true" href="/images/2/dislike"><div  class ="icon-thumbs-down-alt icon-2x"></div></a>');
        }

        if (response.responseJSON.status == 'success_deleted') {
            like_count -= 1
            console.log(like_count);
            $('.like_counter').html(like_count);
            $('.icon-thumbs-down-alt.icon-2x').replaceWith('<a data-remote="true" href="/images/2/like"><div class="icon-thumbs-up-alt icon-2x"></div></a> ');
        }
    });

}); // DOCUMENT READY