(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-c777b1f8"],{8689:function(t,i,e){"use strict";e("b9a3")},"8baf":function(t,i,e){"use strict";e.r(i);var l=function(){var t=this,i=t._self._c;return i("div",[i("el-card",{staticClass:"card-top"},[i("div",{attrs:{slot:"header"},slot:"header"},[i("span",{staticClass:"panel-title home-title"},[t._v(t._s(t.$t("m.System_Switch")))])]),i("el-row",{attrs:{gutter:20}},[i("el-col",{attrs:{xs:24,md:12}},[i("el-card",[i("div",{attrs:{slot:"header"},slot:"header"},[i("span",{staticClass:"switch-item-title"},[t._v(t._s(t.$t("m.Judge_Config")))])]),i("el-form",{ref:"form",attrs:{"label-position":t.labelPosition,"label-width":"320px",model:t.switchConfig}},[i("el-form-item",{attrs:{label:t.$t("m.Open_Public_Judge"),"label-width":"320px"}},[i("el-switch",{attrs:{"active-color":"#13ce66","inactive-color":"#ff4949"},model:{value:t.switchConfig.openPublicJudge,callback:function(i){t.$set(t.switchConfig,"openPublicJudge",i)},expression:"switchConfig.openPublicJudge"}})],1),i("el-form-item",{attrs:{label:t.$t("m.Open_Contest_Judge"),"label-width":"320px"}},[i("el-switch",{attrs:{"active-color":"#13ce66","inactive-color":"#ff4949"},model:{value:t.switchConfig.openContestJudge,callback:function(i){t.$set(t.switchConfig,"openContestJudge",i)},expression:"switchConfig.openContestJudge"}})],1),i("el-form-item",{attrs:{label:t.$t("m.Non_Contest_Submission_Frequency"),"label-width":"320px"}},[i("el-input-number",{attrs:{min:0},model:{value:t.switchConfig.defaultSubmitInterval,callback:function(i){t.$set(t.switchConfig,"defaultSubmitInterval",i)},expression:"switchConfig.defaultSubmitInterval"}})],1),i("el-form-item",{attrs:{label:t.$t("m.Code_Visible_Start_Time"),"label-width":"320px"}},[i("el-date-picker",{attrs:{placeholder:t.$t("m.Start_Time"),type:"datetime","value-format":"timestamp"},model:{value:t.switchConfig.codeVisibleStartTime,callback:function(i){t.$set(t.switchConfig,"codeVisibleStartTime",i)},expression:"switchConfig.codeVisibleStartTime"}})],1)],1),i("el-button",{staticStyle:{"margin-top":"15px"},attrs:{type:"primary",loading:t.loading,size:"small"},nativeOn:{click:function(i){return t.saveSwitchConfig.apply(null,arguments)}}},[i("i",{staticClass:"fa fa-save"},[t._v(" "+t._s(t.$t("m.Save")))])])],1)],1),i("el-col",{attrs:{xs:24,md:12}},[i("el-card",{staticClass:"card-top"},[i("div",{attrs:{slot:"header"},slot:"header"},[i("span",{staticClass:"switch-item-title"},[t._v(t._s(t.$t("m.Module_Config")))])]),i("el-form",{ref:"form",attrs:{"label-position":t.labelPosition,"label-width":"100px",model:t.switchConfig}},[i("el-row",[i("el-col",{attrs:{xs:24,md:12}},[i("el-form-item",{attrs:{label:t.$t("m.Problem_Switch"),"label-width":"100px"}},[i("el-switch",{attrs:{"active-color":"#13ce66","inactive-color":"#ff4949"},model:{value:t.switchConfig.problem,callback:function(i){t.$set(t.switchConfig,"problem",i)},expression:"switchConfig.problem"}})],1)],1),i("el-col",{attrs:{xs:24,md:12}},[i("el-form-item",{attrs:{label:t.$t("m.Training_Switch"),"label-width":"100px"}},[i("el-switch",{attrs:{"active-color":"#13ce66","inactive-color":"#ff4949"},model:{value:t.switchConfig.training,callback:function(i){t.$set(t.switchConfig,"training",i)},expression:"switchConfig.training"}})],1)],1)],1),i("el-row",[i("el-col",{attrs:{xs:24,md:12}},[i("el-form-item",{attrs:{label:t.$t("m.Contest_Switch"),"label-width":"100px"}},[i("el-switch",{attrs:{"active-color":"#13ce66","inactive-color":"#ff4949"},model:{value:t.switchConfig.contest,callback:function(i){t.$set(t.switchConfig,"contest",i)},expression:"switchConfig.contest"}})],1)],1),i("el-col",{attrs:{xs:24,md:12}},[i("el-form-item",{attrs:{label:t.$t("m.Status_Switch"),"label-width":"100px"}},[i("el-switch",{attrs:{"active-color":"#13ce66","inactive-color":"#ff4949"},model:{value:t.switchConfig.status,callback:function(i){t.$set(t.switchConfig,"status",i)},expression:"switchConfig.status"}})],1)],1)],1),i("el-row",[i("el-col",{attrs:{xs:24,md:12}},[i("el-form-item",{attrs:{label:t.$t("m.Rank_Switch"),"label-width":"100px"}},[i("el-switch",{attrs:{"active-color":"#13ce66","inactive-color":"#ff4949"},model:{value:t.switchConfig.rank,callback:function(i){t.$set(t.switchConfig,"rank",i)},expression:"switchConfig.rank"}})],1)],1),i("el-col",{attrs:{xs:24,md:12}},[i("el-form-item",{attrs:{label:t.$t("m.Discussion_Switch"),"label-width":"100px"}},[i("el-switch",{attrs:{"active-color":"#13ce66","inactive-color":"#ff4949"},model:{value:t.switchConfig.discussion,callback:function(i){t.$set(t.switchConfig,"discussion",i)},expression:"switchConfig.discussion"}})],1)],1)],1),i("el-row",[i("el-col",{attrs:{xs:24,md:12}},[i("el-form-item",{attrs:{label:t.$t("m.About_Switch"),"label-width":"100px"}},[i("el-switch",{attrs:{"active-color":"#13ce66","inactive-color":"#ff4949"},model:{value:t.switchConfig.introduction,callback:function(i){t.$set(t.switchConfig,"introduction",i)},expression:"switchConfig.introduction"}})],1)],1),i("el-col",{attrs:{xs:24,md:12}},[i("el-form-item",{attrs:{label:t.$t("m.Allow_Register"),"label-width":"100px"}},[i("el-switch",{attrs:{"active-color":"#13ce66","inactive-color":"#ff4949"},model:{value:t.switchConfig.register,callback:function(i){t.$set(t.switchConfig,"register",i)},expression:"switchConfig.register"}})],1)],1)],1)],1),i("el-button",{staticStyle:{"margin-top":"15px"},attrs:{type:"primary",loading:t.loading,size:"small"},nativeOn:{click:function(i){return t.saveSwitchConfig.apply(null,arguments)}}},[i("i",{staticClass:"fa fa-save"},[t._v(" "+t._s(t.$t("m.Save")))])])],1)],1)],1)],1)],1)},s=[],a=e("3228"),o=e("7aa9"),c={name:"SystemConfig",data(){return{loading:!1,switchConfig:{},labelPosition:"left"}},created(){let t=window.screen.width;t<500&&(this.labelPosition="top")},mounted(){a["a"].admin_getSwitchConfig().then(t=>{this.switchConfig=t.data.data})},methods:{saveSwitchConfig(){this.loading=!0,a["a"].admin_saveSwitchConfig(this.switchConfig).then(t=>{o["a"].success(this.$i18n.t("m.Update_Successfully")),this.loading=!1},()=>{this.loading=!1})}}},n=c,r=(e("8689"),e("0b56")),f=Object(r["a"])(n,l,s,!1,null,"09dca5d2",null);i["default"]=f.exports},b9a3:function(t,i,e){}}]);