const botaoTema = document.getElementById("botao-tema");
const temaSalvo = localStorage.getItem("tema");

if (temaSalvo === "light") {
    document.documentElement.setAttribute("data-theme", "light");
    botaoTema.textContent = "🌙";
}

botaoTema.addEventListener("click", () => {
    const temaAtual = document.documentElement.getAttribute("data-theme");

    if (temaAtual === "light") {
        document.documentElement.removeAttribute("data-theme");
        localStorage.setItem("tema", "dark");
        botaoTema.textContent = "☀️";
    } else {
        document.documentElement.setAttribute("data-theme", "light");
        localStorage.setItem("tema", "light");
        botaoTema.textContent = "🌙";
    }
});