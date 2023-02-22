<template> 
    <canvas id="humidity_ch"  width="50" height="30"></canvas>
 </template>
 
 <script>
     import Chart from 'chart.js/auto';
     
     export default {
       props: {
         data: Array,
       },
       watch: {
         data: function (newVal, oldVal) { // watch it
           this.createGraph(newVal)
         },
       },
    
       methods: {
         createGraph(data) {
           const ctx = document.getElementById('humidity_ch');
           
     
           var humid = this.data.map(function (elem) {
         return elem.humid;
       });
           var id = this.data.map(function (elem) {
             return elem.id;
           });
           
     
           const myChart = new Chart(ctx, {
             type: 'line',
             data: {
               labels: id,
               datasets: [
               {
               label: 'Humidity',
               data: humid,
               backgroundColor: 'rgba(255, 99, 132, 0.6)',
               borderColor: 'rgba(255, 99, 132, 1)',
               borderWidth: 3
             },]
              
             },
             
             options: {
                 fill:true,
               scales: {
                    
                 }
               }
             
           });
           myChart;
           
         }
       },
       mounted() { }
     }
 </script>
 