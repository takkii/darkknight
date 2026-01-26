/**
 * Updated by Takayuki Kamiyama on 2026/01/02.
 * Team 'Red Eyes, Black Dragon.'
 */

function copyright() {
    OneDay = new Date();
    OneYear = this.OneDay.getFullYear();

    const cpr_2025 = document.getElementById("cpr");
    cpr_2025.innerHTML = "Copyright &copy; 2025-" + OneYear + " Takayuki Kamiyama.";
}

copyright()