### Codigo para gerar figura da lista de exercicios da licao 7###

# grafico de linhas
medias <- pretonicas %>%
   filter(AMOSTRA == "PBSP") %>%
   group_by(VOGAL, SEXO, PARTICIPANTE) %>%
   summarise(media_F1 = mean(F1.NORM),
             media_F2 = mean(F2.NORM)) %>%
   print()

png("figDesafio.png", width = 600,
    height = 400)
ggplot(medias, aes(x = media_F2, y = media_F1, group = PARTICIPANTE, color = PARTICIPANTE, label = VOGAL)) + 
   geom_path() +
   geom_label() +
   scale_x_reverse() + 
   scale_y_reverse() + 
   facet_grid(. ~ SEXO) + 
   labs(x = "Medidas de F2 normalizado", y = "Medidas de F1 normalizado", group = "Falante", color = "Falante") + 
   ggtitle("Espaços vocálicos dos migrantes paraibanos em São Paulo") + 
   theme_bw()
dev.off()


rm(medias)

