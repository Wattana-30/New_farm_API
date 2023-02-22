<template>
   <div >
   <canvas id="Bar_chart"></canvas>
   
</div>
    
</template>


<script>
import Chart from 'chart.js/auto';

export default {
    name: 'Barchart',
    props: {
        data: Array,
    },
    watch: {
        data: function (newVal, oldVal) { // watch it
            this.myChart.data.datasets[0].data = newVal
            this.myChart.update()
        },
    },
    data() {
        return {
            myChart: ''
        }
    },
    methods: {
        updateBarchart() {

        },
    },
    mounted() {
        const ctx = document.getElementById('Bar_chart');
        // myChart;
        this.myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Temperature', 'Electrical Conductivity', 'Humidity', 'Carbondioxide'],
                datasets: [{
                    label:'Temperature',
                    data: this.data,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.6)',
                        'rgba(54, 162, 235, 0.6)',
                        'rgba(75, 192, 192, 0.6)',
                        'rgba(153, 102, 255, 0.6)',
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                    ],
                    borderWidth: 1,
                    
                }]
            },
            options: {
                plugins: {
         legend: {
            display: false
         }
      }
            }
        });

    }
}
</script>

