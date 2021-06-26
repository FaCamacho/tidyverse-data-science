library(tidyverse)

d<-mpg

# ggplot (data = <DATA> ) +
#   <GEOM_FUNCTION> (mapping = aes( <MAPPINGS> ),
#                    stat = <STAT> , position = <POSITION> ) +
#   <COORDINATE_FUNCTION> +
#   <FACET_FUNCTION> +
#   <SCALE_FUNCTION> +
#   <THEME_FUNCTION>

#Asignament 1

#i 
ggplot(data = mpg)

#ii
dim(mpg)

#iii
dim(mpg)

#iv

?mpg

#v
ggplot(data=mpg)+
  geom_point(mapping = aes(x=hwy, y=cyl))

#vi
ggplot(data=mpg)+
  geom_point(mapping = aes(x=cty, y=cyl))

#vii
ggplot(data=mpg)+
  geom_point(mapping = aes(x=class, y=drv))

#Asignament 2

#i
#Questions for this assignment
#Toma el siguiente fragmento de código y di qué está mal. ¿Por qué no aparecen pintados los puntos de color verde?
  
  ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = "green"))

  #Esa linea de código genera una etiqueta llamada green, para que pinte los puntos de 
  # verde debe estar fuera de la estética

  ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, color = "green"), color="green")

#ii
  #Toma el dataset de mpg anterior y di qué variables son categóricas.

  class(mpg$manufacturer)
  class(mpg$model)
  class(mpg$trans)
  class(mpg$drv)
  class(mpg$fl)
  class(mpg$class)
  
#iii
  #Toma el dataset de mpg anterior y di qué variables son contínuas.
  
class(mpg$displ)
class(mpg$year)
class(mpg$cyl)
class(mpg$cty)
class(mpg$hwy)

glimpse(mpg)

#iv
#Dibuja las variables contínuas con color, tamaño y forma respectivamente.

ggplot(data=d)+
  geom_point(mapping = aes(x=displ,y=year, size=2, color=class))

ggplot(data=d)+
  geom_point(mapping = aes(x=displ,y=cyl,color=drv))

ggplot(data=d)+
  geom_point(mapping = aes(x=displ,y=cty, color=drv))

ggplot(data=d)+
  geom_point(mapping = aes(x=displ,y=hwy),color="red",alpha=0.6,size=3)+
  geom_smooth(mapping = aes(x=displ,y=hwy),color="red",se=F)+
  geom_point(mapping = aes(x=displ,y=cty),color="grey")


ggplot(data=d)+
  geom_point(mapping = aes(x=displ,y=cty),color="green",alpha=0.6,size=3)+
  geom_smooth(mapping = aes(x=displ,y=cty),color="green",se=F)+
  geom_point(mapping = aes(x=displ,y=hwy),color="grey")

#v
#¿En qué se diferencian las estéticas para variables contínuas y categóricas?



#vi 
#¿Qué ocurre si haces un mapeo de la misma variable a múltiples estéticas?



#vii  
#Vamos a conocer una estética nueva llamada stroke. ¿Qué hace? ¿Con qué formas funciona bien? 

?geom_point

ggplot(data=d)+
  geom_point(mapping = aes(x=displ,y=cty,stroke=displ,color=displ <5))


# viii  
# ¿Qué ocurre si haces un mapeo de una estética a algo que no sea directamente el
# nombre de una variable (por ejemplo aes(color = displ < 4))?




#Asignament 3


#i
#¿Qué ocurre si hacemos un facet de una variable contínua?



#ii  
#¿Qué significa si alguna celda queda vacía en el gráfico 

facet_grid(drv~cyl)?

#¿Qué relación guardan esos huecos vacíos con el gráfico siguiente?
  
  ggplot(data = mpg) +
  geom_point(mapping = aes(x=drv, y = cyl)) 


#iii
  #¿Qué gráficos generan las siguientes dos instrucciones?
  #¿Qué hace el punto?
  #¿Qué diferencias hay de escribir la variable antes o después de la virgula?
  
  ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y = hwy)) +
  facet_grid(.~cyl)

  
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y = hwy)) +
  facet_grid(drv~.)

#iv
#El primer facet que hemos pintado era el siguiente:
  
  ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~fl)

 
  #¿Qué ventajas crees que tiene usar facets en lugar de la estética del color? 
  #¿Qué desventajas? ¿Qué cambiaría si tu dataset fuera mucho más grande?
  
  #v
  #Investiga la documentación de ?facet_wrap y contesta a las siguientes preguntas:
  
  #¿Qué hace el parámetro nrow?
  #¿Y el parámetro ncol?
  #¿Qué otras opciones sirven para controlar el layout de los paneles individuales?
  #¿Por qué facet_grid() no tiene los parámetros de nrow ni de ncol?
  
  #vi
  #Razona la siguiente afirmación:
  
  #Cuando representemos un facet con facet_grid() conviene poner la variable con más 
  #niveles únicos en las columnas.




  #Asignament 4

  
#i Ejecuta este código en tu cabeza y predice el resultado. 
#  Luego ejecutalo en R y comprueba tu hipótesis:
    
    ggplot(data = mpg, mapping = aes(x=displ, y = hwy,color = drv)) + 
    geom_point() + 
    geom_smooth( se = F)

#ii    ¿Qué hace el parámetro show.legend = F? ¿Qué pasa si lo eliminamos?
#      ¿Cuando lo añadirías y cuando lo quitarías?


#iii ¿Qué hace el parámetro se de la función geom_smooth()? ¿Qué pasa si lo eliminamos?
#    ¿Cuando lo añadirías y cuando lo quitarías?
    
#iv  Describe qué hacen los dos siguientes gráficos y di si serán igual y diferente.
#    Justifica tu respuesta.


    ggplot(data = mpg, mapping = aes(x=displ, y = hwy)) +
      geom_point() + 
      geom_smooth()
    
    ggplot(data = mpg) + 
      geom_point(mapping = aes(x=displ, y = hwy)) + 
      geom_smooth(mapping = aes(x=displ, y = hwy))
    
    
    
#v Reproduce el código de R que te genera el siguiente gráfico
    
    ggplot(data = mpg, mapping = aes(x=displ, y = hwy)) +
      geom_point() + 
      geom_smooth(se=F)
    
    
#vi Reproduce el código de R que te genera el siguiente gráfico.
    
    ggplot(data = mpg, mapping = aes(x=displ, y = hwy,filter=drv)) + 
      geom_point() + 
      geom_smooth( se = F)
    
    
#vii Reproduce el código de R que te genera el siguiente gráfico.
    
    ggplot(data = mpg, mapping = aes(x=displ, y = hwy,color=drv)) + 
      geom_point() + 
      geom_smooth( se = F)
    
    
#viii Reproduce el código de R que te genera el siguiente gráfico.    
    
    ggplot(data = mpg,mapping=aes(displ,hwy)) + 
      geom_point(mapping=aes(displ,hwy,color=drv,shape=drv)) + 
      geom_smooth( se = F)
    
#ix Reproduce el código de R que te genera el siguiente gráfico.   
    
    ggplot(data = mpg, mapping = aes(x=displ, y = hwy)) + 
      geom_point(aes(shape=drv,color=drv)) + 
      geom_smooth( aes( linetype=drv),se = F)
    
#x Reproduce el código de R que te genera el siguiente gráfico.
#Investiga algunos parámetros adicionales que te harán falta de ggplot2 como stroke entre otros.
    
    
    ggplot(data = mpg, mapping = aes(x=displ, y = hwy)) + 
      geom_point(mapping = aes(fill=drv),shape=23,color="white",stroke=3)
    
    
#Asignament 5
  
    
    #¿Qué hace el parámetro geom_col? ¿En qué se diferencia de geom_bar?
      
      
      #Tanto geom_bar como geom_col realizan graficos de barra
      #geom_col requiere que se le especifique una variable en el eje Y, pues las alturas que les asigna a las barras las obtiene de un valor dado en el conjunto de datos. A diferencia de geom_bar, que realiza la operación de contar el numero de casos en cada posición de X.
      
      
      
      # La gran mayoría de geometrías y de stats vienen por parejas que siempre se utilizan en conjunto. Por ejemplo geom_bar con stats_count. Haz una pasada por la documentación y la chuleta de ggplot y establece una relación entre esas parejas de funciones. ¿Qué tienen todas en común?
      
      
      
      #Las STATS permiten agregar capas al grafico sobre la base de nuevas variables que computa a partir del conjunto de datos, pero que no estan presentes como variables en el data frame.

      #Las parejas de geometrías y stats son las siguientes
      
      
      
    #geom_area y stat_bin
    
    ggplot(mpg, aes(hwy))+
      
      geom_area(stat = "bin")
    
    
    
    ggplot(mpg, aes(hwy))+
      
      stat_bin(binwidth = 1, origin = 10)
    
    
    
    #geom_density y stat_density
    
    ggplot(mpg, aes(hwy))+
      
      geom_density(kernel = "gaussian")
    
    
    
    ggplot(mpg, aes(hwy))+
      
      stat_density(adjust=1,kernel = "gaussian")
    
    
    
    #Geom_density2d y stat_density_2d
    
    ggplot(mpg, aes(x=cty,y=hwy))+
      
      geom_density2d()
    
    
    
    ggplot(mpg, aes(x=cty,y=hwy))+
      
      stat_density_2d(contour = T)
    
    
    
    #Geom_bind2 y stat_bind2
    
    ggplot(mpg, aes(x=cty,y=hwy))+
      
      geom_bin2d()
    
    
    
    ggplot(mpg, aes(x=cty,y=hwy))+
      
      stat_bin_2d(bins = 30, drop = T)
    
    
    
    #Geom_contour y stat_contour
    
    seals$z <- with(seals, sqrt(delta_long^2
                                
                                + delta_lat^2))
    
    ggplot(seals, aes(x=long,y=lat))+
      
      geom_contour(aes(z=z))
    
    
    
    ggplot(seals, aes(x=long,y=lat))+
      
      stat_contour(aes(z=z))
    
    
    
    #Geom_boxplot Stat_boxplot
    
    ggplot(mpg, aes(x=class,y=hwy))+
      
      geom_boxplot()
    
    
    
    ggplot(mpg, aes(x=class,y=hwy))+
      
      stat_boxplot()
    
    
    
    #Geom_violin y stat_ydensity
    
    ggplot(mpg, aes(x=class,y=hwy))+
      
      geom_violin()
    
    
    
    ggplot(mpg, aes(x=class,y=hwy))+
      
      stat_ydensity()
    
    
    
    #Geom_quantil y stat_quantile
    
    ggplot(mpg, aes(x=cty,y=hwy))+
      
      geom_quantile()
    
    
    
    ggplot(mpg, aes(x=cty,y=hwy))+
      
      stat_quantile()
    
    
    
    #Geom_smooth y stat_smooth
    
    ggplot(mpg, aes(x=cty,y=hwy))+
      
      geom_smooth()
    
    
    
    ggplot(mpg, aes(x=cty,y=hwy))+
      
      stat_smooth()
    
    
    
    #¿Qué variables calcula la función stat_smooth? ¿Qué parámetros controlan su comportamiento?
      
      # proyecta la linea de regresión de la función Y ~ X, mostrando los valores predichos de Y para cada X.
      #Entre los parametros que se pueden especificar, se encuentra la "formula", pudiendo especificar relaciones no lineales entre las variables. Se puede modificar el método "method" de suavizado, la presencia o no del intervalo de confianza (con "se"),y el nivel de confianza, entre otros.
      
      
      
      #Cuando hemos pintado nuestro diagrama de barras con sus proporciones, necesitamos configurar el parámetro group = 1. ¿Por qué?
      
      #La especificación de dicho parametro permite que el calculo de la proporción se haga sobre la base de la cantidad de observaciones para cada valor de X sobre el total de observaciones en el conjunto de datos
      
      
      
    #¿Qué problema tienen los dos siguientes gráficos?
      
      ggplot(data = diamonds) + 
      geom_bar(mapping = aes(x = cut, y = ..prop.. ))
    
    ggplot(data = diamonds) + 
      geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))
    
    
    
    
    
    #Los dos graficos presentan el problema de que la proporción esta calculada como el total de casos sobre el total de casos, por lo que da 100%, para todos los niveles del factor agregado al eje X. Se requiere especificar que considere como grupo cada nivel de manera que calcule el % de casos que representa respecto al total de observaciones.
    
    
    
   
    
    
    
    
    
    