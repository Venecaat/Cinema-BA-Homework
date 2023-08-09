<script setup>

</script>

<template>
  <!-- Navbar -->
  <nav class="border-gray-200 dark:bg-gray-900 bg-blue-400">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
      <NuxtLink to="/" class="self-center text-2xl font-semibold whitespace-nowrap text-cyan-50 hover:text-red-700">Cinema BA</NuxtLink>
      <div class="hidden w-full md:block md:w-auto" id="navbar-default">
        <ul class="font-medium flex flex-row">
          <li>
            <NuxtLink href="/" class="block py-2 pl-3 pr-4 text-cyan-50 hover:text-red-700">Főoldal</NuxtLink>
          </li>
          <li>
            <NuxtLink href="/termek" class="block py-2 pl-3 pr-4 text-cyan-50 hover:text-red-700">Termek</NuxtLink>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page content -->
  <div class="max-w-screen-xl shadow-2xl rounded-lg mx-auto p-4 mt-4">
    <slot />
  </div>

</template>

<style scoped>

</style>