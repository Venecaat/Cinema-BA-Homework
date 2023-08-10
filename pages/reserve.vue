<script setup>
  import { useSeatsStore, useTempReservationStore } from "~/store/seats";

  const seatStore = useSeatsStore();
  const tempResStore = useTempReservationStore();
  let email = "";

  const removeTempRes = async () => {
    await useFetch("/api/reservedSeat/deleteReservedSeats", {
      method: "delete",
      body: {
        reservedSeatIds: tempResStore.getList
      }
    });
  }

  const reserveSeats = async () => {
    email = document.getElementById("emailAddress").value

    if (!email) {
      alert("Az E-mail cím megadása kötelező!");
    }
    else {
      const reservedSeatIds = tempResStore.getList;

      await useFetch("/api/finishReservation", {
        method: "post",
        body: {
          customer: email,
          seatIds: reservedSeatIds
        }
      });

      seatStore.$reset();
      tempResStore.$reset();
      navigateTo("/reserveConfirm");
    }
  }

  const back = async () => {
    await removeTempRes();
    seatStore.$reset();
    tempResStore.$reset();
    history.back();
  }
</script>

<template>
  <div class="flex justify-between">
    <div>
      <h1 class="text-3xl mb-4">Foglalni kívánt helyek:</h1>
      <h4 v-for="seat in seatStore.getList" class="ml-3 font-semibold text-xl">Sor: {{ seat.row_number }}, Szék: {{ seat.seat_number }}</h4>
    </div>
    <BackButton @click="back"></BackButton>
  </div>
  <div class="text-center mt-4">
    <h3 class="text-2xl mb-4 font-semibold text-red-600">A foglalás véglegesítéséhez kérjük adja meg E-mail címét!</h3>
    <input id="emailAddress" type="text" placeholder="E-mail" class="mb-6 mx-auto border-2 border-gray-300 text-gray-900 text-lg rounded-lg block p-2.5">
    <button type="button" class="bg-teal-500 hover:bg-teal-300 py-3 px-10 text-2xl font-semibold rounded-xl" @click="reserveSeats">Lefoglalom</button>
  </div>
</template>

<style scoped>

</style>