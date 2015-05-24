@echo off
REM This batch file gathers the templates from the cartridge package,
REM and places them in a new theme app.

REM Create the theme app and fetch the base.html from Mezzanine.
CALL python manage.py startapp theme
CALL python manage.py collecttemplates -t base.html

REM Create static and template directories in theme.
CALL cd theme
CALL md static
CALL cd static 
CALL md css
CALL md js
CALL cd ..
CALL md templates
CALL cd ..

REM Place the static and templates in those directories.
REM if (sys.argv.length > 1)
CALL cp %1/*.html theme/templates
CALL cp %1/css/*.css theme/static/css
CALL cp %1/js/* theme/static/js

REM Finally, add base.html to theme's templates and enter the theme directory.
CALL cp templates/base.html theme/templates
CALL cd theme
