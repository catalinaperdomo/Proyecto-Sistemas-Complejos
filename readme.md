# **Guía - Instrucciones**

## **1. Preparación Inicial**
1. **Verificar Paquetes Requeridos**
    - Asegúrate de tener todos los paquetes necesarios instalados. Revisa la sección **Paquetes Necesarios**.
2. **Configuración del Script**
    - **Direcciones IP**: Cada nodo debe tener una dirección IP asignada diferente. Modifica la penúltima línea del script: `ifconfig bat0 192.168.0.X` (donde `X` es un número único para cada nodo).
    - **Nombre de Interfaz WAN**: Ajusta el nombre de la interfaz WAN según el nodo donde se ejecutará el comando. Revisa la sección **Cómo saber el nombre de la interfaz WAN** para obtener más detalles.

## **2. Paquetes Necesarios**

**Recomendación:** Asegúrate de que tu sistema operativo esté completamente actualizado y de tener instalados los paquetes básicos para evitar errores. Ejecuta los siguientes comandos:

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential
sudo apt-get install net-tools


**Instalar B.A.T.M.A.N**

sudo apt-get install batctl


## **3. Cómo saber el nombre de la interfaz WAN**

1. Ejecuta el siguiente comando:


    ip route | grep default
 

2. La salida del comando será similar a:

    
    default via 192.168.0.1 dev wlp3s0 proto dhcp metric 600

3. En este caso, `wlp3s0` es el nombre de la interfaz WAN. Copia este nombre y reemplázalo en el script correspondiente.