$(document).ready(function(){
    $(document).ajaxSuccess(function(event, response, settings)  {
        if (response.responseJSON.stat == 'sub_succ'){
            //$(event.target.activeElement).text('unsubscribe').css('color', '#7B7B7B');
            $(event.target.activeElement).replaceWith('<a href ="/unsubscribe/'+response.responseJSON.category+'" data-remote="true" class="unsibscribe" >unsubscribe</a>')
//          = link_to 'subscribe', subscribe_path(params[:category]), :remote => true
//            <a class="unsibscribe" data-remote="true" href="/unsubscribe/ruby">subscribe</a>
        }
        if (response.responseJSON.stat == 'sub_deleted'){
//            $(event.target.activeElement).text('subscribe');
            $(event.target.activeElement).replaceWith('<a href ="/subscribe/'+response.responseJSON.category+'" data-remote="true" >subscribe</a>')

            //$('.icon-thumbs-up-alt.icon-2x').replaceWith('<a data-remote="true" href="/images/'+response.responseJSON.image_id+'/dislike"><div  class ="icon-thumbs-down-alt icon-2x"></div></a>');

        }
    });

}); // DOCUMENT READY