<template>
  <div style="margin-top: 150px; width: 100%">
    <div class="row stay-on-top" v-for="(items, index) in groupImage">
      <div class="col bg-color" v-for="(item, index) in items">
        <GroupImage :item="item" />
      </div>
    </div>
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
      this.fetchImage(newVal);
    },
  },
  data() {
    return {
      images: {},
      groupImage: [],
    };
  },
  //   mounted() {
  //     this.fetchImage(this.id);
  //   },
  methods: {
    async fetchImage(id) {
      const url = "http://192.168.1.100:8000/get_info/" + id;
      const response = await this.$axios.$get(url);
      this.images = response;

      var item = [];
      this.groupImage = [];
      var cnt = 0;

      for (var elem in this.images) {
        item.push({
          position: elem.replace("_", " "),
          ndvi: this.images[elem].ndvi,
          rgb: this.images[elem].rgb,
          nir: this.images[elem].noir,
          nir: this.images[elem].noir,
        });

        cnt++;

        if (item.length == 2 || (cnt == this.images.length && item.length == 1)) {
          this.groupImage.push(item);
          item = []
        } 
      }
    },
  },
};
</script>

<style>
.stay-on-top {
  margin-top: 30px;
}
.bg-color {
  margin-right: 50px;
}
.style-beetween {
  margin-left: 10px;
}
</style>
