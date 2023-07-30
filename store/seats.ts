import { defineStore } from "pinia";

export const useSeatsStore = defineStore("seats-list", {
    state: () => ({ seatsList: [] as Seat[] }),
    actions: {
        addSeat(value: Seat) {
            this.seatsList.push(value);
        }
    },
    getters: {
        getList: state => JSON.parse(JSON.stringify(state.seatsList)),
    },
})

interface Seat {
    seat_id: number,
    row_number: number,
    seat_number: number
}