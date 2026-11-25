# Guía paso a paso para Adrián: tu fork y tu primer Pull Request

Esta guía es para hacerlo **por primera vez**. Sigue los pasos en orden y no te saltes ninguno.
Al final habrás subido un cambio al repositorio oficial **desde tu propio fork**, que es lo que pide el enunciado.

**Tus datos:** usuario `adriangalvan649` · repositorio oficial `practica5-anexo2-sql` · tarea **#7 PDF final con enunciado, consulta y captura (guárdalo en documentacion/anexo2-consultas.pdf)**.

| Qué | Enlace |
|-----|--------|
| Repositorio oficial | https://github.com/raulgonzalezjorge-blip/practica5-anexo2-sql |
| Aceptar la invitación (con tu sesión iniciada) | https://github.com/raulgonzalezjorge-blip/practica5-anexo2-sql/invitations |
| Tu fork (existe **después** del paso 1) | https://github.com/adriangalvan649/practica5-anexo2-sql |
| Tablero de tareas | https://github.com/users/raulgonzalezjorge-blip/projects/3/views/2 |

## Dónde van las capturas

En **cada paso marcado con 📸** haz una captura de pantalla (tecla **Windows + Mayús + S**) y pégala en el **documento compartido de la práctica**, apartado **2.4 (Anexo II)**, sección «Capturas del fork y del Pull Request». Cada paso tiene su hueco amarillo «[ Pega aquí la captura ]»: pega la imagen encima y borra ese texto. Si en alguna captura sale tu email, tápalo antes de pegarla.

## Antes de empezar: qué es cada cosa

- **Repositorio oficial**: el de Raúl (`raulgonzalezjorge-blip/practica5-anexo2-sql`). Solo entra código en él mediante Pull Request.
- **Fork**: tu copia del repositorio oficial en tu cuenta (`adriangalvan649/practica5-anexo2-sql`). Ahí puedes subir lo que quieras sin romper nada.
- **Rama**: una línea de trabajo dentro del repositorio. Cada tarea va en su rama `feature/<nº>-<descripción>`.
- **Pull Request (PR)**: la petición para que el jefe revise tu rama y la meta en `develop` del repositorio oficial.

## Paso 0. Instalar y configurar Git (solo la primera vez)

1. Instala Git desde <https://git-scm.com/download/win> (siguiente, siguiente… con las opciones por defecto).
2. Abre **Git Bash** (o la terminal de VS Code) y dile a Git quién eres. Usa el **email de tu cuenta de GitHub**:
```
git config --global user.name "Tu Nombre Apellido"
git config --global user.email "el-email-de-tu-cuenta-de-github"
git config --global core.autocrlf true
```
`core.autocrlf true` evita que Windows y Linux se peleen por los saltos de línea.

Comprueba que está bien:
```
git config --global --list
```

> 📸 **Captura para el documento:** Git configurado: la terminal con `git --version` y `git config --global user.name`.

## Paso 1. Hacer el fork (en la web)

1. Inicia sesión en GitHub y entra en el repositorio oficial: `https://github.com/raulgonzalezjorge-blip/practica5-anexo2-sql`
2. Pulsa el botón **Fork**, arriba a la derecha, al lado de **Star**:

![Botón Fork en la página del repositorio](https://raw.githubusercontent.com/raulgonzalezjorge-blip/practica5-sitio-web/develop/wiki/img/guia-fork.png)

3. En la pantalla siguiente deja todo como está y pulsa **Create fork**.
4. Ahora estás en `https://github.com/adriangalvan649/practica5-anexo2-sql`. Debajo del nombre pone «forked from raulgonzalezjorge-blip/practica5-anexo2-sql». Ese es tu fork.

> 📸 **Captura para el documento:** Fork creado: tu página del fork, donde se lea «forked from raulgonzalezjorge-blip/…».

## Paso 2. Clonar tu fork en tu ordenador

Clona **tu fork** (no el de Raúl) y entra en la carpeta:
```
cd ~/Documents
git clone https://github.com/adriangalvan649/practica5-anexo2-sql.git
cd practica5-anexo2-sql
```
La primera vez que hagas `push`, Windows abrirá una ventana para iniciar sesión en GitHub: acepta.

## Paso 3. Enlazar el repositorio oficial como `upstream`

Así podrás traerte lo último que haya en el oficial:
```
git remote add upstream https://github.com/raulgonzalezjorge-blip/practica5-anexo2-sql.git
git remote -v
```
Debes ver cuatro líneas: `origin` apunta a tu fork y `upstream` al de Raúl.

> 📸 **Captura para el documento:** Clonado y upstream (pasos 2 y 3): la terminal con `git clone` y `git remote -v`.

## Paso 4. Ponerte al día y crear la rama de tu tarea

1. En el tablero (enlace «Tablero de tareas» de la tabla de arriba) mueve tu tarea de **TO DO** a **DOING**.
2. Trae lo último de `develop` y crea tu rama desde ahí:
```
git switch develop
git pull upstream develop
git switch -c feature/7-pdf-final
```
`develop` ya viene creada al clonar tu fork: no hay que crearla, solo traer lo último de `upstream`.
Comprueba que estás en tu rama: `git branch` tiene que marcar con `*` la línea `feature/7-pdf-final`.

> 📸 **Captura para el documento:** Rama creada: la terminal con `git switch -c …` y el tablero con tu tarea en DOING.

## Paso 5. Hacer el cambio

1. Exporta el PDF: en el documento compartido, **Archivo → Descargar → Documento PDF**.
2. Cópialo **dentro de la carpeta que clonaste**, en su subcarpeta `documentacion`: `Documentos\practica5-anexo2-sql\documentacion\`. Si lo dejas en Descargas o en otra carpeta, Git no lo ve.
3. Cámbiale el nombre a `anexo2-consultas.pdf`. Ojo: Windows oculta las extensiones y es fácil acabar con `anexo2-consultas.pdf.pdf`. Compruébalo desde la terminal (tienes que estar en la carpeta del repositorio):
```
ls documentacion
```
Tiene que salir exactamente `anexo2-consultas.pdf`. Si sale `anexo2-consultas.pdf.pdf`, arréglalo con:
```
git mv -f documentacion/anexo2-consultas.pdf.pdf documentacion/anexo2-consultas.pdf 2>/dev/null || mv documentacion/anexo2-consultas.pdf.pdf documentacion/anexo2-consultas.pdf
```
4. Ahora sí, prepara el archivo y haz el commit:
```
git status
git add documentacion/anexo2-consultas.pdf
git commit -m "docs(pdf): añade el PDF final del Anexo II (#7)"
```
- `git status` te dice qué archivos han cambiado (en rojo, sin preparar; en verde, preparados). Antes del `git add` tiene que salir en rojo `documentacion/anexo2-consultas.pdf`; después del `git add`, en verde. Si no sale, el PDF no está en la carpeta correcta o tiene otro nombre: vuelve a los puntos 2 y 3.
- Si el commit dice `nothing to commit`, **no se ha guardado nada**: no sigas al paso 6 hasta que `git log --oneline -1` muestre tu commit.
- `git add` prepara solo los archivos de la tarea. Nunca subas `.zip`, `.exe` ni carpetas `bin/` u `obj/`.
- El mensaje sigue el formato `tipo(ámbito): qué hace (#nº)`. Tipos: `feat`, `fix`, `style`, `docs`.

Repite `add` + `commit` cada vez que termines algo: mejor varios commits pequeños que uno enorme.

> 📸 **Captura para el documento:** Commit: la terminal con `git status` y `git commit`.

## Paso 6. Subir la rama a tu fork
```
git push -u origin feature/7-pdf-final
```
Si sale `Permission denied` o `403`, estás subiendo a `upstream`: sube a `origin`.

> 📸 **Captura para el documento:** Push: la terminal con `git push -u origin …`.

## Paso 7. Abrir el Pull Request

1. Entra en tu fork en GitHub. Arriba saldrá un aviso amarillo con el botón **Compare & pull request**: púlsalo.
2. Comprueba la línea de arriba **antes de crear nada**:
   `base repository: raulgonzalezjorge-blip/practica5-anexo2-sql` · `base: develop` ← `head repository: adriangalvan649/practica5-anexo2-sql` · `compare: feature/7-pdf-final`
3. Título: qué hace el cambio. En la descripción escribe `Closes #7` y marca el checklist.
4. Pulsa **Create pull request**.

Así se ven los Pull Request ya fusionados del Anexo I:

![Lista de Pull Request fusionados](https://raw.githubusercontent.com/raulgonzalezjorge-blip/practica5-sitio-web/develop/wiki/img/guia-prs.png)

> 📸 **Captura para el documento:** Pull Request abierto: la página del Pull Request con `base: develop` y «Closes #…».

## Paso 8. Si el jefe pide cambios

Haz los cambios en la **misma rama**, `git add`, `git commit` y `git push`. El Pull Request se actualiza solo; no abras otro.

## Paso 9. Cuando el jefe lo fusione

La tarea se cierra sola gracias a `Closes #7` y pasa a **DONE**. Actualiza tu copia y borra la rama:
```
git switch develop
git pull upstream develop
git push origin develop
git branch -d feature/7-pdf-final
```

> 📸 **Captura para el documento:** Fusionado: el Pull Request en morado («Merged») y tu tarea en DONE.

## Errores frecuentes

| Mensaje | Qué pasa | Solución |
|---------|----------|----------|
| `rejected ... fetch first` | El remoto tiene cambios que tú no tienes | `git pull upstream develop`, resuelve conflictos y `git push` |
| `CONFLICT (content)` | Tú y otra persona tocasteis las mismas líneas | Abre el archivo, deja el código bueno entre `<<<<<<<`, `=======` y `>>>>>>>`, borra las marcas, `git add` y `git commit` |
| `Permission denied` / `403` | Estás subiendo al repositorio de Raúl | Sube a `origin` (tu fork) |
| `fatal: not a git repository` | No estás dentro de la carpeta del repositorio | `cd practica5-anexo2-sql` |
| `pathspec '…' did not match any files` | El archivo no está donde dices o se llama distinto | `ls` para ver dónde está y cómo se llama de verdad (ojo con `.pdf.pdf`) |
| `nothing to commit, working tree clean` | Git no ve ningún cambio: no se guarda nada | El archivo tiene que estar dentro de la carpeta del repositorio; revisa con `git status` |
| `Please tell me who you are` | Falta configurar tu nombre o email | Repite el paso 0 y vuelve a hacer el `git commit` |
| `has no upstream branch` | Has hecho `git push` sin `-u origin <rama>` | `git push -u origin <tu rama>` |
| `fatal: a branch named 'develop' already exists` | Intentas crear `develop` y ya existe | Usa `git switch develop` (paso 4) |
| He trabajado en `develop` sin rama | — | `git switch -c feature/<nº>-<nombre>`: los cambios se pasan a la rama nueva |

Si te atascas, ejecuta esto en la carpeta del repositorio y pásale a Raúl **todo** lo que salga:
```
pwd
git status
git branch
git remote -v
git log --oneline -3
```
