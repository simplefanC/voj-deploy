(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-5485f482"],{"4e90":function(t,e,a){"use strict";a("f301")},"97d3":function(t,e,a){"use strict";a.r(e);var i=function(){var t=this,e=t._self._c;return e("div",[e("el-card",[e("div",{attrs:{slot:"header"},slot:"header"},[e("span",{staticClass:"panel-title home-title"},[t._v(t._s(t.$t("m.Admin_Category")))]),e("div",{staticClass:"filter"},[e("span",[e("el-button",{attrs:{icon:"el-icon-plus",size:"small",type:"primary"},on:{click:function(e){return t.openCategoryDialog("add",null)}}},[t._v(t._s(t.$t("m.Add_Category"))+" ")])],1)])]),t._l(t.categoryList,(function(a,i){return e("el-tag",{key:i,staticClass:"category",attrs:{color:a.color?a.color:"#409eff","disable-transitions":!1,closable:"",effect:"dark"},on:{click:function(e){return t.openCategoryDialog("update",a)},close:function(e){return t.deleteCategory(a)}}},[t._v(" "+t._s(a.name)+" ")])})),e("el-button",{staticClass:"button-new-category",attrs:{size:"small"},on:{click:function(e){return t.openCategoryDialog("add",null)}}},[t._v("+ New Category ")])],2),e("el-dialog",{attrs:{title:t.$t("m."+t.upsertTitle),visible:t.addCategoryDialogVisible,width:"350px","close-on-click-modal":!1},on:{"update:visible":function(e){t.addCategoryDialogVisible=e}}},[e("el-form",[e("el-form-item",{attrs:{label:t.$t("m.Category_Name"),required:""}},[e("el-input",{attrs:{size:"small"},model:{value:t.category.name,callback:function(e){t.$set(t.category,"name",e)},expression:"category.name"}})],1),e("el-form-item",{attrs:{label:t.$t("m.Category_Color"),required:""}},[e("el-color-picker",{model:{value:t.category.color,callback:function(e){t.$set(t.category,"color",e)},expression:"category.color"}})],1),e("el-form-item",{staticStyle:{"text-align":"center"}},[e("el-button",{attrs:{loading:t.upsertCategoryLoading,type:"primary"},on:{click:t.upsertCategory}},[t._v(t._s(t.$t("m."+t.upsertCategoryBtn))+" ")])],1)],1)],1)],1)},o=[],s=(a("24b8"),a("7aa9")),r=a("3228"),l={data(){return{getCategoryListLoading:!1,categoryList:[],addCategoryDialogVisible:!1,upsertTitle:"Add_Category",upsertCategoryBtn:"To_Add",upsertCategoryLoading:!1,category:{id:null,name:null,color:"#409EFF"}}},mounted(){this.getTrainingCategoryList()},methods:{getTrainingCategoryList(){this.getCategoryListLoading=!0,r["a"].getTrainingCategoryList().then(t=>{this.categoryList=t.data.data,this.getCategoryListLoading=!1},t=>{this.getCategoryListLoading=!1})},deleteCategory(t){this.$confirm(this.$i18n.t("m.Delete_Category_Tips"),"Tips",{type:"warning"}).then(()=>{r["a"].admin_deleteCategory(t.id).then(e=>{s["a"].success(this.$i18n.t("m.Delete_successfully")),this.categoryList.splice(this.categoryList.indexOf(t),1)}).catch(()=>{})},()=>{})},openCategoryDialog(t,e){"add"==t?(this.upsertTitle="Add_Category",this.upsertCategoryBtn="To_Add",this.category={id:null,name:null,color:"#409EFF"}):(this.upsertTitle="Update_Category",this.upsertCategoryBtn="To_Update",this.category=Object.assign({},e)),this.addCategoryDialogVisible=!0},upsertCategory(){this.category.id?(this.upsertCategoryLoading=!0,r["a"].admin_updateCategory(this.category).then(t=>{this.upsertCategoryLoading=!1,s["a"].success(this.$i18n.t("m.Update_Successfully")),this.categoryList.push(t.data.data),this.addCategoryDialogVisible=!1,this.getTrainingCategoryList()},t=>{this.upsertCategoryLoading=!1})):(this.upsertCategoryLoading=!0,r["a"].admin_addCategory(this.category).then(t=>{this.upsertCategoryLoading=!1,s["a"].success(this.$i18n.t("m.Add_Successfully")),this.categoryList.push(t.data.data),this.addCategoryDialogVisible=!1},t=>{this.upsertCategoryLoading=!1}))}}},n=l,g=(a("4e90"),a("0b56")),c=Object(g["a"])(n,i,o,!1,null,"a2fbbec2",null);e["default"]=c.exports},f301:function(t,e,a){}}]);