(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-1d161d1a"],{5314:function(e,t,r){},"6ebf":function(e,t,r){"use strict";r("5314")},ac13:function(e,t,r){"use strict";r.r(t);var n=r("28b6"),o=(r("2ce8"),r("274a"),r("4724")),i=(r("0d7c"),r("7502"),r("f4d3"),r("50e3"),r("1cd5"),r("3be5"),r("421f"),r("715d"),r("2ad6"),r("436b"),r("7d26"),r("772c"),r("7b5f"),r("4558"),r("728e"),r("4296"),{name:"CodeMirror",data:function(){var e;return{currentValue:"",options:(e={mode:"text/x-c++src",lineNumbers:!0,lineWrapping:!1,theme:"solarized",tabSize:4,line:!0,foldGutter:!0,gutters:["CodeMirror-linenumbers","CodeMirror-foldgutter"],indentUnit:4,styleActiveLine:!0,autofocus:!1,matchBrackets:!0},Object(n.a)(e,"styleActiveLine",!0),Object(n.a)(e,"autoCloseBrackets",!0),Object(n.a)(e,"autoCloseTags",!0),e)}},components:{codemirror:o.codemirror},props:{value:{type:String,default:""},mode:{type:String,default:"text/x-c++src"}},mounted:function(){this.currentValue=this.value,this.$refs.editor.editor.setOption("mode",this.mode),this.$refs.editor.editor.on("inputRead",(function(e,t){/\w|\./g.test(t.text[0])&&"complete"!==t.origin&&e.showHint({hint:o.CodeMirror.hint.anyword,completeSingle:!1,range:1e3})}))},watch:{value:function(e){this.currentValue!==e&&(this.currentValue=e)},currentValue:function(e,t){e!==t&&(this.$emit("change",e),this.$emit("input",e))},mode:function(e){this.$refs.editor.editor.setOption("mode",e)}}});r("6ebf"),r=r("cba8"),r=Object(r.a)(i,(function(){var e=this,t=e.$createElement;return(e._self._c||t)("codemirror",{ref:"editor",attrs:{options:e.options},model:{value:e.currentValue,callback:function(t){e.currentValue=t},expression:"currentValue"}})}),[],!1,null,null,null);t.default=r.exports}}]);