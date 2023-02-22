
<template>
    <div class="header" style="height: 2000px;">
        <div class="row">
            <div class="col-10 " style="background-color:#fff; height: 70px; margin-top: -24px; color:#fff;">
                <Logoku />
            </div>
            <div class="col-2" style="background-color:#fff; height: 70px; margin-top: -24px;">
                <a href="http://192.168.1.101:1880/ui/#!/1?socketid=Z-MllMl-GaIezs7VAAAB" target="_blank" class="btn btn-light btn-lg" style="width: 60px; margin-left: 190px; margin-top: 10px; " title="Settings"><i class="bi bi-gear-fill"></i></a>
                <div style="color: #000; margin-top: -30px;">{{ dateTime }}</div>
            </div>
        
        </div>
        <!-- header -->
        <div class="row" id="time" >
            <div class="col card widget-flat image-test" style="background-color:#cfe7d9;">
                <div class="row">
                    <div class="col- card widget-flat" id="ca" style="margin-top: 1px;">
                        <div class="card body" style="width: 200px;"></div>
                    </div>
                </div>
                <div class="row">
                    <h1 id="text">Agrictakuse</h1>
                    <p class="card-text" style="font-size: 40px; color: #d97b02;">The website database stores research
                        data.</p>
                    <a href="/camera/" class="btn btn-dark btn-lg" style="width: 250px; margin-left: 150px; ">Information <i
                            class="bi bi-chevron-compact-right"></i></a>
                </div>
            </div>
        </div>
        <!-- header -->
        <div class="content">
            <div class="row">
                <div class="col-sm-6">
                    <div class="col-10 card widget-flat" id="border">
                        <div class="card widget-flat">
                            <div class="card body">
                                <div style="margin-left: 10px;">
                                    <h3 class="text-muted fw-normal mt-0  " title="อุณหภูมิ">อุณหภูมิ<br>Temperature
                                    </h3>
                                </div>
                                <div><span class="time">{{ temp+"   Celsius" }}</span></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- col -->
                <div class="col-sm-6">
                    <div class="col-sm-10 card widget-flat" id="border">
                        <div class="card widget-flat">
                            <div class="card body">
                                <div style="margin-left: 10px;">
                                    <h3 class="text-muted fw-normal mt-0" title="ความชื้น">ความชื้น<br>Humidity
                                    </h3>
                                </div>
                                <div><span class="time">{{ hum+"  %" }}</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- row -->
            <div class="row" style="margin-top: 20px;">
                <div class="col-sm-6">
                    <div class="col-10 card widget-flat" id="border">
                        <div class="card body">
                            <div style="margin-left: 10px;">
                                <h3 class="text-muted fw-normal mt-0  " title="คาร์บอนไดออกไซด์">คาร์บอนไดออกไซด์<br>Carbondioxide</h3>
                            </div>
                            <div><span class="time">{{ co2 +"  ppm"}}</span></div>
                        </div>
                    </div>
                </div>
                <!-- col -->
                <div class="col-sm-6">
                    <div class="col-10 card widget-flat" id="border">
                        <div class="card body">
                            <div style="margin-left: 10px;">
                                <h3 class="text-muted fw-normal mt-0" title="ค่าเหนี่ยวนำกระแสไฟฟ้า">ค่าเหนี่ยวนำกระแสไฟฟ้า<br>Electrical Conductivity</h3>
                            </div>
                            <div><span class="time">{{ ec +"  S/m"}}</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>



</template>



<script>
import Logoku from './Logoku.vue';
export default {
    props: {
        payloadMessage: String,
    },
    watch: {
        payloadMessage: {
            immediate: true,
            deep: true,
            handler(newValue, oldValue) {
                var arrystr = newValue.split(" ");
                this.temp = arrystr[4];
                this.hum = arrystr[3];
                this.co2 = arrystr[1];
                this.ec = arrystr[2];
            }
        }
    },
    data() {
        return {
            dateTime: null,
            polling: null,
            temp: 0,
            hum: 0,
            co2: 0,
            ec: 0,
        };
    },
    methods: {
        currentDateTime() {
            const current = new Date();
            const date = current.getFullYear() + "-" + (current.getMonth() + 1) + "-" + current.getDate();
            const time = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
            const dateTime = date + " " + time;
            return dateTime;
        }
    },
    created() {
        // get date time
        this.polling = setInterval(() => {
            this.dateTime = this.currentDateTime();
        }, 1000);
    },
    beforeDestroy() {
        clearInterval(this.polling);
    },
    components: { Logoku }
};
</script>


<style>
.image-test {
    background-image: url('../assets/img/12.png');
    width: 1920px;
    height: 400px;
    border-radius: 10px;
}

#text {

    font-size: 100px;
    margin-top: 50px;
    size: 50px;
}

#time {
    height: 400px;
}

.content {
    padding: 30px 30px 30px 30px;
}

#contain {
    margin-top: 10px;
}

.font-list {
    font-size: 36px;
}

#ca {
    width: 150px;
    color: #43BF87;

}

#border {
    height: 250px;
    width: 900px;
}

.time {
    font-size: 60px;
    margin-top: 30px;
    margin-left: 350px;
}
</style>

