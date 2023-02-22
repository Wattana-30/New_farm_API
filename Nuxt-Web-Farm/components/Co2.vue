<template> 
    <canvas id="co2_ch"  width="50" height="30"></canvas>
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
        const ctx= document.getElementById('co2_ch');
        
  
        var co2 = this.data.map(function (elem) {
                return elem.co2;
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
                            label: 'Carbon dioxide',
                            data: co2,
                            backgroundColor: 'rgba(153, 102, 255, 0.6)',
                            borderColor: 'rgb(153, 102, 255)',
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