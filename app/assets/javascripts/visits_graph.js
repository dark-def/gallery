$(document).ready(function(){

    if (window.location.pathname == '/events/graphs')
    {

        $.ajax({
            url: "/events/get_visit_graphs",
            type: "post",
            success: function(response) {

                var sign = [];
                var likes = [];
                var comment = [];
                var subscribes = [];
                response.sign_in.map(function(val){
                    sign.push([ Date.parse(val.ordered_date), parseInt(val.total_number) ]);
                });
                response.likes.map(function(val){
                    likes.push([ Date.parse(val.ordered_date), parseInt(val.total_number) ]);
                });
                response.comment.map(function(val){
                    comment.push([ Date.parse(val.ordered_date), parseInt(val.total_number) ]);
                });
                response.subscribes.map(function(val){
                    subscribes.push([ Date.parse(val.ordered_date), parseInt(val.total_number) ]);
                });
                sign.unshift([sign[0][0], 0])
                likes.unshift([sign[0][0], 0])
                comment.unshift([sign[0][0], 0])
                subscribes.unshift([sign[0][0], 0])
                console.log(likes);
                console.log(comment);
                console.log(sign);
                console.log(subscribes);

                var data=[
                    {
                       'key': 'Users login',
                       'values': sign
                    },
                    {
                        'key': 'Likes',
                        'values': likes
                    },
                    {
                        'key': 'Comments',
                        'values': comment
                    },
                    {
                        'key': 'Subscribes',
                        'values': subscribes
                    }
                ];

                nv.addGraph(function() {
                    var chart = nv.models.cumulativeLineChart()
                        .x(function(d) { return d[0] })
                        .y(function(d) { return d[1] })
                        .color(d3.scale.category10().range());

                    chart.xAxis
                        .tickFormat(function(d) {
                            return d3.time.format('%x')(new Date(d))
                        });
                    chart.yAxis
                        .tickFormat(d3.format(',.1'));

                    d3.select('#chart_sign svg')
                        .datum(data)
                        .transition().duration(500)
                        .call(chart);

                    nv.utils.windowResize(chart.update);

                    return chart;
                });

            }
        });
    }

}); // document ready