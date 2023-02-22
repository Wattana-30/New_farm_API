<template>
  <div>
    <Barchart :data="items" />
    <br /><br /><br /><br />
    <!-- showImage -->
    <!-- <div id="show_img" class="row align-items-start">
            <div class="row row-cols-auto">
                <div v-for="(item, key, index) in images" class="col-6 row-sm-6 ">
                    <h4>{{ key }}</h4>
                    <img :src="item.noir" alt="noir" class="img-size">
                    <img :src="item.rgb" alt="rgb" class="img-size">
                    <img :src="item.ndvi" alt="ndvi" class="img-size">
                    <br><br>
                </div>
            </div>
        </div> -->
  </div>
</template>

<script>
export default {
  props: {
    id: Number,
  },
  watch: {
    id: function (newVal, oldVal) {
      // watch it
      this.fetchAPI(newVal);
    },
  },
  data() {
    return {
      items: [100, 100, 100, 100],
    };
  },
  mounted() {
    this.fetchAPI(this.id);
  },
  methods: {
    async fetchAPI(id) {
      const url = "http://192.168.1.100:8000/greenhouses/" + id;
      const response = await this.$axios.$get(url);
      this.items = [response.temp, response.ec, response.humid, response.co2];
    },
  },
};
</script>

<style>
img {
  width: 120px;
  height: 150px;
  margin-left: 1px;
}
/* .show_img{
    margin-left: 30px;
} */
</style>
