//$(document).ready(function(){
//
//    nv.addGraph(function() {
//        var chart = nv.models.lineWithFocusChart();
//
//
//        chart.xAxis
//            .tickFormat(d3.format(',f'));
//
//        chart.yAxis
//            .tickFormat(d3.format(',.2f'));
//
//        chart.y2Axis
//            .tickFormat(d3.format(',.2f'));
//
//        d3.select('svg')
//            .datum(data())
//            .transition().duration(500)
//            .call(chart);
//
//        nv.utils.windowResize(chart.update);
//
//        return chart;
//    });
//}); // document ready
//
////function data() {
////        var datum
////        $.ajax({
////            url: "/events/get_graphs",
////            type: "post",
////            success: function(response) {
////                console.log(response.sign_in);
////                datum = response.sign_in;
////                return datum.map(function(data, i) {
////                    console.log(data.event)
////                    console.log(data.created_at)
////                    return {
////                        key: i,
////                        values: i
////                    };
////                });
////            }
////        });
//
//         function data() {
//         var sin = [],
//             cos = [];
//         $.ajax({
//             url: "/events/get_graphs",
//             type: "post",
//             success: function(response) {
//                 console.log(response.sign_in);
//                 datum = response.sign_in;
//
//                 for (var i = 0; i < datum; i++) {
//
//                     sin.push({x: datum.created_at, y: i});
//                     cos.push({x: i, y: .5 * Math.cos(i/10)});
//                 }
//
//             }
//         });
//
//         return [
//             {
//                 values: sin,
//                 key: 'Sign_in',
//                 color: '#ff7f0e'
//             },
//             {
//                 values: cos,
//                 key: 'Cosine Wave',
//                 color: '#2ca02c'
//             }
//         ];
////     }
//
//
//
//
////        return data(3,10+Math.random()*200,.1).map(function(data, i) {
////            return {
////                key: 'Stream' + i,
////                values: data
////            };
////        });
//
//    }
//
////function return_data() {
////    return data(3,10+Math.random()*200,.1).map(function(data, i) {
////        return {
////            key: 'Stream' + i,
////            values: data
////        };
////    });
////}
////    console.log(data());
////    console.log(responseJSON);
//
//     /**************************************
//       * Simple test data generator
//       */
//
//
//
