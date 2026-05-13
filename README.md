# VillarrealTruck

## Despliegue en Render

Este proyecto usa PHP y se puede desplegar con el `Dockerfile` existente.

### Variables de entorno necesarias

Render debe configurar estas variables en el dashboard del servicio:

- `DB_CONNECTION=pgsql`
- `DB_HOST=db.lezbfnhzsnzcthrabnoc.supabase.co`
- `DB_PORT=5432`
- `DB_DATABASE=postgres`
- `DB_USERNAME=postgres`
- `DB_PASSWORD=<tu-contraseña-supabase>`

> No es necesario subir el archivo `.env` a Render. El proyecto lee variables de entorno directamente y solo carga `.env` si existe localmente.

### Instrucciones de Build

El `Dockerfile` actual usa `php:8.2-cli`, instala `pdo_pgsql`, copia el código y ejecuta:

```bash
composer install --no-dev --optimize-autoloader
php -S 0.0.0.0:8080 -t public/
```

### Notas

- Mantén `.env` fuera del repositorio.
- Usa `.env.example` como plantilla local.
- Render provee las variables de entorno directamente, así que no necesitas `.env` en producción.
