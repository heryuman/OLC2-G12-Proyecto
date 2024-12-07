<script>
    import "../app.css";
  </script>
  
  <div class="w-screen h-screen bg-gray-100">
    <header class="bg-black text-white p-4 shadow-md flex justify-between items-center">
        <h1 class="text-2xl font-bold">Proyecto Fase1-G12</h1>
        <nav class="flex space-x-4">
        <a href="/" class="hover:underline">Inicio</a>
        <a href="/about" class="hover:underline">Integrantes</a>
        </nav>
    </header>

    <slot />
  </div>