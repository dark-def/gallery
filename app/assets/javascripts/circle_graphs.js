$(document).ready(function(){

    var img_size, comments_size, likes_size;

    $.ajax({
        url: "/events/get_circle_graphs",
        type: "post",

        success: function(response) {

            img_size = response.img_size;
            comments_size = response.comments_size;
            likes_size = response.likes_size;
            var data = [
                {
                    key: "Cumulative Return",
                    values: [
                        {
                            "label": "One",
                            "value" : 29.765957771107
                        } ,
                        {
                            "label": "Two",
                            "value" : 0
                        } ,
                        {
                            "label": "Three",
                            "value" : 32.807804682612
                        } ,
                        {
                            "label": "Four",
                            "value" : 196.45946739256
                        }
                    ]
                }
            ];
            console.log(data)

            nv.addGraph(function() {
                var chart = nv.models.pieChart()
                    .x(function(d) { return d.label })
                    .y(function(d) { return d.value })
                    .showLabels(true);

                d3.select("#chart1 svg")
                    .datum(data)
                    .transition().duration(1200)
                    .call(chart);

                return chart;
            });

            nv.addGraph(function() {
                var chart = nv.models.pieChart()
                    .x(function(d) { return d.label })
                    .y(function(d) { return d.value })
                    .showLabels(true);

                d3.select("#chart2 svg")
                    .datum(data)
                    .transition().duration(1200)
                    .call(chart);

                return chart;
            });

            nv.addGraph(function() {
                var chart = nv.models.pieChart()
                    .x(function(d) { return d.label })
                    .y(function(d) { return d.value })
                    .showLabels(true);

                d3.select("#chart3 svg")
                    .datum(data)
                    .transition().duration(1200)
                    .call(chart);

                return chart;
            });


        }
    });
});