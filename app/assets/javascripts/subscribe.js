$(document).ready(function(){
    $(document).ajaxSuccess(function(event, response, settings)  {
        if (response.responseJSON.stat == 'sub_succ'){
            $(event.target.activeElement).replaceWith('<a href ="/unsubscribe/'+response.responseJSON.category+'" data-remote="true" class="unsibscribe" >unsubscribe</a>')
        }
        if (response.responseJSON.stat == 'sub_deleted'){
            $(event.target.activeElement).replaceWith('<a href ="/subscribe/'+response.responseJSON.category+'" data-remote="true" >subscribe</a>')
        }
    });

}); // DOCUMENT READY