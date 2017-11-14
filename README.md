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


## Agrega producto al listado de productos.

![producto image](https://github.com/brakdag/POS/blob/master/img/agregarproducto.bmp?raw=true)

Este botón permite agregar un nuevo producto al listado. La forma de agreagar es el nombre del producto seguido del símbolo $ y el valor del producto.
Alternativamente si se agrega la sigla kg, el programa interpretará que es un producto que se vende por kg entonces cuando se realice una compra del producto preguntará sobre su peso, o si tiene una balanza electrónica conectada tomará el peso de la balanza. 

## Remover producto del listado de productos.

![borrar image](https://github.com/brakdag/POS/blob/master/img/quitarproducto.bmp?raw=true)

Quita un producto de la lista. Para que sea quitado antes debe ser seleccionado.

## Nueva lista de venta.

![nueva venta imagen](https://github.com/brakdag/POS/blob/master/img/nuevaventa.bmp?raw=true)

Prepara el programa para una nueva venta, volviendo el contador a cerro y borrando todos los elementos de la lista de compras.

## Cálculo de vuelto.

![paga imagen](https://github.com/brakdag/POS/blob/master/img/paga.bmp?raw=true)

Pregunta con cuanto dinero paga el cliente para calcular el vuelto, el vuelto será escrito en la pantalla, si el dinero es menor al de la suma de la compra devuelve "-"

## Producto especial.

![especial imagen](https://github.com/brakdag/POS/blob/master/img/especial.bmp?raw=true)

Un producto especial es el que no se desea que se encuentre en l a lista de productos, pero si se desea que esté en la lista de venta. La forma de agregar es igual a un producto nuevo a la lista de productos. El producto se agregará a la lista de ventas, sin agregarse a la lista de productos.