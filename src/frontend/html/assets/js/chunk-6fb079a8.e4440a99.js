(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-6fb079a8","chunk-1d161d1a"],{5314:function(e,t,i){},"6ebf":function(e,t,i){"use strict";i("5314")},8652:function(e,t,i){},ac13:function(e,t,i){"use strict";i.r(t);var n=i("28b6"),r=(i("2ce8"),i("274a"),i("4724")),l=(i("0d7c"),i("7502"),i("f4d3"),i("50e3"),i("1cd5"),i("3be5"),i("421f"),i("715d"),i("2ad6"),i("436b"),i("7d26"),i("772c"),i("7b5f"),i("4558"),i("728e"),i("4296"),{name:"CodeMirror",data:function(){var e;return{currentValue:"",options:(e={mode:"text/x-c++src",lineNumbers:!0,lineWrapping:!1,theme:"solarized",tabSize:4,line:!0,foldGutter:!0,gutters:["CodeMirror-linenumbers","CodeMirror-foldgutter"],indentUnit:4,styleActiveLine:!0,autofocus:!1,matchBrackets:!0},Object(n.a)(e,"styleActiveLine",!0),Object(n.a)(e,"autoCloseBrackets",!0),Object(n.a)(e,"autoCloseTags",!0),e)}},components:{codemirror:r.codemirror},props:{value:{type:String,default:""},mode:{type:String,default:"text/x-c++src"}},mounted:function(){this.currentValue=this.value,this.$refs.editor.editor.setOption("mode",this.mode),this.$refs.editor.editor.on("inputRead",(function(e,t){/\w|\./g.test(t.text[0])&&"complete"!==t.origin&&e.showHint({hint:r.CodeMirror.hint.anyword,completeSingle:!1,range:1e3})}))},watch:{value:function(e){this.currentValue!==e&&(this.currentValue=e)},currentValue:function(e,t){e!==t&&(this.$emit("change",e),this.$emit("input",e))},mode:function(e){this.$refs.editor.editor.setOption("mode",e)}}});i("6ebf"),i=i("cba8"),i=Object(i.a)(l,(function(){var e=this,t=e.$createElement;return(e._self._c||t)("codemirror",{ref:"editor",attrs:{options:e.options},model:{value:e.currentValue,callback:function(t){e.currentValue=t},expression:"currentValue"}})}),[],!1,null,null,null);t.default=i.exports},cad1:function(e,t,i){"use strict";i("8652")},da4f:function(e,t,i){"use strict";i.r(t);var n=i("ac13"),r=i("7aa9");n={name:"Accordion",components:{CodeMirror:n.default},props:{files:{type:Array,required:!0},type:{type:String,required:!0}},mounted:function(){var e=window.screen.width;this.dialogWith=e<768?"100%":"70%"},data:function(){return{upsertFileDialogVisible:!1,upsertTagLoading:!1,fileName:"",fileOldName:"",fileContent:"",dialogWith:"70%"}},methods:{deleteFile:function(e){var t=this;this.$confirm(this.$i18n.t("m.Delete_Extra_File_Tips"),"Tips",{type:"warning"}).then((function(){t.$emit("deleteFile",t.type,e)}),(function(){}))},openFileDialog:function(e,t){this.fileName=e,this.fileContent=t,this.fileOldName=e,this.upsertFileDialogVisible=!0},upsertFile:function(){this.fileName?this.fileContent?(this.$emit("upsertFile",this.type,this.fileName,this.fileOldName,this.fileContent),this.upsertFileDialogVisible=!1):r.a.error(this.$i18n.t("m.File_Content")+" "+this.$i18n.t("m.is_required")):r.a.error(this.$i18n.t("m.File_Name")+" "+this.$i18n.t("m.is_required"))}}},i("cad1"),i=i("cba8"),i=Object(i.a)(n,(function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{staticClass:"accordion"},[e._l(e.files,(function(t,n,r){return i("el-tag",{key:r,staticClass:"file",attrs:{"disable-transitions":!1,closable:""},on:{click:function(i){return e.openFileDialog(n,t)},close:function(t){return e.deleteFile(n)}}},[i("i",{staticClass:"fa fa-file-code-o"},[e._v(" "+e._s(n))])])})),i("el-button",{staticClass:"button-new-file",attrs:{size:"small"},on:{click:function(t){return e.openFileDialog("","")}}},[e._v("+ New File ")]),i("el-dialog",{attrs:{visible:e.upsertFileDialogVisible,width:e.dialogWith,"close-on-click-modal":!1},on:{"update:visible":function(t){e.upsertFileDialogVisible=t}}},[i("el-form",[i("el-form-item",{attrs:{label:e.$t("m.File_Name"),required:""}},[i("el-input",{attrs:{placeholder:"******.h",size:"small"},model:{value:e.fileName,callback:function(t){e.fileName=t},expression:"fileName"}})],1),i("el-form-item",{attrs:{label:e.$t("m.File_Content"),required:""}},[i("code-mirror",{model:{value:e.fileContent,callback:function(t){e.fileContent=t},expression:"fileContent"}})],1),i("el-form-item",{staticStyle:{"text-align":"center","margin-top":"10px"}},[i("el-button",{attrs:{type:"primary"},on:{click:e.upsertFile}},[e._v(e._s(e.$t("m.Save"))+" ")])],1)],1)],1)],2)}),[],!1,null,"475843f7",null);t.default=i.exports}}]);