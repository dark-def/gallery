$(document).ready(function(){

    $.ajax({
        url: "/events/get_counter_graph",
        type: "post",

        success: function(response) {

            nv.addGraph(function() {
                var chart = nv.models.discreteBarChart()
                    .x(function(d) { return d.label })
                    .y(function(d) { return d.value })
                    .staggerLabels(true)
                    .tooltips(false)
                    .showValues(true)

                d3.select('#chart svg')
                    .datum(data)
                    .transition().duration(500)
                    .call(chart);

                nv.utils.windowResize(chart.update);

                return chart;
            });

            var likes_create,likes_destroy, comments, sign_in, sign_out, subscribe, unsubscribe;

            likes_create = response.likes_create;
            likes_destroy = response.likes_destroy;
            comments = response.comments;
            sign_in = response.sign_in;
            sign_out = response.sign_out;
            subscribe = response.subscribe;
            unsubscribe = response.unsubscribe;
            click_link = response.click_link;

            var data = [
                {
                    key: "Cumulative Return",
                    values: [
                        {
                            "label" : "Likes create" ,
                            "value" : likes_create
                        } ,
                        {
                            "label" : "Likes destroy" ,
                            "value" : likes_destroy
                        } ,
                        {
                            "label" : "Comments" ,
                            "value" : comments
                        } ,
                        {
                            "label" : "Sign in" ,
                            "value" : sign_in
                        } ,
                        {
                            "label" : "Sign out" ,
                            "value" : sign_out
                        } ,
                        {
                            "label" : "Click link" + ' (' + click_link + ')' ,
                            "value" : click_link / 100
                        } ,
                        {
                            "label" : "Subscribe" ,
                            "value" : subscribe
                        } ,
                        {
                            "label" : "Unsubscribe" ,
                            "value" : unsubscribe
                        }
                    ]
                }
            ]

        }
    });


}); //document