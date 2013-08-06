$(document).ready(function(){


    $(document).ajaxSuccess(function(event, response, settings)  {

        if (response.responseJSON.stat == 'succ'){
        // IF BEFORE WE GOT INVALID ERRORS CLEAN THEM BEFORE
//        if ($('.error_messages')){
//            $('#comment_description').css('box-shadow', 'none');
//            $('#comment_nickname').css('box-shadow', 'none');
//            $('.error_messages').remove();
//        }

        if (response.responseJSON.comment)
        {
            // Init variables and add new comment
            comment = HtmlEncode(response.responseJSON.comment.description);
            name = response.responseJSON.comment.name;
            $('.comments').append('<blockquote style ="display:none;">' +
                '<b><span class ="comment_nickname text-primary">'+name+'</span></b><br>' +
                '<span class = "comment_description">'+comment+'</span><br>' +
                '<small class = "comment_time">just now</small>' +
                '</blockquote>');
            $('.comments blockquote').slideDown('slow');
        }

        $('#comment_description').val('');
    }
    });

}); // DOCUMENT READY

function HtmlEncode(val){
    return $("<div/>").text(val).html();
}
