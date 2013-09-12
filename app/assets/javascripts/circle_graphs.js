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
                        } ,
                        {
                            "label": "Five",
                            "value" : 0.19434030906893
                        } ,
                        {
                            "label": "Six",
                            "value" : 98.079782601442
                        } ,
                        {
                            "label": "Seven",
                            "value" : 13.925743130903
                        } ,
                        {
                            "label": "Eight",
                            "value" : 5.1387322875705
                        }
                    ]
                }
            ]

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

//        nv.addGraph(function() {
//            var chart = nv.models.pieChart()
//                .x(function(d) { return d.label })
//                .y(function(d) { return d.value })
//                .showLabels(true);
//
//            d3.select("#chart-2 svg")
//                .datum(data2)
//                .transition().duration(1200)
//                .call(chart);
//
//            return chart;
//        });
//
//        nv.addGraph(function() {
//            var chart = nv.models.pieChart()
//                .x(function(d) { return d.label })
//                .y(function(d) { return d.value })
//                .showLabels(true);
//
//            d3.select("#chart-3 svg")
//                .datum(data3)
//                .transition().duration(1200)
//                .call(chart);
//
//            return chart;
//        });


        }
    });
});