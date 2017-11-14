# PUNTO DE VENTA (POS)
Es un punto de venta para un pequeño comercio. Permite manejar una lista de productos y realizar el cálculo de una venta.

Funcionalidades
---------------

- Ventajas:

    * Permite agregar listado de productos.
    * Permite realizar suma de precios de productos.
    * Calculo de vuelto.

- Desventajas:

    * No realiza control de inventario.
    * No almacena datos históricos de ventas.

![snapshot image](https://github.com/brakdag/POS/blob/master/img/snapshot.png?raw=true)


Agrega producto al listado.

![producto image](https://github.com/brakdag/POS/blob/master/img/agregarproducto.bmp?raw=true)
Este botón permite agregar un nuevo producto al listado. La forma de agreagar es el nombre del producto seguido del símbolo $ y el valor del producto.
Alternativamente si se agrega la sigla kg, el programa interpretará que es un producto que se vende por kg entonces cuando se realice una compra del producto preguntará sobre su peso, o si tiene una balanza electrónica conectada tomará el peso de la balanza. 

![borrar image](https://github.com/brakdag/POS/blob/master/img/quitarproducto.bmp?raw=true)
Quita un producto de la lista. Para que sea quitado antes debe ser seleccionado.

![nueva venta imagen](https://github.com/brakdag/POS/blob/master/img/nuevaventa.bmp?raw=true)
Prepara el programa para una nueva venta, volviendo el contador a cerro y borrando todos los elementos de la lista de compras.

![paga imagen](https://github.com/brakdag/POS/blob/master/img/paga.bmp?raw=true)
Pregunta con cuanto dinero paga el cliente para calcular el vuelto, el vuelto será escrito en la pantalla, si el dinero es menor al de la suma de la compra devuelve "-"

![especial imagen](https://github.com/brakdag/POS/blob/master/img/especial.bmp?raw=true)
Para agregar un producto a la lista de compras el cual no se desea que esté en el listado de productos ya que es un producto casual que se vende con muy poca frecuencia. La froma de agregar es igual a cuando se agrega un producto nuevo a la lista de productos, con la diferencia que el producto no se agrega a la lista de productos, si nó a la lista de compra.