(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-fad2e1b8"],{"19c7":function(e,t,r){},"6e4b":function(e,t,r){"use strict";r("19c7")},ac13:function(e,t,r){"use strict";r.r(t);var o=function(){var e=this,t=e._self._c;return t("codemirror",{ref:"editor",attrs:{options:e.options},model:{value:e.currentValue,callback:function(t){e.currentValue=t},expression:"currentValue"}})},i=[],n=r("4724"),s=(r("ff0d"),r("dd2b"),r("37d2"),r("0f1f"),r("51f2"),r("537f"),r("b944"),r("4c64"),r("bd4c"),r("187a"),r("6986"),r("4e1d"),r("f7a1"),r("2bd1"),r("5d75"),r("2ac3"),{name:"CodeMirror",data(){return{currentValue:"",options:{mode:"text/x-c++src",lineNumbers:!0,lineWrapping:!1,theme:"solarized",tabSize:4,line:!0,foldGutter:!0,gutters:["CodeMirror-linenumbers","CodeMirror-foldgutter"],indentUnit:4,styleActiveLine:!0,autofocus:!1,matchBrackets:!0,styleActiveLine:!0,autoCloseBrackets:!0,autoCloseTags:!0}}},components:{codemirror:n["codemirror"]},props:{value:{type:String,default:""},mode:{type:String,default:"text/x-c++src"}},mounted(){this.currentValue=this.value,this.$refs.editor.editor.setOption("mode",this.mode),this.$refs.editor.editor.on("inputRead",(e,t)=>{/\w|\./g.test(t.text[0])&&"complete"!==t.origin&&e.showHint({hint:n["CodeMirror"].hint.anyword,completeSingle:!1,range:1e3})})},watch:{value(e){this.currentValue!==e&&(this.currentValue=e)},currentValue(e,t){e!==t&&(this.$emit("change",e),this.$emit("input",e))},mode(e){this.$refs.editor.editor.setOption("mode",e)}}}),u=s,a=(r("6e4b"),r("0b56")),c=Object(a["a"])(u,o,i,!1,null,null,null);t["default"]=c.exports}}]);