<template>
  <div>
    <!--point 1-->
    <div class="card widget-flat" style="width: 100%">
      <div class="card-body">
        <h5>{{ item.position }}</h5>
      </div>
    </div>
    <!-- Group -->
    <div class="row">
      <div class="col">
        <CardImage :url="item.rgb" :title="RGB" />
      </div>
      <div class="col">
        <CardImage :url="item.nir" :title="NOIR" />
      </div>
      <div class="col">
        <CardImage :url="item.ndvi" :title="NDVI" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    item: Object,
  },
  watch: {
    item: function (newVal, oldVal) {
      this.item = newVal;
    },
  },
  data() {
    return {
      RGB: "RGB",
      NOIR: "NOIR",
      NDVI: "NDVI",
    };
  },
};
</script>
