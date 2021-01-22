parse(Int64, "32")
proporción = potencia_de_señal/potencia_de_ruido
decibelios = 10*log10(proporción)
function arco(t, r, angulo)
    arco_lon = 2 * π * r * angulo / 360
    n = trunc(arco_lon / 3) + 1
    paso_lon = arco_lon / n
    paso_angulo = angulo / n
    for i in 1:n
        forward(t, paso_lon)
        turn(t, -paso_angulo)
    end
end
arco(2, 5, 45)
