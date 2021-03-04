#script para copiar figura do desafio da pasta do curso para atual diretório de trabalho

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas_Exercicios", "Estatistica_Descritiva_de_Variaveis_Numericas_Graficos")
origem <- file.path(lesson_dir, "figDesafio.png")

new_dir<-getwd()
destino <- file.path(new_dir, "figDesafio.png") 

file.copy(origem, destino, overwrite = T)

rm(destino)
rm(lesson_dir)
rm(new_dir)
rm(origem)