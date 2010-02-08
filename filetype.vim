" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.pom		    setf xml
  au! BufRead,BufNewFile *.apt		    setf doxiaapt
  au! BufRead,BufNewFile *.ddl		    setf sql
  au! BufRead,BufNewFile *.vm		    setf velocity
  au! BufRead,BufNewFile *.ftl		    setf ftl
  au! BufRead,BufNewFile *.groovy	    setf groovy
  au! BufRead,BufNewFile *.gant 	    setf groovy
  au! BufRead,BufNewFile *.gtpl         setf gtpl
  au! BufRead,BufNewFile *.json 	    setf json
  au! BufNewFile,BufRead *.ahk		    setf ahk 
  au! BufNewFile,BufRead *.roo		    setf roo
  au! BufNewFile,BufRead MANIFEST.MF	setf jmanifest
  " AspectJ 
  au! BufNewFile,BufRead *.aj		    setf aj 
  " dm Server types:
  au! BufNewFile,BufRead TEST.MF        let b:jmanifest_ignore_line_length=1 | setf jmanifest
  au! BufNewFile,BufRead template.mf    let b:jmanifest_ignore_line_length=1 | setf jmanifest
  au! BufNewFile,BufRead */libraries/*/*.libd           let b:jmanifest_ignore_line_length=1 | setf jmanifest
  au! BufNewFile,BufRead */serviceability/*/trace.log   setf dmservertrace
  au! BufNewFile,BufRead */config/*.config              setf json
  au! BufNewFile,BufRead */dump/*.dump  setf json
  " SpringSource training files:
  au! BufNewFile,BufRead */lab/docs/instructions.xml    setf docbkxml
  au! BufNewFile,BufRead */modules/*/instructions/*.xml setf docbkxml
  au! BufNewFile,BufRead *.confluence   setf confluencewiki
augroup END
