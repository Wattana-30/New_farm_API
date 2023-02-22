<template>
  <div>
    <div class="card widget-flat card-image-style">
      <div class="card-body">
        <img
          v-if="url != ''"
          :src="url"
          alt=""
          class="center"
          @click="on(url)"
        />
        <img
          v-if="url == ''"
          src="https://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-5529.jpg?w=2000"
          alt=""
          class="center"
        />
      </div>
    </div>
    <h4 style="text-align: center; margin-top: 10px">{{ title }}</h4>

    <!-- Overlay -->
    <div id="overlay" @click="off()">
     <div >
     </div>
      <img
        class="center"
        id="img-overlay"
        style="margin-top: 5%; width: 50%; height: 80%"
      />
    </div>
  </div>
</template>

<script>
export default {
  props: {
    url: String,
    title: String,
  },
  watch: {
    url: function (newVal, oldVal) {
      this.url = newVal;
    },
    title: function (newVal, oldVal) {
      this.title = newVal;
    },
  },
  data() {
    return {};
  },
  methods: {
    on(url) {
      document.getElementById("overlay").style.display = "block";
      document.getElementById("img-overlay").src = url;

      console.log("url: ", url);
    },
    off() {
      document.getElementById("overlay").style.display = "none";
    },
  },
};
</script>

<style>
.card-image-style {
  margin-top: 20px;
  width: 100%;
}

.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
}

#overlay {
  position: fixed;
  display: none;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 2;
  cursor: pointer;
}
</style>
