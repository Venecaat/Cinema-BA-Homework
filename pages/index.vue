<script setup>
  const roomName = "ZEUS";
  const { data } = await useFetch(`/api/reservedSeats?roomName=${roomName}`);
  const seats = JSON.parse(JSON.stringify(data.value));

  function select(e) {
    let selectedElement = e.target;
    let status = selectedElement.dataset.status;

    if (status === "szabad"){
      selectedElement.dataset.status = "foglalt";
      selectedElement.classList.add("bg-orange-500", "hover:bg-orange-400");
      selectedElement.classList.remove("bg-green-600", "hover:bg-green-500");
    }
    else{
      selectedElement.dataset.status = "szabad";
      selectedElement.classList.add("bg-green-600", "hover:bg-green-500");
      selectedElement.classList.remove("bg-orange-500", "hover:bg-orange-400");
    }
  }
</script>

<template>
  <h1 class="text-3xl mb-4">Terem - {{ roomName }}</h1>
  <div class="text-xl pl-4 mb-6 font-semibold">
    <h3>Oppenheimer - 19:30</h3>
  </div>

  <div class="grid gap-3 p-4 w-6/12 mb-6 mx-auto font-semibold">
    <div v-for="i in 8" :key="i" class="grid grid-flow-col">
      <div class="text-center font-semibold py-3 text-xl">
        {{ i }}
      </div>
      <button v-for="j in 8" :key="j" class="w-12 h-12 rounded-lg text-center align-middle py-3 mx-auto text-white"
              :class="!seats.some(s => s.seat.row_number === i && s.seat.seat_number === j) ? 'bg-green-600 hover:bg-green-500' : 'bg-red-700'"
              :data-status="!seats.some(s => s.seat.row_number === i && s.seat.seat_number === j) ? 'szabad' : 'elkelt'"
              :data-line="i" :data-seatNumber="j" :disabled="seats.some(s => s.seat.row_number === i && s.seat.seat_number === j)" @click="select">
        {{ j }}
      </button>
      <div class="text-center font-semibold py-3 text-xl">
        {{ i }}
      </div>
    </div>
  </div>

  <div class="text-center">
    <button type="button" class="bg-teal-500 hover:bg-teal-300 py-3 px-10 text-2xl font-semibold rounded-xl">Tovább</button>
  </div>
</template>

<style scoped>

</style>