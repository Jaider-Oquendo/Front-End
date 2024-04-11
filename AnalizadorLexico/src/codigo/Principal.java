
package codigo;

import java.io.File;

/*
La funcionalidad de esta parte es generar un analizador léxico a partir del archivo de definición .flex que creamos. 
*/

public class Principal {
    
    public static void main(String[] args) {
        String ruta ="C:/Users/Usuario/Documents/NetBeansProjects/AnalizadorLexico/src/codigo/Lexer.flex"; //definimos la ubicacion del archivo
        generarLexer(ruta); //llamamos el metodo y damos el argumento.
    }
    
     public static void generarLexer(String ruta){
        File archivo = new File(ruta); //creamos un objeto 
        JFlex.Main.generate(archivo); //llama al método generate de la clase JFlex.Main para generar el analizador léxico
                                      //a partir del archivo .flex. JFlex es una herramienta utilizada para generar analizadores léxicos en Java.
   
    }
    
}
