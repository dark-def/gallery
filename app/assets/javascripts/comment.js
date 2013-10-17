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
//            var gravatar_id = Digest::MD5.hexdigest(response.responseJSON.email.downcase);
//            "http://gravatar.com/avatar/#{gravatar_id}.png?s=40"
            comment = HtmlEncode(response.responseJSON.comment.description);
            name = response.responseJSON.name;
            $('.comments').append('<blockquote style ="display:none;">' +
                '<img class="img-circle" src="http://gravatar.com/avatar/'+ response.responseJSON.email +'.png?s=40" alt="35fdb1b334eafd39841dd42f7e111915">' +
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
