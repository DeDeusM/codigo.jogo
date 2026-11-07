//TROCA DE TEMA
const botaoTema = document.getElementById("botao-tema");
const temaSalvo = localStorage.getItem("tema");

if (temaSalvo === "light") {
    document.documentElement.setAttribute("data-theme", "light");

    if (botaoTema) {
        botaoTema.textContent = "🌙";
    }
}

if (botaoTema) {
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
}


//TRADUÇÕES
const traducoes = {
    "pt-BR": {
        historia: "História",
        fases: "Fases",
        gameplay: "Gameplay",
        desenvolvimento: "Desenvolvimento",
        creditos: "Créditos",
        galeria: "Galeria",
        idioma: "Idioma:",

        titulo: "Restaure o Sistema",
        resumo: "Um vírus chamado 4rqu1v0_X entrou no sistema por um pendrive e nem o antivírus nem o firewall conseguiram impedi-lo. Agora Dinux precisa voltar das férias para restaurar o computador antes que seja tarde demais.",

        historiaTitulo: "História",
        historiaP1: "Dinux é um arquivo antigo que morava no mundo dos computadores, era tratado como herói, salvava o mundo de malwares e de vírus, mas com a evolução da computação ele viu que não tinha mais necessidade de proteger aquele mundo, então foi tirar férias sem tempo determinado pra volta, quando um dia de repente, determinaram sua volta. Um vírus que entrou no sistema através de um pendrive do usuário, 4rqu1v0_X, esse era o vilão da vez, antivírus e o firewall não conseguiram impedi-lo, então sobrou ao nosso dinossauro herói. No jogo terão desafios a partir das mudanças que o vírus fez no computador do usuário.",

        fase1Titulo: "Fase 1 - CPU",
        fase1Texto: "O núcleo central do computador.",
        fase2Titulo: "Fase 2 - Memória RAM",
        fase2Texto: "Circuitos, blocos de dados e regiões instáveis do sistema.",
        fase3Titulo: "Fase 3 - Fonte de Energia",
        fase3Texto: "A última linha de defesa, onde a energia falha e raios descontrolados caem sobre o sistema.",
        fase4Titulo: "Fase 4 - Sistema Operacional",
        fase4Texto: "O núcleo do sistema, onde o vírus se esconde e tenta corromper os arquivos.",

        documentacaoTitulo: "Documentação",
        botaoDownload: "Faça o download da documentação completa do projeto em PDF",
        projetoTitulo: "Download do Projeto",
        botaoDownloadjogo: "Faça o download do jogo completo para Windows",

        desenvolvimentoTitulo: "Ferramentas de Desenvolvimento",
        ferramentasTexto: "Ferramentas utilizadas no projeto:",
        creditosTitulo: "Equipe de Desenvolvimento",
        papelWeb: "Desenvolvedor WEB",
        papelDesign: "Design Gráfico",
        papelProgramadora: "Programadora",
        papelProgramador: "Programador",
        papelTutoriais: "Tutoriais e Pesquisa Técnica",

        linksRapidos: "Links Rápidos",
        inicioPagina: "Início da Página",
        rodape1: "Projeto desenvolvido para atividade de conclusão do 1º Ano.",
        rodape2: "2026 © Todos os Direitos Reservados.",

        storyboard: "Storyboard",
        primeiraFase: "Primeira Fase",
        segundaFase: "Segunda Fase",
        terceiraFase: "Terceira Fase",
        personagem: "Personagem principal (Dinux)",
        cenarios: "Cenários do Jogo",
        cenarioFase1: "Cenário da Primeira Fase",
        cenarioFase2: "Cenário da Segunda Fase",
        cenarioFase3: "Cenário da Terceira Fase",
        cenarioFase4: "Cenário da Quarta Fase",
        codigoTitulo: "Código do Jogo",
        codigo1: "Trecho de código 1",
        codigo2: "Trecho de código 2",
        codigo3: "Trecho de código 3",
        personagemTitulo: "Personagem",
        dinuxAnimado: "Dinux animado",
    },

    en: {
        historia: "Story",
        fases: "Levels",
        gameplay: "Gameplay",
        desenvolvimento: "Development",
        creditos: "Credits",
        galeria: "Gallery",
        idioma: "Language:",

        titulo: "Restore the System",
        resumo: "A virus called 4rqu1v0_X got into the system through a pendrive, and neither the antivirus nor the firewall could stop it. Now Dinux must come back from vacation to restore the computer before it's too late.",

        historiaTitulo: "Story",
        historiaP1: "Dinux is an old file that used to live in the world of computers. He was treated as a hero, saving the world from malware and viruses, but as computing evolved he saw there was no longer any need to protect that world, so he went on a vacation with no set return date. Then one day, suddenly, his return was ordered. A virus that entered the system through the user's pendrive, 4rqu1v0_X, was the villain of the hour. The antivirus and the firewall couldn't stop it, so it was left to our hero dinosaur. In the game there will be challenges based on the changes the virus made to the user's computer.",

        fase1Titulo: "Level 1 - CPU",
        fase1Texto: "The central core of the computer.",
        fase2Titulo: "Level 2 - RAM Memory",
        fase2Texto: "Circuits, data blocks and unstable regions of the system.",
        fase3Titulo: "Level 3 - Power Supply",
        fase3Texto: "The last line of defense, where power fails and wild lightning strikes the system.",
        fase4Titulo: "Level 4 - Operating System",
        fase4Texto: "The core of the system, where the virus hides and tries to corrupt the files.",

        documentacaoTitulo: "Documentation",
        botaoDownload: "Download the complete project documentation as a PDF",
        botaoDownloadjogo: "Download the complete game for Windows",
        projetoTitulo: "Project Download",

        desenvolvimentoTitulo: "Development Tools",
        ferramentasTexto: "Tools used in the project:",
        creditosTitulo: "Development Team",
        papelWeb: "WEB Developer",
        papelDesign: "Graphic Design",
        papelProgramadora: "Programmer",
        papelProgramador: "Programmer",
        papelTutoriais: "Tutorials and Technical Research",

        linksRapidos: "Quick Links",
        inicioPagina: "Top of Page",
        rodape1: "Project developed as the 1st-year final activity.",
        rodape2: "2026 © All Rights Reserved.",

        storyboard: "Storyboard",
        primeiraFase: "First Level",
        segundaFase: "Second Level",
        terceiraFase: "Third Level",
        personagem: "Main character (Dinux)",
        cenarios: "Game Scenes",
        cenarioFase1: "First Level Scene",
        cenarioFase2: "Second Level Scene",
        cenarioFase3: "Third Level Scene",
        cenarioFase4: "Fourth Level Scene",
        codigoTitulo: "Game Code",
        codigo1: "Code Snippet 1",
        codigo2: "Code Snippet 2",
        codigo3: "Code Snippet 3",
        personagemTitulo: "Character",
        dinuxAnimado: "Animated Dinux",
    },

    es: {
        historia: "Historia",
        fases: "Niveles",
        gameplay: "Jugabilidad",
        desenvolvimento: "Desarrollo",
        creditos: "Créditos",
        galeria: "Galería",
        idioma: "Idioma:",

        titulo: "Restaura el sistema",
        resumo: "Un virus llamado 4rqu1v0_X entró al sistema por un pendrive y ni el antivirus ni el firewall lograron detenerlo. Ahora Dinux debe volver de sus vacaciones para restaurar la computadora antes de que sea demasiado tarde.",

        historiaTitulo: "Historia",
        historiaP1: "Dinux es un archivo antiguo que vivía en el mundo de las computadoras. Era tratado como héroe y salvaba el mundo de malwares y virus, pero con la evolución de la computación vio que ya no era necesario proteger ese mundo, así que se fue de vacaciones sin fecha de regreso. Hasta que un día, de repente, ordenaron su vuelta. Un virus que entró al sistema a través de un pendrive del usuario, 4rqu1v0_X, era el villano de turno. El antivirus y el firewall no lograron detenerlo, así que le tocó a nuestro dinosaurio héroe. En el juego habrá desafíos a partir de los cambios que el virus hizo en la computadora del usuario.",

        fase1Titulo: "Nivel 1 - CPU",
        fase1Texto: "El núcleo central de la computadora.",
        fase2Titulo: "Nivel 2 - Memoria RAM",
        fase2Texto: "Circuitos, bloques de datos y regiones inestables del sistema.",
        fase3Titulo: "Nivel 3 - Fuente de Energía",
        fase3Texto: "La última línea de defensa, donde la energía falla y rayos descontrolados caen sobre el sistema.",
        fase4Titulo: "Nivel 4 - Sistema Operativo",
        fase4Texto: "El núcleo del sistema, donde el virus se esconde e intenta corromper los archivos.",

        documentacaoTitulo: "Documentación",
        botaoDownload: "Descarga la documentación completa del proyecto en PDF",
        botaoDownloadjogo: "Descarga el juego completo para Windows",
        projetoTitulo: "Download del Proyecto",

        desenvolvimentoTitulo: "Herramientas de Desarrollo",
        ferramentasTexto: "Herramientas utilizadas en el proyecto:",
        creditosTitulo: "Equipo de Desarrollo",
        papelWeb: "Desarrollador WEB",
        papelDesign: "Diseño Gráfico",
        papelProgramadora: "Programadora",
        papelProgramador: "Programador",
        papelTutoriais: "Tutoriales e Investigación Técnica",

        linksRapidos: "Enlaces rápidos",
        inicioPagina: "Inicio de la página",
        rodape1: "Proyecto desarrollado para la actividad de conclusión del 1.º año.",
        rodape2: "2026 © Todos los derechos reservados.",

        storyboard: "Storyboard",
        primeiraFase: "Primer Nivel",
        segundaFase: "Segundo Nivel",
        terceiraFase: "Tercer Nivel",
        personagem: "Personaje principal (Dinux)",
        cenarios: "Escenarios del Juego",
        cenarioFase1: "Escenario del Primer Nivel",
        cenarioFase2: "Escenario del Segundo Nivel",
        cenarioFase3: "Escenario del Tercer Nivel",
        cenarioFase4: "Escenario del Cuarto Nivel",
        codigoTitulo: "Código del Juego",
        codigo1: "Fragmento de código 1",
        codigo2: "Fragmento de código 2",
        codigo3: "Fragmento de código 3",
        personagemTitulo: "Personaje",
        dinuxAnimado: "Dinux animado",
    }
};

// ==================== TROCA DE IDIOMA ====================

const seletorIdioma = document.getElementById("seletor-idioma");
const idiomaBotao = document.getElementById("idioma-botao");
const idiomaLista = document.getElementById("idioma-lista");
const idiomaAtual = document.getElementById("idioma-atual");

const siglas = { "pt-BR": "PT", en: "EN", es: "ES" };

function mudarIdioma(idioma) {
    document.documentElement.lang = idioma;

    document.querySelectorAll("[data-i18n]").forEach((elemento) => {
        const texto = traducoes[idioma]?.[elemento.dataset.i18n];
        if (texto) elemento.textContent = texto;
    });

    // select nativo
    if (seletorIdioma) seletorIdioma.value = idioma;

    // menu customizado (se existir)
    if (idiomaAtual) idiomaAtual.textContent = siglas[idioma];
    document.querySelectorAll("#idioma-lista li").forEach((item) => {
        item.setAttribute("aria-selected", item.dataset.idioma === idioma);
    });

    localStorage.setItem("idioma", idioma);
}

// Aplica o idioma salvo em todas as páginas.
mudarIdioma(localStorage.getItem("idioma") || "pt-BR");

// --- select nativo ---
if (seletorIdioma) {
    seletorIdioma.addEventListener("change", () => mudarIdioma(seletorIdioma.value));
}

// --- menu customizado ---
function fecharMenuIdioma() {
    if (!idiomaLista || !idiomaBotao) return;
    idiomaLista.classList.remove("aberta");
    idiomaBotao.setAttribute("aria-expanded", "false");
}

if (idiomaBotao && idiomaLista) {
    idiomaBotao.addEventListener("click", (e) => {
        e.stopPropagation();
        const aberta = idiomaLista.classList.toggle("aberta");
        idiomaBotao.setAttribute("aria-expanded", aberta);
    });

    idiomaLista.querySelectorAll("li").forEach((item) => {
        item.addEventListener("click", () => {
            mudarIdioma(item.dataset.idioma);
            fecharMenuIdioma();
        });
    });

    document.addEventListener("click", fecharMenuIdioma);
    document.addEventListener("keydown", (e) => {
        if (e.key === "Escape") fecharMenuIdioma();
    });
}