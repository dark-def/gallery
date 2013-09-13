$(document).ready(function(){

    $.ajax({
        url: "/events/get_visit_graphs",
        type: "post",
        success: function(response) {

            var sign = [];
            var likes = [];
            var comment = [];
            response.sign_in.map(function(val){
                sign.push([ Date.parse(val.ordered_date), val.total_number ]);
            });
            response.likes.map(function(val){
                likes.push([ Date.parse(val.ordered_date), val.total_number ]);
            });
            response.comment.map(function(val){
                comment.push([ Date.parse(val.ordered_date), val.total_number ]);
            });
            console.log(likes);
            console.log(comment);
            console.log(sign);

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
                }
            ];

            nv.addGraph(function() {
                var chart = nv.models.cumulativeLineChart()
                    .x(function(d) { return d[0] })
                    .y(function(d) { return d[1]*100 })
                    .color(d3.scale.category10().range());

                chart.xAxis
                    .tickFormat(function(d) {
                        return d3.time.format('%x')(new Date(d))
                    });

//                chart.yAxis
//                    .tickFormat(d3.format(',.1%'));

                d3.select('#chart_sign svg')
                    .datum(data)
                    .transition().duration(500)
                    .call(chart);

                nv.utils.windowResize(chart.update);

                return chart;
            });












//            function stream_index(d, i) {
//                return {x: i, y: Math.max(0, d)};
//            }

//            /* Inspired by Lee Byron's test data generator. */
//            function stream_layers(n, m, o) {
//                if (arguments.length < 3) o = 0;
//                function bump(a) {
//                    var x = 1 / (.1 + Math.random()),
//                        y = 2 * Math.random() - .5,
//                        z = 10 / (.1 + Math.random());
//                    for (var i = 0; i < m; i++) {
//                        var w = (i / m - y) * z;
//                        a[i] += x * Math.exp(-w * w);
//                    }
//                }
//                return d3.range(n).map(function() {
//                    var a = [], i;
//                    for (i = 0; i < m; i++) a[i] = o + o * Math.random();
//                    for (i = 0; i < 5; i++) bump(a);
//                    return a.map(stream_index);
//                });
//            }
//
//            function stream_index(d, i) {
//                return {x: i, y: Math.max(0, d)};
//            }










        }
    });



}); // document ready