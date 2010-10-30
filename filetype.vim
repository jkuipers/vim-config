" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.as           setf actionscript
  au! BufRead,BufNewFile *.mxml         setf mxml 
  " commented out, supported natively by vim 7.3 now with different
  " maintainer and files (kept old ones just in case)
  "au! BufRead,BufNewFile *.md           setf mkd
  au! BufRead,BufNewFile *.jspx		    setf jsp
  au! BufRead,BufNewFile *.tagx		    setf jsp
  au! BufRead,BufNewFile *.apt		    setf doxiaapt
  au! BufRead,BufNewFile *.ddl		    setf sql
  au! BufRead,BufNewFile *.vm		    setf velocity
  au! BufRead,BufNewFile *.ftl		    setf ftl
  au! BufRead,BufNewFile *.gradle	    setf groovy
  au! BufRead,BufNewFile *.gant 	    setf groovy
  au! BufRead,BufNewFile *.gtpl         setf gtpl
  au! BufRead,BufNewFile *.json 	    setf json
  au! BufNewFile,BufRead *.roo		    setf roo
  au! BufNewFile,BufRead MANIFEST.MF	setf jmanifest
  " AspectJ 
  au! BufNewFile,BufRead *.aj		    setf aj 
  " dm Server types:
  au! BufNewFile,BufRead TEST.MF        let b:jmanifest_ignore_line_length=1 | setf jmanifest
  au! BufNewFile,BufRead template.mf    let b:jmanifest_ignore_line_length=1 | setf jmanifest
  au! BufNewFile,BufRead */repository/*/*.libd          let b:jmanifest_ignore_line_length=1 | setf jmanifest
  au! BufNewFile,BufRead */serviceability/*/trace.log   setf dmservertrace
  au! BufNewFile,BufRead */serviceability/*/log*.log    setf virgolog
  au! BufNewFile,BufRead */config/*.config              setf json
  au! BufNewFile,BufRead */dump/*.dump  setf json
  au! BufNewFile,BufRead *.plan         setf xml
  " SpringSource training files:
  au! BufNewFile,BufRead */lab/docs/instructions.xml    setf docbkxml
  au! BufNewFile,BufRead */modules/*/instructions/*.xml setf docbkxml
  au! BufNewFile,BufRead *.confluence   setf confluencewiki
augroup END
