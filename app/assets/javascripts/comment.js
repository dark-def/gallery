$(document).ready(function(){

    $(document).ajaxSuccess(function(event, response, settings)  {

        if (response.responseJSON.stat == 'succ'){
        // IF BEFORE WE GOT INVALID ERRORS CLEAN THEM BEFORE
        if ($('.error_messages')){
            $('#comment_description').css('box-shadow', 'none');
            $('.error_messages').remove();
        }

        if (response.responseJSON.comment)
        {
            comment = HtmlEncode(response.responseJSON.comment.description);
            name = response.responseJSON.name;
            $('.comments').append('<blockquote style ="display:none;">' +
                '<span class ="comment_nickname text-primary">'+name+'</span><br>' +
                '<span class = "comment_description">'+comment+'</span><br>' +
                '<small class = "comment_time">just now</small>' +
                '</blockquote>');
            $('.comments blockquote').slideDown('slow');
        }

        $('#comment_description').val('');
    }

        if (response.responseJSON.stat == 'error'){
            var error = response.responseJSON.error.description;
            $('#comment_description').parent().append('<span class = "error_messages"><b>'+error+'</b></span><br>');
            $('#comment_description').css('box-shadow', '0 0 5px red');

        }

    });

}); // DOCUMENT READY

function HtmlEncode(val){
    return $("<div/>").text(val).html();
}
