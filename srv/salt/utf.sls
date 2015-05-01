# -*- coding: utf-8 -*-

lame_hack:
  cmd.run:
    - name: mkdir $DIR_TO_MAKE
    - env:
      - DIR_TO_MAKE: /opt/succès

fails:
  file.directory:
    - name: /opt/échouer

also_fails:
  file.recurse:
    - name: /opt/répertoire-de-test
    - source: salt://files/test-folder