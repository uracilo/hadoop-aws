# hadoop-aws

# Ejemplo de MapReduce: Conteo de Palabras

Este documento describe el flujo de trabajo básico de un programa MapReduce para contar palabras en Hadoop.

## 📌 Entrada
Ejemplo de archivo de texto:
```
Hadoop es rápido
Hadoop es escalable
```

## 📌 Fase Map
El Mapper divide el texto en palabras y genera pares clave-valor:
```
(Hadoop,1)
(es,1)
(rápido,1)
(Hadoop,1)
(es,1)
(escalable,1)
```

## 📌 Shuffle & Sort
Los pares clave-valor se agrupan y ordenan por clave:
```
(Hadoop, [1,1])
(es, [1,1])
(rápido, [1])
(escalable, [1])
```

## 📌 Fase Reduce
El Reducer suma los valores para cada clave:
```
(Hadoop,2)
(es,2)
(rápido,1)
(escalable,1)
```

## 📌 Salida final
Archivo con la frecuencia de cada palabra:
```
Hadoop	2
es	2
rápido	1
escalable	1
```

## 📌 Flujo de trabajo de MapReduce
1️⃣ **Input Split:** Se divide el archivo en fragmentos para procesamiento paralelo.
2️⃣ **Map:** Extrae, transforma y emite pares clave-valor.
3️⃣ **Shuffle & Sort:** Agrupa los valores por clave.
4️⃣ **Reduce:** Procesa los valores y genera la salida final.
5️⃣ **Output:** Se almacena en HDFS o una base de datos externa.

## 📌 Alternativas Modernas
- **Apache Spark:** Procesamiento en memoria más eficiente.
- **Apache Flink:** Procesamiento en tiempo real.

🚀 *Este ejemplo se ejecuta usando Hadoop Streaming con scripts en Python.*

![image](https://github.com/user-attachments/assets/eefb9f12-aace-466d-819d-ada3daa10b70)

