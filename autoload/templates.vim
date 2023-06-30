funcion! templates#PrintJavaTemplates()
    execute ':0r ~/.vim/templates/tp.java'
    execute ':0r! echo "public class % {" | sed "s/.java//"'
endfuncion

