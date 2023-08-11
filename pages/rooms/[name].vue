<script setup>
import { useSeatsStore, useTempReservationStore } from "~/store/seats";

const seatStore = useSeatsStore();
const tempResStore = useTempReservationStore();
const { name } = useRoute().params;


// Get room id
const getRoomId = async () => {
  const { data } = await useFetch(`/api/room/getRoomByName?roomName=${name}`);
  return data.value === null ? null : data.value.id;
}
const roomId = await getRoomId();
if (roomId === null) throw createError({ statusCode: 404, statusMessage: "Page Not Found" });


// Get seats for the selected room
const getSeats = async () => {
  const { data } = await useFetch(`/api/seat/getSeats?id=${roomId}`);
  return JSON.parse(JSON.stringify(data.value));
}
const seats = await getSeats();


// Get reserved seats for the selected room
const getReservedSeats = async () => {
  const { data } = await useFetch(`/api/reservedSeat/getReservedSeats?id=${roomId}`);
  return JSON.parse(JSON.stringify(data.value));
}
let reservedSeats = await getReservedSeats();


// Get row and seat number in a row for a room
const getNoRowsAndSeats = async () => {
  const { data } = await useFetch(`/api/seat/getRowAndNoSeatsInRow?id=${roomId}`);
  return JSON.parse(JSON.stringify(data.value._max));
}
const noRowsAndSeats = await getNoRowsAndSeats();


// Check reserved seats in case of 2 min elapsed since reservation to free the seats
const minuteInMilliseconds = 60000;

if (reservedSeats.some(s => !s.sold)) {
  const failedReservationIds = [];

  for (const seat of reservedSeats) {
    const reserveTime = Date.parse(seat.reservation.reserved_at);
    if (!seat.sold) {
      if ((Date.now() - reserveTime) / minuteInMilliseconds >= 2) {
        failedReservationIds.push(seat.reservation.id)
      }
    }
  }

  if (failedReservationIds.length !== 0) {
    await useFetch(`/api/reservation/deleteReservations`, {
      method: "delete",
      body: {
        reservationIds: failedReservationIds
      }
    });
    // reservedSeats = reservedSeats.filter(s => !(s.reservation.id in failedReservationIds)); // Not working. Probably the "in" is not working?
  }
}


// Selecting the seats
const select = (e) => {
  let selectedElement = e.target;
  let status = selectedElement.dataset.status;

  if (status === "szabad"){
    selectedElement.dataset.status = "foglalas_alatt";
    selectedElement.classList.add("bg-orange-500", "hover:bg-orange-400");
    selectedElement.classList.remove("bg-green-600", "hover:bg-green-500");
  }
  else{
    selectedElement.dataset.status = "szabad";
    selectedElement.classList.add("bg-green-600", "hover:bg-green-500");
    selectedElement.classList.remove("bg-orange-500", "hover:bg-orange-400");
  }
}


// Clicking 'Tovább' button reserves the selected seats
const reserveSeats = async () => {
  const seatsToReserve = document.querySelectorAll("[data-status='foglalas_alatt']");

  if (seatsToReserve.length === 0) alert("Nem választott ki egy helyet sem!");
  else {
    let conflicts = 0;
    const seatsCheck = await getReservedSeats();

    for (const seat of seatsToReserve) {
      if (seatsCheck.some(s => s.seat_id === seat.dataset.seatid)) conflicts++;
    }

    if (conflicts !== 0) alert("A kiválasztott helyek közül egy vagy több már foglalt vagy elkelt!");
    else {
      for (const seat of seatsToReserve) {
        seatStore.addSeat({
          seat_id: +seat.dataset.seatid,
          row_number: +seat.dataset.rownumber,
          seat_number: +seat.dataset.seatnumber
        });
      }
      const tempSeats = seatStore.getList;

      const { data } = await useFetch("/api/reservedSeat/createReservedSeats", {
        method: "post",
        body: {
          seats: tempSeats
        }
      });
      const tempReservation = JSON.parse(JSON.stringify(data.value.reservation));

      for (const res of tempReservation) {
        tempResStore.addTempRes(res.id);
      }

      navigateTo("/reserve");
    }
  }
}
</script>

<template>
  <div class="flex justify-between mb-4">
    <h1 class="text-4xl">Terem - {{ name.toUpperCase() }}</h1>
    <BackButton to="/rooms"></BackButton>
  </div>
  <div class="text-xl pl-4 mb-6 font-semibold">
    <h3>Oppenheimer - 19:30</h3>
  </div>

  <div class="grid gap-3 p-4 w-6/12 mb-6 mx-auto font-semibold">
    <div v-for="i in noRowsAndSeats.row_number" :key="i" class="grid grid-flow-col">
      <div class="text-center font-semibold py-3 text-xl">
        {{ i }}
      </div>
      <button v-for="j in noRowsAndSeats.seat_number" :key="j" class="w-12 h-12 rounded-lg text-center align-middle py-3 mx-auto text-white"
              :class="!reservedSeats.some(s => s.seat.row_number === i && s.seat.seat_number === j) ? 'bg-green-600 hover:bg-green-500'
                : reservedSeats.some(s => s.seat.row_number === i && s.seat.seat_number === j && !s.sold) ? 'bg-slate-600' : 'bg-red-700'"
              :data-status="!reservedSeats.some(s => s.seat.row_number === i && s.seat.seat_number === j) ? 'szabad'
                : reservedSeats.some(s => s.seat.row_number === i && s.seat.seat_number === j && !s.sold) ? 'foglalt' : 'elkelt'"
              :data-seatID="(i - 1) * 8 + j" :data-rowNumber="i" :data-seatNumber="j"
              :disabled="reservedSeats.some(s => s.seat.row_number === i && s.seat.seat_number === j)" @click="select">
        {{ j }}
      </button>
      <div class="text-center font-semibold py-3 text-xl">
        {{ i }}
      </div>
    </div>
  </div>

  <div class="text-center">
    <button type="button" class="bg-teal-500 hover:bg-teal-300 py-3 px-10 text-2xl font-semibold rounded-xl" @click="reserveSeats">Tovább</button>
  </div>
</template>

<style scoped>

</style>