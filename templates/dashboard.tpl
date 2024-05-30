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
                <?php if (!isset($displayedName) && empty($displayedName)): ?>
                <!-- Bottone "Login" -->
                <a class="block rounded-md bg-teal-600 px-5 py-2.5 text-sm font-medium text-white transition hover:bg-teal-700" href="index.php?login">Login</a>
                <?php else: ?>
                <a class="block rounded-md bg-teal-600 px-5 py-2.5 text-sm font-medium text-white transition hover:bg-teal-700" href="index.php?action=logout">Logout</a>
                <?php endif; ?>
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
        <a href="index.php?waterSurvey1" class="group relative block h-40 sm:h-48 lg:h-56 w-1/2">
            <span class="absolute inset-0 border-2 border-dashed border-black"></span>
            <div class="relative flex h-full transform items-end border-2 border-black bg-white transition-transform group-hover:-translate-x-2 group-hover:-translate-y-2">
                <div class="p-2 sm:p-4 lg:p-6 !pt-0 transition-opacity group-hover:absolute group-hover:opacity-0 sm:p-6 lg:p-8">
                    <svg xmlns="http://www.w3.org/2000/svg" id="Filled" viewBox="0 0 24 24" width="50" height="50"><path d="M1.172,19.119A4,4,0,0,0,0,21.947V24H2.053a4,4,0,0,0,2.828-1.172L18.224,9.485,14.515,5.776Z"/><path d="M23.145.855a2.622,2.622,0,0,0-3.71,0L15.929,4.362l3.709,3.709,3.507-3.506A2.622,2.622,0,0,0,23.145.855Z"/></svg>
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
        <a href="index.php?waterSurvey2" class="group relative block h-40 sm:h-48 lg:h-56 w-1/2">
            <span class="absolute inset-0 border-2 border-dashed border-black"></span>
            <div class="relative flex h-full transform items-end border-2 border-black bg-white transition-transform group-hover:-translate-x-2 group-hover:-translate-y-2">
                <div class="p-2 sm:p-4 lg:p-6 !pt-0 transition-opacity group-hover:absolute group-hover:opacity-0 sm:p-6 lg:p-8">
                    <svg xmlns="http://www.w3.org/2000/svg" id="Filled" viewBox="0 0 24 24" width="50" height="50"><path d="M1.172,19.119A4,4,0,0,0,0,21.947V24H2.053a4,4,0,0,0,2.828-1.172L18.224,9.485,14.515,5.776Z"/><path d="M23.145.855a2.622,2.622,0,0,0-3.71,0L15.929,4.362l3.709,3.709,3.507-3.506A2.622,2.622,0,0,0,23.145.855Z"/></svg>
                    <h2 class="mt-2 text-base font-medium sm:text-xl">Compile our survey</h2>
                </div>
                <div class="absolute p-2 sm:p-4 lg:p-6 opacity-0 transition-opacity group-hover:relative group-hover:opacity-100 sm:p-6 lg:p-8">
                    <h3 class="mt-2 text-base font-medium sm:text-xl">Compile our survey</h3>
                    <p class="mt-2 text-xs sm:text-sm">
                        Here you can compile a survey regarding the importance of water bodies in your opinion.
                    </p>
                    <p class="mt-4 text-xs font-bold">Go to survey</p>
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
                Here are some insights from our community regarding the quality of tap water in their area.            </p>
        </div>

        <div class="mt-8 grid grid-cols-1 gap-8 md:grid-cols-2 lg:grid-cols-3">
            <div
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
            >
                <div id="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-10">
                                <div id="chart0"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <h2 class="mt-4 text-xl font-bold text-white">Domanda 1</h2>

                <p class="mt-1 text-sm text-gray-300">
                    How would you rate the overall quality of the tap water in your area?
                </p>
            </div>

            <div
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
            >
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10">
                            <div id="chart1"></div>
                        </div>
                    </div>
                </div>
                <h2 class="mt-4 text-xl font-bold text-white">Domanda 2</h2>

                <p class="mt-1 text-sm text-gray-300">
                    Have you noticed any unusual taste or odor in the tap water?
                </p>
            </div>
            <div
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
            >
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10">
                            <div id="chart2"></div>
                        </div>
                    </div>
                </div>



                <h2 class="mt-4 text-xl font-bold text-white">Domanda 3</h2>

                <p class="mt-1 text-sm text-gray-300">
                    How frequently do you use tap water for drinking?
                </p>
            </div>
            <div
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
            >
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10">
                            <div id="chart3"></div>
                        </div>
                    </div>
                </div>



                <h2 class="mt-4 text-xl font-bold text-white">Domanda 4</h2>

                <p class="mt-1 text-sm text-gray-300">
                    Do you use any water filtration systems at home?
                </p>
            </div>
        </div>


        <div class="mt-12 text-center">
            <p class="mt-4 text-gray-300">
                Here you can see the result of our survey regarding the importance of water bodies.            </p>
        </div>
        <div class="mt-8 grid grid-cols-1 gap-8 md:grid-cols-2 lg:grid-cols-3">
            <div
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
            >
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10">
                            <div id="chart4"></div>
                        </div>
                    </div>
                </div>



                <h2 class="mt-4 text-xl font-bold text-white">Domanda 1</h2>

                <p class="mt-1 text-sm text-gray-300">
                    How often do you visit natural water bodies (e.g., lakes, rivers, oceans)?
                </p>
            </div>
            <div
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
            >
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10">
                            <div id="chart5"></div>
                        </div>
                    </div>
                </div>



                <h2 class="mt-4 text-xl font-bold text-white">Domanda 2</h2>

                <p class="mt-1 text-sm text-gray-300">
                    How important do you think it is to conserve natural water bodies?
                </p>
            </div>
            <div
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
            >
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10">
                            <div id="chart6"></div>
                        </div>
                    </div>
                </div>



                <h2 class="mt-4 text-xl font-bold text-white">Domanda 3</h2>

                <p class="mt-1 text-sm text-gray-300">
                    Have you participated in any water conservation activities?
                </p>
            </div>
            <div
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
            >
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10">
                            <div id="chart7"></div>
                        </div>
                    </div>
                </div>



                <h2 class="mt-4 text-xl font-bold text-white">Domanda 4</h2>

                <p class="mt-1 text-sm text-gray-300">
                    If yes, what type of activities have you participated in?
                </p>
            </div>
            <div
                    class="block rounded-xl border border-gray-800 p-8 shadow-xl transition hover:border-pink-500/10 hover:shadow-pink-500/10"
            >
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10">
                            <div id="chart8"></div>
                        </div>
                    </div>
                </div>



                <h2 class="mt-4 text-xl font-bold text-white">Domanda 5</h2>

                <p class="mt-1 text-sm text-gray-300">
                    Do you think pollution is a major problem for our water bodies?
                </p>
            </div>
        </div>
    </div>


</section>

<script>
    function scrollToContent(event) {
        event.preventDefault();
        document.getElementById('content').scrollIntoView({ behavior: 'smooth' });
    }
    var survey1 = [];
    survey1 = JSON.parse('<?php echo json_encode($survey1, JSON_UNESCAPED_UNICODE); ?>');
    survey2 = JSON.parse('<?php echo json_encode($survey2, JSON_UNESCAPED_UNICODE); ?>');

    let tap1 = [];
    tap1 = survey1['tap1'];
    let tap2 = [];
    tap2 = survey1['tap2'];
    let tap3 = [];
    tap3 = survey1['tap3'];
    let tap4 = [];
    tap4 = survey1['tap4'];

    let nat1 = [];
    nat1 = survey2['nat1'];
    let nat2 = [];
    nat2 = survey2['nat2'];
    let nat3 = [];
    nat3 = survey2['nat3'];
    let nat4 = [];
    nat4 = survey2['nat4'];
    let nat5 = [];
    nat5 = survey2['nat5'];
    console.log(nat4);

    // Definizione dei nomi dei grafici e relativi dati
    const chartsData = [
        { id: 'chart0', data: survey1['tap1'] },
        { id: 'chart1', data: survey1['tap2'] },
        { id: 'chart2', data: survey1['tap3'] },
        { id: 'chart3', data: survey1['tap4'] },
        { id: 'chart4', data: survey2['nat1'] },
        { id: 'chart5', data: survey2['nat2'] },
        { id: 'chart6', data: survey2['nat3'] },
        { id: 'chart7', data: survey2['nat4'] },
        { id: 'chart8', data: survey2['nat5'] }
    ];

    // Configurazione comune per tutti i grafici
    const commonOptions = {
        chart: {
            type: 'pie',
            height: 350
        },
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

    // Funzione per generare le opzioni del grafico
    function generateChartOptions(series) {
        return {
            ...commonOptions,
            series: Object.values(series),
            labels: Object.keys(series)
        };
    }

    // Creazione dei grafici utilizzando i dati forniti
    chartsData.forEach((chartData) => {
        const options = generateChartOptions(chartData.data);
        const chart = new ApexCharts(document.querySelector(`#${chartData.id}`), options);
        chart.render();
    });

</script>

</body>
</html>
