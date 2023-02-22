<template> 
    <canvas id="ec_ch"  width="50" height="30"></canvas>
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
        const ctx= document.getElementById('ec_ch');
        
  
        var ec = this.data.map(function (elem) {
                return elem.ec;
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
                            label: 'Electrical Conductivity',
                            data: ec,
                            backgroundColor: 'rgba(126, 185, 41, 0.6)',
                            borderColor: 'rgb(126, 185, 41)',
                            borderWidth: 3
                        },
            ]
            
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