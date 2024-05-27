<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <style>
        .bg-btn {
            margin-top: 20px;
            text-align: center;
        }
        .navbar {
            padding: 16px;
            background-color: #f3f4f6; /* Cambia il colore di sfondo se necessario */
        }

        .navbar-section {
            text-align: center;
        }

        .navbar-section p {
            margin-bottom: 8px;
            color: #4b5563; /* Cambia il colore del testo se necessario */
        }
    </style>
    <title>Dashboard</title>
</head>
<body>
<?php
// Verifica se le variabili sono definite e imposta valori predefiniti se non lo sono
$isSolved = isset($isSolved) ? $isSolved : false;
$isSolved1 = isset($isSolved1) ? $isSolved1 : false;
?>

<header class="bg-white w-full">
    <div class="mx-auto flex h-16 max-w-[4800px] items-center justify-between px-4 sm:px-6 lg:px-8">
        <!-- Logo "Home" a sinistra -->
        <a class="block text-teal-600" href="index.php?dash">
            <span class="sr-only">Home</span>
            <svg class="h-8" viewBox="0 0 28 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                        d="M0.41 10.3847C1.14777 7.4194 2.85643 4.7861 5.2639 2.90424C7.6714 1.02234 10.6393 0 13.695 0C16.7507 0 19.7186 1.02234 22.1261 2.90424C24.5336 4.7861 26.2422 7.4194 26.98 10.3847H25.78C23.7557 10.3549 21.7729 10.9599 20.11 12.1147C20.014 12.1842 19.9138 12.2477 19.81 12.3047H19.67C19.5662 12.2477 19.466 12.1842 19.37 12.1147C17.6924 10.9866 15.7166 10.3841 13.695 10.3841C11.6734 10.3841 9.6976 10.9866 8.02 12.1147C7.924 12.1842 7.8238 12.2477 7.72 12.3047H7.58C7.4762 12.2477 7.376 12.1842 7.28 12.1147C5.6171 10.9599 3.6343 10.3549 1.61 10.3847H0.41ZM23.62 16.6547C24.236 16.175 24.9995 15.924 25.78 15.9447H27.39V12.7347H25.78C24.4052 12.7181 23.0619 13.146 21.95 13.9547C21.3243 14.416 20.5674 14.6649 19.79 14.6649C19.0126 14.6649 18.2557 14.416 17.63 13.9547C16.4899 13.1611 15.1341 12.7356 13.745 12.7356C12.3559 12.7356 11.0001 13.1611 9.86 13.9547C9.2343 14.416 8.4774 14.6649 7.7 14.6649C6.9226 14.6649 6.1657 14.416 5.54 13.9547C4.4144 13.1356 3.0518 12.7072 1.66 12.7347H0V15.9447H1.61C2.39051 15.924 3.154 16.175 3.77 16.6547C4.908 17.4489 6.2623 17.8747 7.65 17.8747C9.0377 17.8747 10.392 17.4489 11.53 16.6547C12.1468 16.1765 12.9097 15.9257 13.69 15.9447C14.4708 15.9223 15.2348 16.1735 15.85 16.6547C16.9901 17.4484 18.3459 17.8738 19.735 17.8738C21.1241 17.8738 22.4799 17.4484 23.62 16.6547ZM23.62 22.3947C24.236 21.915 24.9995 21.664 25.78 21.6847H27.39V18.4747H25.78C24.4052 18.4581 23.0619 18.886 21.95 19.6947C21.3243 20.156 20.5674 20.4049 19.79 20.4049C19.0126 20.4049 18.2557 20.156 17.63 19.6947C16.4899 18.9011 15.1341 18.4757 13.745 18.4757C12.3559 18.4757 11.0001 18.9011 9.86 19.6947C9.2343 20.156 8.4774 20.4049 7.7 20.4049C6.9226 20.4049 6.1657 20.156 5.54 19.6947C4.4144 18.8757 3.0518 18.4472 1.66 18.4747H0V21.6847H1.61C2.39051 21.664 3.154 21.915 3.77 22.3947C4.908 23.1889 6.2623 23.6147 7.65 23.6147C9.0377 23.6147 10.392 23.1889 11.53 22.3947C12.1468 21.9165 12.9097 21.6657 13.69 21.6847C14.4708 21.6623 15.2348 21.9135 15.85 22.3947C16.9901 23.1884 18.3459 23.6138 19.735 23.6138C21.1241 23.6138 22.4799 23.1884 23.62 22.3947Z"
                        fill="currentColor"
                />
            </svg>
        </a>

        <div class="flex items-center">
            <div class="sm:flex sm:gap-4">
                <!-- Bottone "Login" -->
                <a class="block rounded-md bg-teal-600 px-5 py-2.5 text-sm font-medium text-white transition hover:bg-teal-700" href="index.php?login">Login</a>
                <!-- Bottone "Register" -->
                <a class="block rounded-md bg-gray-100 px-5 py-2.5 text-sm font-medium text-teal-600 transition hover:text-teal-600/75 sm:block" href="index.php?signUp">Register</a>
            </div>
        </div>
    </div>
</header>

<header class="navbar">
    <section class="navbar-section">

        <!-- Verifica se displayedName è definito e non è vuoto -->
        <?php if (isset($displayedName) && !empty($displayedName)): ?>
        <p>Welcome, <?php echo $displayedName; ?></p>
        <?php else: ?>
        <p>Sign in to compile our surveys if you already have an account or Register if you don't</p>
        <?php endif; ?>

</header>


<br><br>
<div class="mx-14">
    <div class="flex justify-between">
        <a href="index.php?waterSurvey" class="group relative block h-40 sm:h-48 lg:h-56 w-1/2">
            <span class="absolute inset-0 border-2 border-dashed border-black"></span>
            <div class="relative flex h-full transform items-end border-2 border-black bg-white transition-transform group-hover:-translate-x-2 group-hover:-translate-y-2">
                <div class="p-2 sm:p-4 lg:p-6 !pt-0 transition-opacity group-hover:absolute group-hover:opacity-0 sm:p-6 lg:p-8">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" class="size-8 sm:size-10">
                        <path d="M46.84 5.32l-4.16-4.16a4 4 0 0 0-5.58 0C1.7 36.55 3.65 34.52 3.53 34.88S3 36.78 0 46.72A1 1 0 0 0 1 48c.21 0 12.08-3.45 12.39-3.68s-2.75 2.79 33.45-33.42a4 4 0 0 0 0-5.58zM35 6.05l7 6.95-1.37 1.37-6.97-6.95zM10.45 38.91l-1-.34-.34-1L35 11.61l1.39 1.39zm21.8-30.08l1.36 1.37L7.79 36l-1.71-1 24.16-24.18zm-6.13 2.94l-2-1.23-1.16 3.94a9.88 9.88 0 0 0 3.43 3.43l2-1.23c-2.56-.86-2.06-.36-2.94-2.94zm10.55-1.15l-1-1.71-25.8 25.82 1.37 1.36zm5.43-1.43l-2.07 2.07-6.92-6.92 2.07-2.07a1.94 1.94 0 0 1 2.75 0l4.17 4.17a1.94 1.94 0 0 1 0 2.75z"/>
                    </svg>
                    <h2 class="mt-2 text-base font-medium sm:text-xl">Compile our survey</h2>
                </div>
                <div class="absolute p-2 sm:p-4 lg:p-6 opacity-0 transition-opacity group-hover:relative group-hover:opacity-100 sm:p-6 lg:p-8">
                    <h3 class="mt-2 text-base font-medium sm:text-xl">Compile our survey</h3>
                    <p class="mt-2 text-xs sm:text-sm">
                        Here you can compile our survey regarding the quality of water in your house.
                    </p>
                    <p class="mt-4 text-xs font-bold">Go to survey</p>
                </div>

                <div class="absolute bottom-2 right-2">
                    <strong
                            class="inline-flex items-center gap-1 rounded-ee-xl rounded-ss-xl <?php echo $isSolved ? 'bg-green-600' : 'bg-red-600'; ?> px-3 py-1.5 text-white"
                    >
                        <svg
                                xmlns="http://www.w3.org/2000/svg"
                                class="h-4 w-4"
                                fill="none"
                                viewBox="0 0 24 24"
                                stroke="currentColor"
                                stroke-width="2"
                        >
                            <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    d="M<?php echo $isSolved?>"
                            />
                        </svg>
                        <span class="text-[10px] font-medium sm:text-xs"><?php echo $isSolved ? 'Solved!' : 'Not Solved'; ?></span>
                    </strong>
                </div>
            </div>
        </a>
        <a href="#" class="group relative block h-40 sm:h-48 lg:h-56 w-1/2">
            <span class="absolute inset-0 border-2 border-dashed border-black"></span>
            <div class="relative flex h-full transform items-end border-2 border-black bg-white transition-transform group-hover:-translate-x-2 group-hover:-translate-y-2">
                <div class="p-2 sm:p-4 lg:p-6 !pt-0 transition-opacity group-hover:absolute group-hover:opacity-0 sm:p-6 lg:p-8">
                    <svg xmlns="http://www.w3.org/2000/svg" class="size-8 sm:size-10" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h1.064M15 20.488V18a2 2 0 012-2h3.064M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                    <h2 class="mt-2 text-base font-medium sm:text-xl">Go around the world</h2>
                </div>
                <div class="absolute p-2 sm:p-4 lg:p-6 opacity-0 transition-opacity group-hover:relative group-hover:opacity-100 sm:p-6 lg:p-8">
                    <h3 class="mt-2 text-base font-medium sm:text-xl">Go around the world</h3>
                    <p class="mt-2 text-xs sm:text-sm">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Cupiditate, praesentium voluptatem
                        omnis atque culpa repellendus.
                    </p>
                    <p class="mt-4 text-xs font-bold">Read more</p>
                </div>

                <div class="absolute bottom-2 right-2">
                    <strong
                            class="inline-flex items-center gap-1 rounded-ee-xl rounded-ss-xl <?php echo $isSolved1 ? 'bg-green-600' : 'bg-red-600'; ?> px-3 py-1.5 text-white"
                    >
                        <svg
                                xmlns="http://www.w3.org/2000/svg"
                                class="h-4 w-4"
                                fill="none"
                                viewBox="0 0 24 24"
                                stroke="currentColor"
                                stroke-width="2"
                        >
                            <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    d="M<?php echo $isSolved1?>"
                            />
                        </svg>
                        <span class="text-[10px] font-medium sm:text-xs"><?php echo $isSolved1 ? 'Solved!' : 'Not Solved'; ?></span>
                    </strong>
                </div>
            </div>
    </div>
    </a>
</div>
</div>

<!-- -->

<section>
    <div class="mx-auto max-w-screen-2xl px-4 py-8 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 gap-4 md:grid-cols-2">
            <div class="bg-blue-600 p-8 md:p-12 lg:px-16 lg:py-24">
                <div class="mx-auto max-w-xl text-center">
                    <h2 class="text-2xl font-bold text-white md:text-3xl">
                        What do you know about the quality standards of tap water?
                    </h2>
                    <p class="hidden text-white/90 sm:mt-4 sm:block">
                        Is tap water safe?

                        In reality, just like bottled mineral water comes from well-defined geological environments,
                        naturally protected, uncontaminated, and periodically monitored, tap water also originates 84.8%
                        from underground aquifers, also naturally protected. In both cases, before being released into the market,
                        these waters undergo rigorous controls and, if necessary, purification processes, ensuring water that is
                        safe for consumption.
                        We've designed surveys to gather information from individuals worldwide.
                        Click the button below to view the data we've gathered.
                    </p>
                    <div class="bg-btn">
                        <button class="bg-transparent hover:bg-gray-400 text-white font-semibold hover:text-white py-2 px-4 border border-white hover:border-transparent rounded" onclick="scrollToContent(event);">
                            Learn More
                        </button>
                    </div>
                </div>
            </div>
            <div class="mx-auto max-w-screen-2xl px-4 py-8 sm:px-6 lg:px-8" style="display: flex; align-items: center; justify-content: center; padding: 20px;">
                <div style="border: 5px solid #4A90E2; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); width: 100%; height: 100%;">
                    <img
                            alt=""
                            src="/img/water3.png"
                            style="width: 100% ; height: 100%; object-fit: cover;"
                    />
                </div>
            </div>
        </div>
    </div>
</section>



<br><br><br><br><br><br><br><br><br><br>

<section class="bg-gray-900 text-white">
    <div class="mx-auto max-w-screen-xl px-4 py-8 sm:px-6 sm:py-12 lg:px-8 lg:py-16">
        <div class="mx-auto max-w-lg text-center">
            <h2 class="text-3xl font-bold sm:text-4xl">Here is the result of our surveys</h2>

            <p class="mt-4 text-gray-300">
                Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consequuntur aliquam doloribus
                nesciunt eos fugiat. Vitae aperiam fugit consequuntur saepe laborum.
            </p>
        </div>

        <div class="mt-8 grid grid-cols-1 gap-8 md:grid-cols-2 lg:grid-cols-3">
            <div
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
            >
                <div id="content">
                    <div hidden="hidden">
                        <p id="tap1"><?=$tapWater1?></p>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-10">
                                <div id="chart"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <h2 class="mt-4 text-xl font-bold text-white">Digital campaigns</h2>

                <p class="mt-1 text-sm text-gray-300">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Ex ut quo possimus adipisci
                    distinctio alias voluptatum blanditiis laudantium.
                </p>
            </div>

            <div
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
            >

                <div hidden="hidden">
                    <p id="tap2"><?=$tapWater2?></p>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10">
                            <div id="chart1"></div>
                        </div>
                    </div>
                </div>
                <h2 class="mt-4 text-xl font-bold text-white">Digital campaigns</h2>

                <p class="mt-1 text-sm text-gray-300">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Ex ut quo possimus adipisci
                    distinctio alias voluptatum blanditiis laudantium.
                </p>
            </div>

            <a
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
                    href="#"
            >
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        class="size-10 text-pink-500"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                >
                    <path d="M12 14l9-5-9-5-9 5 9 5z" />
                    <path
                            d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z"
                    />
                    <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M12 14l9-5-9-5-9 5 9 5zm0 0l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14zm-4 6v-7.5l4-2.222"
                    />
                </svg>

                <h2 class="mt-4 text-xl font-bold text-white">Digital campaigns</h2>

                <p class="mt-1 text-sm text-gray-300">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Ex ut quo possimus adipisci
                    distinctio alias voluptatum blanditiis laudantium.
                </p>
            </a>

            <a
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
                    href="#"
            >
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        class="size-10 text-pink-500"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                >
                    <path d="M12 14l9-5-9-5-9 5 9 5z" />
                    <path
                            d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z"
                    />
                    <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M12 14l9-5-9-5-9 5 9 5zm0 0l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14zm-4 6v-7.5l4-2.222"
                    />
                </svg>

                <h2 class="mt-4 text-xl font-bold text-white">Digital campaigns</h2>

                <p class="mt-1 text-sm text-gray-300">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Ex ut quo possimus adipisci
                    distinctio alias voluptatum blanditiis laudantium.
                </p>
            </a>

            <a
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
                    href="#"
            >
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        class="size-10 text-pink-500"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                >
                    <path d="M12 14l9-5-9-5-9 5 9 5z" />
                    <path
                            d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z"
                    />
                    <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M12 14l9-5-9-5-9 5 9 5zm0 0l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14zm-4 6v-7.5l4-2.222"
                    />
                </svg>

                <h2 class="mt-4 text-xl font-bold text-white">Digital campaigns</h2>

                <p class="mt-1 text-sm text-gray-300">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Ex ut quo possimus adipisci
                    distinctio alias voluptatum blanditiis laudantium.
                </p>
            </a>

            <a
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
                    href="#"
            >
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        class="size-10 text-pink-500"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                >
                    <path d="M12 14l9-5-9-5-9 5 9 5z" />
                    <path
                            d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z"
                    />
                    <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M12 14l9-5-9-5-9 5 9 5zm0 0l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14zm-4 6v-7.5l4-2.222"
                    />
                </svg>

                <h2 class="mt-4 text-xl font-bold text-white">Digital campaigns</h2>

                <p class="mt-1 text-sm text-gray-300">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Ex ut quo possimus adipisci
                    distinctio alias voluptatum blanditiis laudantium.
                </p>
            </a>
        </div>

        <div class="mt-12 text-center">
            <a
                    href="#"
                    class="inline-block rounded bg-pink-600 px-12 py-3 text-sm font-medium text-white transition hover:bg-pink-700 focus:outline-none focus:ring focus:ring-yellow-400"
            >
                Get Started Today
            </a>
        </div>
    </div>
</section>


<script>
    function scrollToContent(event) {
        event.preventDefault();
        document.getElementById('content').scrollIntoView({ behavior: 'smooth' });
    }
    let options = {
        series: [44, 55, 13, 43, 22],
        chart: {
            width: 380,
            type: 'pie',
        },
        labels: ['Excellent', 'Good', 'Fair', 'Poor'],
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 200
                },
                legend: {
                    position: 'bottom'
                }
            }
        }]
    };
    let options1 = {
        series: [44, 55, 13, 43, 22],
        chart: {
            width: 380,
            type: 'pie',
        },
        labels: ['Excellent', 'Good', 'Fair', 'Poor'],
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 200
                },
                legend: {
                    position: 'bottom'
                }
            }
        }]
    };
    var chart = new ApexCharts(document.querySelector("#chart"), options);
    var chart1 = new ApexCharts(document.querySelector("#chart1"), options1);
    chart.render();
    chart1.render();
</script>
</body>
</html>
