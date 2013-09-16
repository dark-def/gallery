$(document).ready(function(){

    if (window.location.pathname == '/events/graphs')
    {

        $.ajax({
            url: "/events/get_circle_graphs",
            type: "post",

            success: function(response) {

                var like_pie = [];
                response.data.map(function(value){
                    like_pie.push( {"label": value.category, "value": value.likes_size} );
                });

                var comment_pie = [];
                response.data.map(function(value){
                    comment_pie.push( {"label": value.category, "value": value.comments_size} );
                });

                var img_pie = [];
                response.data.map(function(value){
                    img_pie.push( {"label": value.category, "value": value.img_size} );
                });


                nv.addGraph(function() {
                    var chart = nv.models.pieChart()
                        .x(function(d) { return d.label })
                        .y(function(d) { return d.value })
                        .showLabels(false);

                    d3.select("#chart1 svg")
                        .datum(like_pie)
                        .transition().duration(1200)
                        .call(chart);

                    return chart;
                });

                nv.addGraph(function() {
                    var chart = nv.models.pieChart()
                        .x(function(d) { return d.label })
                        .y(function(d) { return d.value })
                        .showLabels(false);

                    d3.select("#chart2 svg")
                        .datum(comment_pie)
                        .transition().duration(1200)
                        .call(chart);

                    return chart;
                });

                nv.addGraph(function() {
                    var chart = nv.models.pieChart()
                        .x(function(d) { return d.label })
                        .y(function(d) { return d.value })
                        .showLabels(false);

                    d3.select("#chart3 svg")
                        .datum(img_pie)
                        .transition().duration(1200)
                        .call(chart);

                    return chart;
                });


            }
        });
    }  //
}); //  document