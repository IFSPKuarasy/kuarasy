var quantidade = 1
qtdSelector = document.querySelector("#qtd")
menos = document.querySelector("#menos")
mais = document.querySelector("#mais")

menos.addEventListener("click", function(){
    quantidade = quantidade - 1;
    qtdSelector.innerHTML = quantidade;
})
mais.addEventListener("click", function(){
    quantidade = quantidade + 1;
    qtdSelector.innerHTML = quantidade;
})