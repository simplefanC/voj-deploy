(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-8f71893c"],{7670:function(t,e,i){"use strict";i("dcf0")},"8d9e":function(t,e,i){"use strict";i.r(e);var o=function(){var t=this,e=t._self._c;return e("div",[e("el-card",[e("div",{attrs:{slot:"header"},slot:"header"},[e("span",{staticClass:"panel-title home-title"},[t._v(t._s(t.$t("m.SysNotice")))]),e("div",{staticStyle:{"font-size":"13px","margin-top":"5px",color:"red"}},[t._v(" "+t._s(t.$t("m.Push_System_Notification_Every_Hour"))+" ")])]),e("div",{staticClass:"create"},[e("el-button",{attrs:{icon:"el-icon-plus",size:"small",type:"primary"},on:{click:function(e){return t.openNoticeDialog(null)}}},[t._v(t._s(t.$t("m.Create"))+" ")])],1),e("div",{staticClass:"list"},[e("vxe-table",{ref:"table",attrs:{data:t.noticeList,loading:t.loading,"auto-resize":"",stripe:""}},[e("vxe-table-column",{attrs:{field:"id","min-width":"50",title:"ID"}}),e("vxe-table-column",{attrs:{title:t.$t("m.Notice_Title"),field:"title","min-width":"150","show-overflow":""}}),e("vxe-table-column",{attrs:{title:t.$t("m.Created_Time"),field:"gmtCreate","min-width":"150"},scopedSlots:t._u([{key:"default",fn:function({row:e}){return[t._v(" "+t._s(t._f("localtime")(e.gmtCreate))+" ")]}}])}),e("vxe-table-column",{attrs:{title:t.$t("m.Modified_Time"),field:"gmtModified","min-width":"150"},scopedSlots:t._u([{key:"default",fn:function({row:e}){return[t._v(" "+t._s(t._f("localtime")(e.gmtModified))+" ")]}}])}),e("vxe-table-column",{attrs:{title:t.$t("m.Author"),field:"adminUsername","min-width":"150","show-overflow":""}}),e("vxe-table-column",{attrs:{title:t.$t("m.Notice_Push"),field:"state","min-width":"100"}}),e("vxe-table-column",{attrs:{title:t.$t("m.Option"),"min-width":"150"},scopedSlots:t._u([{key:"default",fn:function(i){return[e("el-tooltip",{staticClass:"item",attrs:{content:t.$t("m.Edit_Notice"),effect:"dark",placement:"top"}},[e("el-button",{attrs:{icon:"el-icon-edit-outline",size:"mini",type:"primary"},nativeOn:{click:function(e){return t.openNoticeDialog(i.row)}}})],1),e("el-tooltip",{staticClass:"item",attrs:{content:t.$t("m.Delete_Notice"),effect:"dark",placement:"top"}},[e("el-button",{attrs:{icon:"el-icon-delete-solid",size:"mini",type:"danger"},nativeOn:{click:function(e){return t.deleteNotice(i.row.id)}}})],1)]}}])})],1),e("div",{staticClass:"panel-options"},[e("el-pagination",{staticClass:"page",attrs:{"page-size":t.pageSize,total:t.total,layout:"prev, pager, next"},on:{"current-change":t.currentChange}})],1)],1)]),e("el-dialog",{attrs:{fullscreen:!0,title:t.noticeDialogTitle,visible:t.showEditNoticeDialog},on:{"update:visible":function(e){t.showEditNoticeDialog=e},open:t.onOpenEditDialog}},[e("el-form",{attrs:{model:t.notice,"label-position":"top"}},[e("el-form-item",{attrs:{label:t.$t("m.Notice_Title"),required:""}},[e("el-input",{staticClass:"title-input",attrs:{placeholder:t.$t("m.Notice_Title")},model:{value:t.notice.title,callback:function(e){t.$set(t.notice,"title",e)},expression:"notice.title"}})],1),e("el-form-item",{attrs:{label:t.$t("m.Notice_Content"),required:""}},[e("Editor",{attrs:{value:t.notice.content},on:{"update:value":function(e){return t.$set(t.notice,"content",e)}}})],1),e("div",{staticClass:"visible-box"},[e("span",[t._v(t._s(t.$t("m.Notice_Recipient")))]),e("span",[e("el-radio",{attrs:{label:"All"},model:{value:t.notice.type,callback:function(e){t.$set(t.notice,"type",e)},expression:"notice.type"}},[t._v(t._s(t.$t("m.All_User")))]),e("el-radio",{attrs:{disabled:"",label:"Single"},model:{value:t.notice.type,callback:function(e){t.$set(t.notice,"type",e)},expression:"notice.type"}},[t._v(t._s(t.$t("m.Designated_User")))]),e("el-radio",{attrs:{disabled:"",label:"Admin"},model:{value:t.notice.type,callback:function(e){t.$set(t.notice,"type",e)},expression:"notice.type"}},[t._v(t._s(t.$t("m.All_Admin")))])],1)])],1),e("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[e("el-button",{attrs:{type:"danger"},nativeOn:{click:function(e){t.showEditNoticeDialog=!1}}},[t._v(t._s(t.$t("m.Cancel")))]),e("el-button",{attrs:{type:"primary"},nativeOn:{click:function(e){return t.submitNotice.apply(null,arguments)}}},[t._v(t._s(t.$t("m.OK")))])],1)],1)],1)},n=[],l=i("3228"),a=i("7aa9"),s=i("7736");const c=()=>i.e("chunk-1b666b40").then(i.bind(null,"a956"));var r={name:"Notice",components:{Editor:c},data(){return{contestID:"",showEditNoticeDialog:!1,noticeList:[],pageSize:10,total:0,mode:"create",notice:{id:null,title:"",content:"",type:"",adminId:""},noticeDialogTitle:"Edit Notice",loading:!1,currentPage:1}},mounted(){this.init()},methods:{init(){this.getNoticeList(1)},currentChange(t){this.currentPage=t,this.contestID?this.getContestNoticeList(t):this.getNoticeList(t)},getNoticeList(t){this.loading=!0,l["a"].admin_getNoticeList(t,this.pageSize,"All").then(t=>{this.loading=!1,this.total=t.data.data.total,this.noticeList=t.data.data.records},t=>{this.loading=!1})},onOpenEditDialog(){setTimeout(()=>{if(document.createEvent){let t=document.createEvent("HTMLEvents");t.initEvent("resize",!0,!0),window.dispatchEvent(t)}else document.createEventObject&&window.fireEvent("onresize")},0)},submitNotice(t){t.id||(t=this.notice);let e="edit"===this.mode?"admin_updateNotice":"admin_createNotice",i=t;l["a"][e](i).then(t=>{this.showEditNoticeDialog=!1,a["a"].success(this.$i18n.t("m.Post_successfully")),this.init()}).catch()},deleteNotice(t){this.$confirm(this.$i18n.t("m.Delete_Notice_Tips"),"Warning",{confirmButtonText:this.$i18n.t("m.OK"),cancelButtonText:this.$i18n.t("m.Cancel"),type:"warning"}).then(()=>{this.loading=!0;let e="admin_deleteNotice";l["a"][e](t).then(t=>{this.loading=!0,a["a"].success(t.data.msg),this.init()})}).catch(()=>{this.loading=!1})},openNoticeDialog(t){this.showEditNoticeDialog=!0,null!==t?(this.noticeDialogTitle=this.$i18n.t("m.Edit_Notice"),this.notice=Object.assign({},t),this.mode="edit"):(this.noticeDialogTitle=this.$i18n.t("m.Create_Notice"),this.notice.title="",this.notice.content="",this.notice.type="All",this.notice.adminId=this.userInfo.uid,this.mode="create")}},watch:{$route(){this.init()}},computed:{...Object(s["c"])(["userInfo"])}},d=r,u=(i("7670"),i("0b56")),m=Object(u["a"])(d,o,n,!1,null,"5c44febe",null);e["default"]=m.exports},dcf0:function(t,e,i){}}]);