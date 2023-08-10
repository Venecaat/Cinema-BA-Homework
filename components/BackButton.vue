<script setup>
defineProps({
  to: String
})
</script>

<template>
  <button type="button" class="p-2 border-2 rounded-full border-red-400 hover:bg-red-400 ease-in duration-100 max-h-11">
    <NuxtLink :to="to">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M19 12H6M12 5l-7 7 7 7"/>
      </svg>
    </NuxtLink>
  </button>
</template>

<style scoped>

</style>