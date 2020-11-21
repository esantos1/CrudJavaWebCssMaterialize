document.onsubmit = function () {
    notas = document.getElementsByClassName("numNota").value
    novaNota = notas.replace(",",".")
}