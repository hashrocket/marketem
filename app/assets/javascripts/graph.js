$(function () {
    var chart;
    $(document).ready(function() {
        $container = $('#container')
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'column'
            },
            title: {
                text: 'Responses by Gender and Age Group',
                align: 'left',
                margin: 50,
                style: {
                        color: '#363639',
                        fontFamily: 'Helvetica Neue, Helvetica, Arial',
                        fontSize: '14px'
                }
            },
            xAxis: {
                categories: $container.data('categories'),
                title: {
                    text: 'Age Groups',
                    style: {
                        color: '#363639',
                        fontFamily: 'Helvetica Neue, Helvetica, Arial',
                        fontSize: '12px'
                }
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Number of Responses',
                    style: {
                        color: '#363639',
                        fontFamily: 'Helvetica Neue, Helvetica, Arial',
                        fontSize: '12px'
                }
                }
            },
            legend: {
                layout: 'vertical',
                backgroundColor: '#ffffff',
                borderColor: '#d0d0cf',
                padding: 15,
                align: 'left',
                verticalAlign: 'top',
                x: 70,
                y: 40,
                floating: true,
                shadow: false
            },
            tooltip: {
                formatter: function() {
                    return ''+
                        this.x +': '+ this.y +' mm';
                }
            },
            plotOptions: {
                column: {
                    pointPadding: 0,
                    shadow: false,
                    borderWidth: 0
                }
            },
                series: [{
                name: 'Male',
                color: '#3a7292',
                data: $container.data('male-responses')
            }, {
                name: 'Female',
                color: '#b2c559',
                data: $container.data('female-responses')
            }],
            credits: false
        });
    });

});
