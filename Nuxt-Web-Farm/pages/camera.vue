<template>
  <div class="container-fluid" style="height: 3000px">
    <div class="row">
      <div
        class="col-10"
        style="
          background-color: #fff;
          height: 70px;
          margin-top: -1px;
          color: #fff;
        "
      >
        <Logoku />
      </div>
      <div
        class="col-2"
        style="background-color: #fff; height: 70px; margin-top: -1px"
      >
        <div>
          <a
            class="btn btn-light btn-lg"
            style="width: 60px; margin-left: 190px; margin-top: 10px"
            title="Settings"
            ><i
              class="bi bi-house-fill"
              onclick="window.history.back();"
              title="Home"
            ></i
          ></a>
        </div>
      </div>
    </div>
    <!-- end col1 -->
    <div class="row" style="margin-top: 10px">
      <div class="col-12">
        <div class="card" style="background-color: #cfe7d9">
          <div class="card-body">
            <h1 style="font-size: 25px; text-align: center">
              ข้อมูลภาพรวมของสภาพอากาศภายในโรงเรือน
            </h1>
          </div>
        </div>
      </div>
    </div>
    <!-- end col2 -->
    <div class="container-fluid">
      <div class="row">
        <div class="col">
          <div class="card" style="height: 590px; width: 1090px">
            <div class="card-body">
              <div id="All_chart">
                <Linechart :data="items" />
              </div>
            </div>
            <!--graph-->
            <div class="card-body" style="margin-top: 300px">
              <!-- <hr> -->
              <h6></h6>
            </div>
            <!--graph name-->
          </div>
        </div>
        <div class="col" style="height: 500px; width: 960px">
          <div class="row" style="margin-left: 10px">
            <div class="col-6">
              <div class="card widget-flat" style="height: 290px">
                <div class="card-body">
                  <Temp :data="items" />
                </div>
              </div>
            </div>
            <div class="col-6">
              <div class="card widget-flat" style="height: 290px">
                <div class="card-body">
                  <Humidity :data="items" />
                </div>
              </div>
            </div>
          </div>
          <div class="row" style="margin-left: 10px; margin-top: 10px">
            <div class="col-6">
              <div class="card widget-flat" style="height: 290px">
                <div class="card-body">
                  <Co2 :data="items" />
                </div>
              </div>
            </div>
            <div class="col-6">
              <div class="card widget-flat" style="height: 290px">
                <div class="card-body">
                  <Ec :data="items" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="card" style="background-color: #cfe7d9; margin-top: 10px">
      <div class="card-body">
        <h1 style="font-size: 25px; text-align: center">ข้อมูลชุดพืช</h1>
      </div>
    </div>d
    <div class="center" style="margin-top: 20px">
      <div class="row">
        <br />
        <!-- list data -->
        <div class="row">
          <div class="col-3">
            <div class="card" style="width: 350px; height: 590px">
              <div class="col card-body">
                <h6 style="text-align: center">เมนูขัอมูลทั้งหมด</h6>
                <hr />
              </div>

              <div>
                <div class="col card-body">
					<!-- Dropdown -->
					<div class="dropdown">
                    <button
                      class="btn btn-secondary dropdown-toggle"
                      type="button"
                      id="dropdownMenuButton1"
                      data-bs-toggle="dropdown"
                      aria-expanded="false"
                    >
                      {{ titleSelectItem }}
                    </button>
                    <ul
                      class="dropdown-menu"
                      aria-labelledby="dropdownMenuButton1"
                    >
                      <li
                        v-for="(item, index) in date"
                        @click="filterDate(item)"
                      >
                        {{ item }}
                      </li>
                    </ul>
                  </div>
                  <div>

                  <div v-for="(item, index) in displayCurrentItem">
                    <button
                      type="button"
                      class="i text-muder fw-lighter fs-6 mt-0 btn btn-lg btn-primary"
                      v-on:click="say(item)"
                      style="margin-top: 10px; padding-right: 40px"
                    >
                      ครั้งที่ - {{ item.id }} - {{ item.created_at }}
                    </button>
                  </div>
                  <div
                    class="btn-toolbar"
                    role="toolbar"
                    aria-label="Toolbar with button groups"
                  >
                    <div
                      class="btn-group me-2"
                      role="group"
                      aria-label="First group"
                    ></div>
                  </div>
				  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- list data -->
        <div
          class="card text-dark bg-light mb-4"
          style="
            height: 450px;
            width: 1490px;
            margin-left: 400px;
            margin-top: -590px;
          "
        >
          <div class="card-body">
            <div class="row" style="width: 800px">
              <Info :id="id" />
            </div>
            <div class="col" style="margin-left: 830px; margin-top: -400px">
              <div class="row" style="width: 600px">
                <div class="col">
                  <div class="card widget-flat">
                    <div class="card-body">
                      <h5>Temperature</h5>
                    </div>
                    <div class="card-body" style="text-align: center">
                      {{ selectItem.temp + "  \xB0c" }}
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="col">
                    <div class="card widget-flat">
                      <div class="card-body">
                        <h5>Humidity</h5>
                      </div>
                      <div class="card-body" style="text-align: center">
                        {{ selectItem.humid + "  %" }}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row" style="margin-top: 10px; width: 600px">
                <div class="col">
                  <div class="col">
                    <div class="card widget-flat">
                      <div class="card-body">
                        <h5>Carbondioxide</h5>
                      </div>
                      <div class="card-body" style="text-align: center">
                        {{ selectItem.co2 + "  ppm" }}
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="col">
                    <div class="card widget-flat">
                      <div class="card-body">
                        <h5>Electrical Conducivity</h5>
                      </div>
                      <div class="card-body" style="text-align: center">
                        {{ selectItem.ec + "  S/m" }}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Display Image -->
            <DisplayImage :id="id" />
          </div>
        </div>
        <!-- <Info :id=id /> -->
      </div>
    </div>

    <!-- Pagging -->
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li
          class="page-item"
          v-for="(item, index) in totalItemInPage"
          @click="setItenInPage(index)"
        >
          <a class="page-link" v-if="index == 0">&laquo;</a>
          <a
            class="page-link"
            v-if="index != 0 && index != totalItemInPage.length - 1"
            >{{ index + 1 }}</a
          >
          <a class="page-link" v-if="index == totalItemInPage.length - 1"
            >&raquo;</a
          >
        </li>
      </ul>
    </nav>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [],
      selectItem: {
        co2: 0,
        created_at: 0,
        ec: 0,
        farm_id: 0,
        humid: 0,
        id: 0,
        temp: 0,
      },
      id: 0,
      countNext: 0,
      date: [],
      filterItemByDate: [],
      itemInPage: 10,
      totalItemInPage: [],
      displayCurrentItem: [],
      titleSelectItem: "โปรดเลือกวันที่ต้องการ",
    };
  },
  mounted() {
    this.fetchAPI();
  },
  methods: {
    async fetchAPI() {
      if (this.countNext == 0) {
        var url = "http://192.168.1.100:8000/greenhouses/?skip=0&limit=100000";
      }
      if (this.countNext < 0) {
        var url = "http://192.168.1.100:8000/greenhouses/?skip=0&limit=100000";
      }
      // else{
      // 	var num = this.countNext*20
      // 	var url = "http://192.168.1.100:8000/greenhouses/?skip="+num+"&limit="+(num+20);

      // }
      const response = await this.$axios.$get(url);
      this.items = response;
      this.selectItem = this.items[0];
      this.id = this.selectItem.id;

      for (var index in this.items) {
        var d = this.items[index].created_at.split("T")[0];

        if (!this.date.includes(d)) {
          this.date.push(d);
        }
      }
    },
    say: function (item) {
      this.id = item.id;
      this.selectItem = item;
    },
    filterDate: function (selectDate) {
      this.titleSelectItem = selectDate;

      this.filterItemByDate = this.items.filter(function (el) {
        return el.created_at.split("T")[0] == selectDate;
      });

      var count = 0;
      this.pageLength = Math.ceil(
        this.filterItemByDate.length / this.itemInPage
      );
      var item = [];
      this.totalItemInPage = [];
      for (var i = 1; i <= this.pageLength; i++) {
        // 11.1111
        for (var j = 0; j < this.itemInPage; j++) {
          item.push(this.filterItemByDate[count]);
          if (count == this.filterItemByDate.length - 1) break;
          count += 1;
        }
        this.totalItemInPage.push(item);
        item = [];
      }

      this.displayCurrentItem = this.totalItemInPage[0];
    },
    setItenInPage: function (index) {
      this.displayCurrentItem = this.totalItemInPage[index];
    },
  },
};
</script>

<style>
.center {
  margin: auto;
  /* display: block; */
  /* margin-left: auto;
  margin-right: auto; */
}

/* #button_selector {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.tital {
	text-align: center;
	color: brown;
}

.black_button {
	text-align: right;
	font-size: 30px;
}

.info_plant_list {
	font-size: 20px;

}

* {
	margin: 0;
	padding: 0;

}

#app {
	background-color: #dbdbdb;
}

.data-ch {
	background-color: #fff;
	border-radius: 20px;

}


#list_oder {
	padding-left: 110px;
} */

/* #bt-back {
	background-color: #fff;
	border-radius: 10px;
	width: 100px;
	text-align: center;
	margin-bottom: 20px;
	margin-left: 80rem;

} */
/* 
.i {
	color: #fff;

	padding: 3px;
	margin-bottom: 0.4rem;
} */
</style>
