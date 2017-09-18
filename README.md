unix-bash-helpers
=================

random useful bash scripts

### compress_pdf.sh

Uses `ghostscript` to reduce the file size of a pdf file. For instance, exports
from Microsoft Word usually do not compress images very.
This results in quite large PDF files that might cause issues when attached to
emails. The script creates a file called `INPUT_FILE_compressed.pdf`.

```
./compress_pdf.sh INPUT_FILE [PDFSETTINGS]
```

`PDFSETTINGS` is optional an influences the quality of the compressed file.
Higher quality means larger files. Possible values are (from smallest file size
to best quality):

* screen
* ebook
* prepress
* printer
* default

If `PDFSETTINGS` is omitted, `printer` will be used

### gh_pylint.sh

Executes pylint for a Python project. In case there is a `README.md` file in the
parent folder, it will also replace a (shield.io) badge with the current score.
The user has to add the line of code for the badge at first for `sed` to find and
replace it. Pylint output will be piped into `pylint.log` in the project folder.

```
./gh_pylint.sh path_to_source
```

### img2icns.sh

Creates osx application icons (aka iconsets) from images.

```
img2icns <image name> <icon set name>
```

### reduce_img_size.sh

Copies pictures from **current directory** into target directory and shrinks them if necessary.
`resolution` should be an int value of the maximum height OR width.

```
cd /path/to/files
/path/to/script/reduce_img_size.sh <target_dir> <resolution>
```

### copy_flash.sh

Looks for currently used temporary Flash files and copies them to `out.flv` the moment
they stop growing.
