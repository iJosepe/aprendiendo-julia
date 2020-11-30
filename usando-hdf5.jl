# Instalación
# julia> ]
# pkg> add hdf5
# julia> using hdf5

# Leer y escribir una variable en un archivo usando el nombre del archivo
A = collect(reshape(1:120, 15, 8))
h5write("/tmp/test2.h5", "mygroup2/A", A)
data = h5read("/tmp/test2.h5", "mygroup2/A", (2:3:15, 3:5))

# Usando la sintaxis funcional tenemos mayor control
h5open("mydata.h5", "w") do file
    write(file, "A", A)  # como alternativa  "@write file A"
end

c = h5open("mydata.h5", "r") do file
    read(file, "A")
end
