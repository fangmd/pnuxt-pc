<template>
  <div class="root">
    <b-container fluid="lg">
      <h3>网络请求3: {{ ip }}, {{ time }}</h3>
      <b-button @click="getRequest">Get 请求</b-button>
      <b-button @click="getRequestWithParams">Get 请求 + 参数</b-button>
      <h3>加载项目内图片</h3>
      <p class="img"></p>
      <h3>测试全局CSS: assets/css/base.less</h3>
      <p class="test-color">应该是红色</p>
    </b-container>
  </div>
</template>

<script>
import { testGet } from '@/apis/common'
import { timeFormate } from '@/utils/time'

/**
 * Demos
 * 1. 网络请求Demo: Get, Get + Params
 * 2. utils 工具类使用
 * 3. `asyncData` 内请求是在服务端处理的
 * 4. 加载本地图片(assets)
 */
export default {
  name: 'Demo',
  async asyncData({ $axios }) {
    const ip = await $axios.$get('http://icanhazip.com')
    const time = timeFormate(Date.now())
    return { ip, time }
  },
  data() {
    return {
      ip: null,
      time: null,
    }
  },
  mounted() {
    // this.getRequest()
  },
  methods: {
    getRequest() {
      testGet(this.$axios).then((res) => {
        this.ip = res
        this.time = timeFormate(Date.now())
        console.log(res)
      })
    },
    getRequestWithParams() {
      testGet(this.$axios, { one: '121' }).then((res) => {
        this.ip = res
        this.time = timeFormate(Date.now())
        console.log(res)
      })
    },
  },
}
</script>
<style lang="less" scoped>
.img {
  width: 530px;
  height: 410px;
  background: url('~assets/imgs/big-ic.png') 0 0 no-repeat;
  background-size: 100% 100%;
}
</style>
