$(document).ready(function(){

    if (window.location.pathname == '/events/graphs')
    {

        $.ajax({
            url: "/events/get_counter_graph",
            type: "post",

            success: function(response) {

                nv.addGraph(function() {
                    var chart = nv.models.discreteBarChart()
                        .x(function(d) { return d.label })
                        .y(function(d) { return d.value })
                        .staggerLabels(false)
                        .tooltips(true)
                        .showValues(true)

                    d3.select('#chart svg')
                        .datum(data)
                        .transition().duration(500)
                        .call(chart);

                    nv.utils.windowResize(chart.update);

                    return chart;
                });

                var data = [
                    {
                        key: "Cumulative Return",
                        values: [
                            {
                                "label" : "Likes create" ,
                                "value" : response.likes_create
                            } ,
                            {
                                "label" : "Likes destroy" ,
                                "value" : response.likes_destroy
                            } ,
                            {
                                "label" : "Comments" ,
                                "value" : response.comments
                            } ,
                            {
                                "label" : "Sign in" ,
                                "value" : response.sign_in
                            } ,
                            {
                                "label" : "Sign out" ,
                                "value" : response.sign_out
                            } ,
                            {
                                "label" : "Click link" + '(' + response.click_link + ')' ,
                                "value" : response.click_link / 100
                            } ,
                            {
                                "label" : "Subscribe" ,
                                "value" : response.subscribe
                            } ,
                            {
                                "label" : "Unsubscribe" ,
                                "value" : response.unsubscribe
                            }
                        ]
                    }
                ]

            }
        });
//    }); // click_link
    }
}); //document