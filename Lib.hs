type Nombre = String
type Precio = Float
type Producto = (Nombre, Precio)

precioTotal :: Producto -> Float -> Float -> Float -> Float
precioTotal (_, precioUnitario) cantidad descuento costoDeEnvio = aplicarCostoDeEnvio (aplicarDescuento precioUnitario descuento * cantidad) costoDeEnvio

productoDeElite :: Producto -> Bool
productoDeElite unProducto = productoDeLujo unProducto && productoCodiciado unProducto && (not.productoCorriente) unProducto

aplicarDescuento :: (Num a) => a -> a -> a
aplicarDescuento unPrecio unDescuento = unPrecio * (1 - (unDescuento/100))

entregaSencilla :: String -> Bool
entregaSencilla unDia = even . length $ unDia

descodiciarProducto :: Producto -> Producto
descodiciarProducto (nombreDeProducto, precio) = (take 10 nombreDeProducto, precio)

productoDeLujo :: Producto -> Bool
productoDeLujo (nombreDeProducto, _) = elem 'x' nombreDeProducto || elem 'z' nombreDeProducto

aplicarCostoDeEnvio :: (Num a) => a -> a -> a
aplicarCostoDeEnvio unPrecio unCostoDeEnvio = unPrecio + unCostoDeEnvio

productoCodiciado :: Producto -> Bool
productoCodiciado (nombreDeProducto, _) = length nombreDeProducto > 10

productoCorriente :: Producto -> Bool
productoCorriente (nombreDeProducto, _) = esVocal . head $ nombreDeProducto

esVocal :: Char -> Bool
esVocal unaLetra = elem unaLetra "aeiouAEIOU"

productoXL :: Producto -> Producto
productoXL (nombreDeProducto, precio) = (nombreDeProducto ++ "XL", precio)

versionBarata :: Producto -> Producto
versionBarata unProducto = (reverse . fst . descodiciarProducto $  unProducto, snd unProducto)

