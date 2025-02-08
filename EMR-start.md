# Configuración del Perfil de Instancia para Amazon EMR

Este documento proporciona instrucciones detalladas para solucionar el error **"Invalid InstanceProfile: EMR_EC2_DefaultRole"** al ejecutar un clúster de Amazon EMR.

## 1. Verificar si el perfil de instancia existe
Ejecuta el siguiente comando para listar los perfiles de instancia disponibles:

```bash
aws iam list-instance-profiles --query "InstanceProfiles[*].InstanceProfileName"
```

Si **EMR_EC2_DefaultRole** no aparece en la lista, necesitas crearlo.

## 2. Crear el Perfil de Instancia (Si No Existe)
Si el perfil de instancia no existe, créalo con:

```bash
aws iam create-instance-profile --instance-profile-name EMR_EC2_DefaultRole
```

Después, agrega el rol **EMR_EC2_DefaultRole** al perfil de instancia:

```bash
aws iam add-role-to-instance-profile \
    --instance-profile-name EMR_EC2_DefaultRole \
    --role-name EMR_EC2_DefaultRole
```

## 3. Verificar que el Rol Tiene las Políticas Correctas
Adjunta las políticas necesarias al rol **EMR_EC2_DefaultRole**:

```bash
aws iam attach-role-policy \
  --role-name EMR_EC2_DefaultRole \
  --policy-arn arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceforEC2Role
```

Verifica si el rol tiene políticas adjuntas con:

```bash
aws iam list-attached-role-policies --role-name EMR_EC2_DefaultRole
```

Si no ves la política `AmazonElasticMapReduceforEC2Role`, vuelve a adjuntarla.

## 4. Esperar 1-2 Minutos
Los cambios en IAM pueden tardar en propagarse. Espera un par de minutos antes de intentar crear el clúster nuevamente.

## 5. Lanzar el Clúster con el Perfil de Instancia Correcto
Ahora, lanza el clúster con:

```bash
aws emr create-cluster \
    --name "MiClusterEMR" \
    --release-label emr-6.9.0 \
    --applications Name=Hadoop Name=Spark \
    --ec2-attributes InstanceProfile=EMR_EC2_DefaultRole \
    --service-role EMR_DefaultRole \
    --instance-type m5.xlarge \
    --instance-count 3
```

## Resumen
1. **Verificar si el perfil de instancia existe** con `aws iam list-instance-profiles`.
2. **Si no existe, crearlo** con `aws iam create-instance-profile`.
3. **Agregar el rol al perfil de instancia** con `aws iam add-role-to-instance-profile`.
4. **Adjuntar la política correcta** al rol `EMR_EC2_DefaultRole`.
5. **Esperar unos minutos** y volver a ejecutar el comando para crear el clúster.

Esto debería solucionar el problema. 🚀

