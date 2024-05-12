(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-28e889cb"],{21553:function(s,e,a){"use strict";a.r(e);var i=function(){var s=this,e=s._self._c;return e("div",{staticClass:"setting-main"},[e("el-row",{attrs:{gutter:20}},[e("el-col",{attrs:{lg:10,md:10,sm:24}},[e("div",{staticClass:"left"},[e("p",{staticClass:"section-title"},[s._v(s._s(s.$t("m.Change_Password")))]),e("el-form",{ref:"formPassword",staticClass:"setting-content",attrs:{model:s.formPassword,rules:s.rulePassword}},[e("el-form-item",{attrs:{label:s.$t("m.Old_Password"),prop:"oldPassword"}},[e("el-input",{attrs:{type:"password"},model:{value:s.formPassword.oldPassword,callback:function(e){s.$set(s.formPassword,"oldPassword",e)},expression:"formPassword.oldPassword"}})],1),e("el-form-item",{attrs:{label:s.$t("m.New_Password"),prop:"newPassword"}},[e("el-input",{attrs:{type:"password"},model:{value:s.formPassword.newPassword,callback:function(e){s.$set(s.formPassword,"newPassword",e)},expression:"formPassword.newPassword"}})],1),e("el-form-item",{attrs:{label:s.$t("m.Confirm_New_Password"),prop:"againPassword"}},[e("el-input",{attrs:{type:"password"},model:{value:s.formPassword.againPassword,callback:function(e){s.$set(s.formPassword,"againPassword",e)},expression:"formPassword.againPassword"}})],1)],1),e("el-popover",{attrs:{placement:"top",trigger:"click",width:"350"},model:{value:s.visible.passwordSlideBlock,callback:function(e){s.$set(s.visible,"passwordSlideBlock",e)},expression:"visible.passwordSlideBlock"}},[e("el-button",{attrs:{slot:"reference",disabled:s.disabled.btnPassword,loading:s.loading.btnPassword,type:"primary"},slot:"reference"},[s._v(s._s(s.$t("m.Update_Password"))+" ")]),e("slide-verify",{directives:[{name:"show",rawName:"v-show",value:!s.verify.passwordSuccess,expression:"!verify.passwordSuccess"}],ref:"passwordSlideBlock",attrs:{accuracy:3,h:100,l:42,r:10,"slider-text":s.$t("m.Slide_Verify"),w:325},on:{again:function(e){return s.onAgain("password")},success:s.changePassword}}),e("el-alert",{directives:[{name:"show",rawName:"v-show",value:s.verify.passwordSuccess,expression:"verify.passwordSuccess"}],attrs:{center:!0,closable:!1,description:s.verify.passwordMsg,title:s.$t("m.Slide_Verify_Success"),"show-icon":"",type:"success"}})],1)],1),e("el-alert",{directives:[{name:"show",rawName:"v-show",value:s.visible.passwordAlert.show,expression:"visible.passwordAlert.show"}],staticStyle:{"margin-top":"15px"},attrs:{closable:!1,description:s.visible.passwordAlert.description,title:s.visible.passwordAlert.title,type:s.visible.passwordAlert.type,effect:"dark","show-icon":""}})],1),e("el-col",{attrs:{lg:4,md:4}},[e("div",{staticClass:"separator hidden-md-and-down"}),e("p")]),e("el-col",{attrs:{lg:10,md:10,sm:24}},[e("div",{staticClass:"right"},[e("p",{staticClass:"section-title"},[s._v(s._s(s.$t("m.Change_Email")))]),e("el-form",{ref:"formEmail",staticClass:"setting-content",attrs:{model:s.formEmail,rules:s.ruleEmail}},[e("el-form-item",{attrs:{label:s.$t("m.Current_Password"),prop:"password"}},[e("el-input",{attrs:{type:"password"},model:{value:s.formEmail.password,callback:function(e){s.$set(s.formEmail,"password",e)},expression:"formEmail.password"}})],1),e("el-form-item",{attrs:{label:s.$t("m.Old_Email")}},[e("el-input",{attrs:{disabled:""},model:{value:s.formEmail.oldEmail,callback:function(e){s.$set(s.formEmail,"oldEmail",e)},expression:"formEmail.oldEmail"}})],1),e("el-form-item",{attrs:{label:s.$t("m.New_Email"),prop:"newEmail"}},[e("el-input",{model:{value:s.formEmail.newEmail,callback:function(e){s.$set(s.formEmail,"newEmail",e)},expression:"formEmail.newEmail"}})],1)],1),e("el-popover",{attrs:{placement:"top",trigger:"click",width:"350"},model:{value:s.visible.emailSlideBlock,callback:function(e){s.$set(s.visible,"emailSlideBlock",e)},expression:"visible.emailSlideBlock"}},[e("el-button",{attrs:{slot:"reference",disabled:s.disabled.btnEmail,loading:s.loading.btnEmailLoading,type:"primary"},slot:"reference"},[s._v(s._s(s.$t("m.Update_Email"))+" ")]),e("slide-verify",{directives:[{name:"show",rawName:"v-show",value:!s.verify.emailSuccess,expression:"!verify.emailSuccess"}],ref:"emailSlideBlock",attrs:{accuracy:3,h:100,l:42,r:10,"slider-text":s.$t("m.Slide_Verify"),w:325},on:{again:function(e){return s.onAgain("email")},success:s.changeEmail}}),e("el-alert",{directives:[{name:"show",rawName:"v-show",value:s.verify.emailSuccess,expression:"verify.emailSuccess"}],attrs:{center:!0,closable:!1,description:s.verify.emailMsg,title:s.$t("m.Slide_Verify_Success"),"show-icon":"",type:"success"}})],1)],1),e("el-alert",{directives:[{name:"show",rawName:"v-show",value:s.visible.emailAlert.show,expression:"visible.emailAlert.show"}],staticStyle:{"margin-top":"15px"},attrs:{closable:!1,description:s.visible.emailAlert.description,title:s.visible.emailAlert.title,type:s.visible.emailAlert.type,effect:"dark","show-icon":""}})],1)],1)],1)},t=[],r=(a("e157"),a("24b8"),a("3228")),l=a("7aa9"),o=(a("5cbd"),{data(){const s=[{required:!0,trigger:"blur"},{trigger:"blur",min:6,max:20,message:this.$i18n.t("m.Password_Check_Between")}],e=(s,e,a)=>{e!==this.formPassword.newPassword&&a(new Error(this.$i18n.t("m.Password_does_not_match"))),a()},a=(s,e,a)=>{""!==this.formPassword.oldPassword&&(this.formPassword.oldPassword===this.formPassword.newPassword?a(new Error(this.$i18n.t("m.The_new_password_does_not_change"))):this.$refs.formPassword.validateField("again_password")),a()},i=(s,e,a)=>{""!==this.formEmail.oldEmail&&this.formEmail.oldEmail===this.formEmail.newEmail&&a(new Error(this.$i18n.t("m.The_new_email_does_not_change"))),a()};return{loading:{btnPassword:!1,btnEmail:!1},disabled:{btnPassword:!1,btnEmail:!1},verify:{passwordSuccess:!1,passwordMsg:"",emailSuccess:!1,emailMsg:""},visible:{passwordAlert:{type:"success",show:!1,title:"",description:""},emailAlert:{type:"success",show:!1,title:"",description:""},passwordSlideBlock:!1,emailSlideBlock:!1},formPassword:{oldPassword:"",newPassword:"",againPassword:""},formEmail:{password:"",oldEmail:"",newEmail:""},rulePassword:{oldPassword:s,newPassword:[{required:!0,trigger:"blur"},{trigger:"blur",min:6,max:20,message:this.$i18n.t("m.Password_Check_Between")},{validator:a,trigger:"blur"}],againPassword:[{required:!0,trigger:"blur",message:this.$i18n.t("m.Password_Again_Check_Required")},{validator:e,trigger:"blur"}]},ruleEmail:{password:s,newEmail:[{required:!0,message:this.$i18n.t("m.Email_Check_Required"),trigger:"blur"},{type:"email",trigger:"change",message:this.$i18n.t("m.Email_Check_Format")},{validator:i,trigger:"blur"}]}}},mounted(){this.formEmail.oldEmail=this.$store.getters.userInfo.email||""},methods:{changePassword(s){this.verify.passwordSuccess=!0;let e=(s/1e3).toFixed(1);this.verify.passwordMsg="Total time "+e+"s",setTimeout(()=>{this.visible.passwordSlideBlock=!1,this.verify.passwordSuccess=!1,this.$refs.passwordSlideBlock.reset()},1e3),this.$refs["formPassword"].validate(s=>{if(s){this.loading.btnPassword=!0;let s=Object.assign({},this.formPassword);delete s.againPassword,r["a"].changePassword(s).then(s=>{this.loading.btnPassword=!1,200==s.data.data.code?(l["a"].success(this.$i18n.t("m.Update_Successfully")),this.visible.passwordAlert={show:!0,title:this.$i18n.t("m.Update_Successfully"),type:"success",description:s.data.data.msg},setTimeout(()=>{this.visible.passwordAlert=!1,this.$router.push({name:"Logout"})},5e3)):(l["a"].error(s.data.msg),this.visible.passwordAlert={show:!0,title:this.$i18n.t("m.Update_Failed"),type:"warning",description:s.data.data.msg},403==s.data.data.code&&(this.visible.passwordAlert.type="error",this.disabled.btnPassword=!0))},s=>{this.loading.btnPassword=!1})}})},changeEmail(s){this.verify.emailSuccess=!0;let e=(s/1e3).toFixed(1);this.verify.emailMsg="Total time "+e+"s",setTimeout(()=>{this.visible.emailSlideBlock=!1,this.verify.emailSuccess=!1,this.$refs.emailSlideBlock.reset()},1e3),this.$refs["formEmail"].validate(s=>{if(s){this.loading.btnEmail=!0;let s=Object.assign({},this.formEmail);r["a"].changeEmail(s).then(s=>{this.loading.btnEmail=!1,200==s.data.data.code?(l["a"].success(this.$i18n.t("m.Update_Successfully")),this.visible.emailAlert={show:!0,title:this.$i18n.t("m.Update_Successfully"),type:"success",description:s.data.data.msg},this.$store.dispatch("setUserInfo",s.data.data.userInfo),this.$refs["formEmail"].resetFields(),this.formEmail.oldEmail=s.data.data.userInfo.email):(l["a"].error(s.data.msg),this.visible.emailAlert={show:!0,title:this.$i18n.t("m.Update_Failed"),type:"warning",description:s.data.data.msg},403==s.data.data.code&&(this.visible.emailAlert.type="error",this.disabled.btnEmail=!0))},s=>{this.loading.btnEmail=!1})}})},onAgain(s){"password"?this.$refs.passwordSlideBlock.reset():this.$refs.emailSlideBlock.reset(),l["a"].warning(this.$i18n.t("m.Guess_robot"))}}}),d=o,m=(a("7275"),a("0b56")),n=Object(m["a"])(d,i,t,!1,null,"24084637",null);e["default"]=n.exports},7275:function(s,e,a){"use strict";a("f81b")},f81b:function(s,e,a){}}]);