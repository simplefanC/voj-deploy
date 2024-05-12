(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-30a0a16a"],{ad9b:function(t,n,e){},bb3e:function(t,n,e){"use strict";e.r(n);var i=function(){var t=this,n=t._self._c;return n("div",[n("el-card",[n("div",{attrs:{slot:"header"},slot:"header"},[n("span",{staticClass:"panel-title home-title"},[t._v(t._s(t.$t("m.General_Announcement")))])]),n("div",{staticClass:"create"},[n("el-button",{attrs:{icon:"el-icon-plus",size:"small",type:"primary"},on:{click:function(n){return t.openAnnouncementDialog(null)}}},[t._v(t._s(t.$t("m.Create"))+" ")])],1),n("div",{staticClass:"list"},[n("vxe-table",{ref:"table",attrs:{data:t.announcementList,loading:t.loading,"auto-resize":"",stripe:""}},[n("vxe-table-column",{attrs:{field:"id","min-width":"50",title:"ID"}}),n("vxe-table-column",{attrs:{title:t.$t("m.Announcement_Title"),field:"title","min-width":"150","show-overflow":""}}),n("vxe-table-column",{attrs:{title:t.$t("m.Created_Time"),field:"gmtCreate","min-width":"150"},scopedSlots:t._u([{key:"default",fn:function({row:n}){return[t._v(" "+t._s(t._f("localtime")(n.gmtCreate))+" ")]}}])}),n("vxe-table-column",{attrs:{title:t.$t("m.Modified_Time"),field:"gmtModified","min-width":"150"},scopedSlots:t._u([{key:"default",fn:function({row:n}){return[t._v(" "+t._s(t._f("localtime")(n.gmtModified))+" ")]}}])}),n("vxe-table-column",{attrs:{title:t.$t("m.Author"),field:"username","min-width":"150","show-overflow":""}}),n("vxe-table-column",{attrs:{title:t.$t("m.Announcement_visible"),field:"status","min-width":"100"},scopedSlots:t._u([{key:"default",fn:function({row:e}){return[n("el-switch",{attrs:{"active-value":0,"inactive-value":1,"active-text":"","inactive-text":""},on:{change:function(n){return t.handleVisibleSwitch(e)}},model:{value:e.status,callback:function(n){t.$set(e,"status",n)},expression:"row.status"}})]}}])}),n("vxe-table-column",{attrs:{"min-width":"150",title:"Option"},scopedSlots:t._u([{key:"default",fn:function(e){return[n("el-tooltip",{staticClass:"item",attrs:{content:t.$t("m.Edit_Announcement"),effect:"dark",placement:"top"}},[n("el-button",{attrs:{icon:"el-icon-edit-outline",size:"mini",type:"primary"},nativeOn:{click:function(n){return t.openAnnouncementDialog(e.row)}}})],1),n("el-tooltip",{staticClass:"item",attrs:{content:t.$t("m.Delete_Announcement"),effect:"dark",placement:"top"}},[n("el-button",{attrs:{icon:"el-icon-delete-solid",size:"mini",type:"danger"},nativeOn:{click:function(n){return t.deleteAnnouncement(e.row.id)}}})],1)]}}])})],1),n("div",{staticClass:"panel-options"},[t.contestID?t._e():n("el-pagination",{staticClass:"page",attrs:{"page-size":t.pageSize,total:t.total,layout:"prev, pager, next"},on:{"current-change":t.currentChange}})],1)],1)]),n("el-dialog",{attrs:{title:t.announcementDialogTitle,visible:t.showEditAnnouncementDialog},on:{"update:visible":function(n){t.showEditAnnouncementDialog=n},open:t.onOpenEditDialog}},[n("el-form",{attrs:{model:t.announcement,"label-position":"top"}},[n("el-form-item",{attrs:{label:t.$t("m.Announcement_Title"),required:""}},[n("el-input",{staticClass:"title-input",attrs:{placeholder:t.$t("m.Announcement_Title")},model:{value:t.announcement.title,callback:function(n){t.$set(t.announcement,"title",n)},expression:"announcement.title"}})],1),n("el-form-item",{attrs:{label:t.$t("m.Announcement_Content"),required:""}},[n("Editor",{attrs:{value:t.announcement.content},on:{"update:value":function(n){return t.$set(t.announcement,"content",n)}}})],1),n("div",{staticClass:"visible-box"},[n("span",[t._v(t._s(t.$t("m.Announcement_visible")))]),n("el-switch",{attrs:{"active-value":0,"inactive-value":1,"active-text":"","inactive-text":""},model:{value:t.announcement.status,callback:function(n){t.$set(t.announcement,"status",n)},expression:"announcement.status"}})],1)],1),n("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[n("el-button",{attrs:{type:"danger"},nativeOn:{click:function(n){t.showEditAnnouncementDialog=!1}}},[t._v(t._s(t.$t("m.Cancel")))]),n("el-button",{attrs:{type:"primary"},nativeOn:{click:function(n){return t.submitAnnouncement.apply(null,arguments)}}},[t._v(t._s(t.$t("m.OK")))])],1)],1)],1)},a=[],o=e("3228"),s=e("7aa9"),c=e("7736");const l=()=>e.e("chunk-1b666b40").then(e.bind(null,"a956"));var u={name:"Announcement",components:{Editor:l},data(){return{contestID:"",showEditAnnouncementDialog:!1,announcementList:[],pageSize:15,total:0,mode:"create",announcement:{id:null,title:"",content:"",status:0,uid:""},announcementDialogTitle:"Edit Announcement",loading:!1,currentPage:0}},mounted(){this.init()},methods:{init(){this.contestID=this.$route.params.contestId,this.contestID?this.getContestAnnouncementList(1):this.getAnnouncementList(1)},currentChange(t){this.currentPage=t,this.contestID?this.getContestAnnouncementList(t):this.getAnnouncementList(t)},getAnnouncementList(t){this.loading=!0,o["a"].admin_getAnnouncementList(t,this.pageSize).then(t=>{this.loading=!1,this.total=t.data.data.total,this.announcementList=t.data.data.records},t=>{this.loading=!1})},getContestAnnouncementList(t){this.loading=!0,o["a"].admin_getContestAnnouncementList(this.contestID,t,this.pageSize).then(t=>{this.loading=!1,this.total=t.data.data.total,this.announcementList=t.data.data.records}).catch(()=>{this.loading=!1})},onOpenEditDialog(){setTimeout(()=>{if(document.createEvent){let t=document.createEvent("HTMLEvents");t.initEvent("resize",!0,!0),window.dispatchEvent(t)}else document.createEventObject&&window.fireEvent("onresize")},0)},submitAnnouncement(t){let n,e="";if(t.id||(t=this.announcement),this.contestID){let i={announcement:t,cid:this.contestID};n=i,e="edit"===this.mode?"admin_updateContestAnnouncement":"admin_createContestAnnouncement"}else e="edit"===this.mode?"admin_updateAnnouncement":"admin_createAnnouncement",n=t;o["a"][e](n).then(t=>{this.showEditAnnouncementDialog=!1,s["a"].success(this.$i18n.t("m.Post_successfully")),this.init()}).catch()},deleteAnnouncement(t){this.$confirm(this.$i18n.t("m.Delete_Announcement_Tips"),"Warning",{confirmButtonText:this.$i18n.t("m.OK"),cancelButtonText:this.$i18n.t("m.Cancel"),type:"warning"}).then(()=>{this.loading=!0;let n=this.contestID?"admin_deleteContestAnnouncement":"admin_deleteAnnouncement";o["a"][n](t).then(t=>{this.loading=!0,s["a"].success(t.data.msg),this.init()})}).catch(()=>{this.loading=!1})},openAnnouncementDialog(t){this.showEditAnnouncementDialog=!0,null!==t?(this.announcementDialogTitle=this.$i18n.t("m.Edit_Announcement"),this.announcement=Object.assign({},t),this.mode="edit"):(this.announcementDialogTitle=this.$i18n.t("m.Create_Announcement"),this.announcement.title="",this.announcement.status=0,this.announcement.content="",this.announcement.uid=this.userInfo.uid,this.announcement.username=this.userInfo.username,this.mode="create")},handleVisibleSwitch(t){this.mode="edit",this.submitAnnouncement({id:t.id,title:t.title,content:t.content,status:t.status,uid:t.uid})}},watch:{$route(){this.init()}},computed:{...Object(c["c"])(["userInfo"])}},m=u,d=(e("c616"),e("0b56")),r=Object(d["a"])(m,i,a,!1,null,"686fd8f4",null);n["default"]=r.exports},c616:function(t,n,e){"use strict";e("ad9b")}}]);