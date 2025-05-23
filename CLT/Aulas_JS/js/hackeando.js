function hackeando() {
    scrollTo(0, 0);

    document.getElementById("navNome").innerText = "João Basante";

    document.getElementById("cssSite").href = "css/curriculoJoao.css";

    let elementoImg = document.getElementById("foto");
    elementoImg.src = "https://avatars.githubusercontent.com/u/105830574?v=4";
    elementoImg.classList.add("rounded-circle");
    elementoImg.classList.add("img-fluid");
    elementoImg.classList.add("mx-auto");
    elementoImg.classList.add("mt-5");

    document.getElementById("nomeCompleto").innerHTML = "João Victor Rodrigues Basante";
    document.getElementById("cargo").innerHTML = "Desenvolvedor Front-End";
    
    let elementoSecApr = document.getElementById("secApr");
    let ostentacao = document.createElement("h2");
    ostentacao.id = "ostentacao";
    ostentacao.innerHTML = "Sou foda e o resto é moda!!!";
    ostentacao.classList.add("text-center");
    ostentacao.classList.add("text-danger");
    ostentacao.classList.add("mt-5");
    if (document.getElementById("ostentacao") == null) {
        elementoSecApr.appendChild(ostentacao);
    }

    let principal = document.getElementById("principal");
    let sobre = document.getElementById("sobre");
    principal.removeChild(sobre);
}