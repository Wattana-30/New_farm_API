<template> 
          <canvas id="temp_ch"  width="50" height="30"></canvas>
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
              const ctx= document.getElementById('temp_ch');
              
        
              var temp = this.data.map(function (elem) {
                return elem.temp;
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
                      label: 'Tepm',
                      data: temp,
                     backgroundColor: 'rgba(33, 95, 238, 0.6)',
                      borderColor: 'rgb(33, 95, 238,0.6)',
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