<script setup>
  const { data } = await useFetch("/api/room/getRooms");
  const rooms = JSON.parse(JSON.stringify(data.value));
</script>

<template>
  <NuxtLink v-for="room in rooms" :to="'/termek/' + room.name.toLowerCase()" class="text-3xl font-semibold mb-4 hover:text-red-700 block max-w-fit">{{ room.name }}</NuxtLink>
</template>

<style scoped>

</style>