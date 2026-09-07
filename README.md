# emacs-config

Configuración personal de GNU Emacs orientada a desarrollo general, con navegación rápida, autocompletado, linting, Git/Magit, soporte para varios lenguajes y una interfaz gráfica más cómoda.

> Este repositorio contiene una configuración clásica basada en `~/.emacs` y una carpeta `~/.emacs.d` con paquetes ELPA ya incluidos. A medio plazo es recomendable migrar los paquetes instalados a una gestión declarativa, pero el repositorio puede usarse tal como está.

## Características principales

- **Navegación y búsqueda** con Helm, Swiper/Helm, Ido y accesos directos personalizados.
- **Autocompletado** con `auto-complete` y configuración por modo.
- **Calidad de código** con Flycheck, limpieza de espacios al guardar y resaltado de `TODO`/`FIXME`.
- **Git integrado** con Magit.
- **Interfaz gráfica** con tema Doom, NeoTree, Minimap, Beacon, números de línea y resaltado de la línea actual.
- **Edición cómoda** con `expand-region`, `smartparens`, `undo-tree`, `which-key` y `aggressive-indent`.
- **Modos de lenguaje** para C/C++, C#, Python, CMake, Groovy, Markdown, Org y otros.
- **Terminal emergente** con `shell-pop`.

## Requisitos

- GNU Emacs 27 o superior recomendado.
- Git, para clonar el repositorio y usar Magit.
- Bash, usado por la configuración de `shell-pop`.
- Opcional: `cscope`, si quieres usar la integración de `xcscope`.
- Opcional: las fuentes de `all-the-icons`, si quieres iconos completos en modo gráfico.

En Arch Linux / CachyOS, por ejemplo:

```bash
sudo pacman -S emacs git bash cscope
```

## Instalación

### 1. Hacer copia de seguridad de tu configuración actual

Antes de instalar, guarda cualquier configuración previa:

```bash
mv ~/.emacs ~/.emacs.backup 2>/dev/null || true
mv ~/.emacs.d ~/.emacs.d.backup 2>/dev/null || true
```

### 2. Clonar el repositorio

```bash
git clone https://github.com/jlmolinero/emacs-config.git ~/emacs-config
```

### 3. Enlazar los archivos de configuración

```bash
ln -s ~/emacs-config/.emacs ~/.emacs
ln -s ~/emacs-config/.emacs.d ~/.emacs.d
```

También puedes copiar los archivos en lugar de enlazarlos, pero los enlaces simbólicos facilitan mantener el repositorio actualizado con Git.

### 4. Arrancar Emacs

```bash
emacs
```

En el primer arranque Emacs puede tardar más de lo normal si actualiza paquetes o genera cachés.

### 5. Instalar fuentes de iconos

Si usas Emacs en modo gráfico y ves cuadrados o iconos incorrectos, ejecuta dentro de Emacs:

```elisp
M-x all-the-icons-install-fonts
```

Después reinicia Emacs o refresca la caché de fuentes del sistema.

## Estructura del repositorio

```text
.
├── .emacs          # Configuración principal de Emacs
├── .emacs.d/       # Directorio de Emacs con paquetes ELPA y estado asociado
├── .gitignore      # Reglas para no versionar cachés/temporales nuevos
└── README.md       # Esta documentación
```

## Atajos destacados

| Atajo | Acción |
| --- | --- |
| `C-c C-g C-l` | Ir a una línea concreta (`goto-line`) |
| `C-=` | Expandir selección (`expand-region`) |
| `C-?` | Contraer selección (`expand-region`) |
| `C-x C-f` | Abrir archivo con Helm |
| `C-x b` | Cambiar de buffer con Helm |
| `M-x` | Comandos con Helm |
| `M-y` | Historial del kill-ring con Helm |
| `C-s` / `C-r` | Buscar con Swiper/Helm |
| `F6` | Crear/mostrar minimap |
| `F7` | Cerrar minimap |
| `F8` | Alternar NeoTree |
| `F9` | Abrir/cerrar terminal emergente (`shell-pop`) |
| `M-g` | Abrir Magit status |

## Paquetes configurados

La configuración declara, entre otros, estos paquetes:

- `org`
- `magit`
- `helm`
- `swiper-helm`
- `auto-complete`
- `flycheck`
- `which-key`
- `smartparens`
- `undo-tree`
- `expand-region`
- `aggressive-indent`
- `doom-themes`
- `all-the-icons`
- `neotree`
- `minimap`
- `shell-pop`
- `engine-mode`
- `yasnippet`
- `lsp-jedi`
- `xcscope`

## Personalización rápida

Los ajustes personales principales están al inicio de `.emacs`:

```elisp
(setq user-full-name "Name"
      user-mail-address "email@example.com")
(setq calendar-latitude 42.2)
(setq calendar-longitude -71.1)
(setq calendar-location-name "Madrid, ES")
```

Cambia estos valores por tu nombre, correo y ubicación.

También conviene revisar:

- `shell-pop-default-directory`, que actualmente apunta a una ruta local concreta.
- `shell-pop-term-shell`, si no usas `/bin/bash`.
- El tema cargado con `(load-theme 'doom-1337 t)`.
- El tamaño de ventana configurado con `(set-frame-size ...)`.

## Recargar la configuración

La configuración incluye una función para recargar `~/.emacs` sin reiniciar Emacs:

```elisp
M-x reload-dotemacs-file
```

## Mantenimiento recomendado

Este repositorio funciona, pero hay varias mejoras claras para futuras iteraciones:

1. **Separar configuración de paquetes instalados**: evitar versionar `.emacs.d/elpa/` y declarar paquetes de forma reproducible desde `.emacs`, `init.el` o un gestor como `use-package`/`straight.el`/`elpaca`.
2. **Migrar de `~/.emacs` a `~/.emacs.d/init.el`**: es el formato más común en configuraciones modernas.
3. **Dividir la configuración en módulos**: por ejemplo `lisp/ui.el`, `lisp/completion.el`, `lisp/languages.el` y `lisp/keybindings.el`.
4. **Mover datos personales a un archivo local no versionado**: por ejemplo `local.el`, cargado si existe.
5. **Evitar estado generado en Git**: archivos como `recentf`, historiales, cachés y datos de paquetes deberían quedar fuera del repositorio.
6. **Validar la configuración en CI**: cargar Emacs en modo batch para comprobar que no hay errores de arranque.

## Comprobación básica

Puedes validar que Emacs carga el archivo principal en modo batch con:

```bash
emacs --batch --load ~/.emacs --eval '(message "Config OK")'
```

Si estás dentro del repositorio y todavía no has instalado los enlaces simbólicos:

```bash
emacs --batch --load ./.emacs --eval '(message "Config OK")'
```

## Licencia

Este repositorio no declara una licencia explícita. Si quieres que otras personas puedan reutilizarlo, añade una licencia como MIT, Apache-2.0 o GPL-3.0.
