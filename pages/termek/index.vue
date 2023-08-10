<script setup>
  import BackButton from "~/components/BackButton.vue";

  const { data } = await useFetch("/api/room/getRooms");
  const rooms = JSON.parse(JSON.stringify(data.value));
</script>

<template>
  <div class="flex justify-between">
    <div>
      <NuxtLink v-for="room in rooms" :to="'/termek/' + room.name.toLowerCase()" class="text-3xl font-semibold mb-4 hover:text-red-700 block max-w-fit">{{ room.name }}</NuxtLink>
    </div>
    <BackButton to="/"></BackButton>
  </div>
</template>

<style scoped>

</style>