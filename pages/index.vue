<script setup>

</script>

<template>
  <h1 class="text-3xl mb-4">Terem - ZEUS</h1>
  <div class="text-xl pl-4 mb-6 font-semibold">
    <h3>Oppenheimer - 19:30</h3>
  </div>

  <div class="grid gap-3 p-4 w-6/12 mx-auto font-semibold">
    <div v-for="i in 8" :key="i" class="grid grid-flow-col">
      <div class="text-center font-semibold py-3 text-xl">
        {{ i }}
      </div>
      <button v-for="j in 8" :key="j" class="bg-green-500 w-12 h-12 rounded-lg text-center align-middle py-3 mx-auto"
              data-status="szabad" :data-line="i" :data-seatNumber="j">
        {{ j }}
      </button>
      <div class="text-center font-semibold py-3 text-xl">
        {{ i }}
      </div>
    </div>
  </div>
</template>

<style scoped>

</style>