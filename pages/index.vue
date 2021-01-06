<template>
  <div class="container-xxl">
    <div>
      <Logo />
      <h1 class="title">pnuxt-pc</h1>
      <a class="title" href="/demo">Demos</a>
    </div>
  </div>
</template>

<script>
export default {
  mounted() {
    console.log(process.env.NODE_ENV)
  },
  methods: {},
}
</script>
<style lang="less" scoped>
.title {
  color: green;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}
</style>
