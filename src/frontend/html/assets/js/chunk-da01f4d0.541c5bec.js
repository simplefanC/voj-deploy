(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-da01f4d0"],{"1d07":function(t,e,i){},"22a2":function(t,e,i){"use strict";var n=i("3228"),a=i("7aa9"),o={name:"add-problem-from-public",props:["contestID","trainingID"],data:function(){return{page:1,limit:10,total:0,loading:!1,problems:[],contest:{},keyword:""}},mounted:function(){var t=this;this.contestID?n.a.admin_getContest(this.contestID).then((function(e){t.contest=e.data.data,t.getPublicProblem(1)})).catch((function(){})):this.trainingID&&this.getPublicProblem(1)},methods:{getPublicProblem:function(t){var e=this,i=(t=(this.loading=!0,{keyword:this.keyword,currentPage:t,limit:this.limit,problemType:this.contest.type,cid:this.contest.id,tid:this.trainingID}),null);this.contestID?i="admin_getContestProblemList":this.trainingID&&(i="admin_getTrainingProblemList"),n.a[i](t).then((function(t){e.loading=!1,e.total=t.data.data.problemList.total,e.problems=t.data.data.problemList.records})).catch((function(){e.loading=!1}))},handleAddProblem:function(t,e){var i=this;this.contestID?this.$prompt(this.$i18n.t("m.Enter_The_Problem_Display_ID_in_the_Contest"),"Tips").then((function(e){e=e.value,e={pid:t,cid:i.contestID,displayId:e},n.a.admin_addContestProblemFromPublic(e).then((function(t){i.$emit("on-change"),a.a.success(i.$i18n.t("m.Add_Successfully")),i.getPublicProblem(i.page)}),(function(){}))}),(function(){})):(e={pid:t,tid:this.trainingID,displayId:e},n.a.admin_addTrainingProblemFromPublic(e).then((function(t){i.$emit("on-change"),a.a.success(i.$i18n.t("m.Add_Successfully")),i.getPublicProblem(i.page)}),(function(){})))},filterByKeyword:function(){this.getPublicProblem(this.page)}}};i("d7ec"),i=i("cba8"),i=Object(i.a)(o,(function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticStyle:{"text-align":"center"}},[i("vxe-input",{staticStyle:{"margin-bottom":"10px"},attrs:{placeholder:t.$t("m.Enter_keyword"),size:"medium",type:"search"},on:{"search-click":t.filterByKeyword},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.filterByKeyword.apply(null,arguments)}},model:{value:t.keyword,callback:function(e){t.keyword=e},expression:"keyword"}}),i("vxe-table",{attrs:{data:t.problems,loading:t.loading,align:"center","auto-resize":"",stripe:""}},[i("vxe-table-column",{attrs:{field:"problemId","min-width":"100",title:"ID"}}),i("vxe-table-column",{attrs:{title:t.$t("m.Title"),field:"title","min-width":"150"}}),i("vxe-table-column",{attrs:{title:t.$t("m.Option"),align:"center","min-width":"100"},scopedSlots:t._u([{key:"default",fn:function(e){var n=e.row;return[i("el-tooltip",{attrs:{content:t.$t("m.Add"),effect:"dark",placement:"top"}},[i("el-button",{attrs:{icon:"el-icon-plus",size:"mini",type:"primary"},nativeOn:{click:function(e){return t.handleAddProblem(n.id,n.problemId)}}})],1)]}}])})],1),i("el-pagination",{staticClass:"page",attrs:{"current-page":t.page,"page-size":t.limit,total:t.total,layout:"prev, pager, next"},on:{"update:currentPage":function(e){t.page=e},"update:current-page":function(e){t.page=e},"current-change":t.getPublicProblem}})],1)}),[],!1,null,"558085c0",null);e.a=i.exports},"272d":function(t,e,i){},"698c":function(t,e,i){"use strict";i.r(e);var n=i("b49e"),a=(i("7241"),i("3228")),o=i("22a2"),l=i("7aa9"),r=i("9a36"),s=i("7736"),c=i("90b9");o={name:"ProblemList",components:{AddPublicProblem:o.a},data:function(){return{problemListAuth:0,oj:"All",pageSize:10,total:0,problemList:[],trainingProblemMap:{},keyword:"",loading:!1,currentPage:1,routeName:"",trainingId:"",currentProblemID:"",currentRow:{},addProblemDialogVisible:!1,AddRemoteOJProblemDialogVisible:!1,addRemoteOJproblemLoading:!1,otherOJName:"HDU",otherOJProblemId:"",REMOTE_OJ:{},displayId:""}},mounted:function(){this.init()},computed:Object(n.a)({},Object(s.c)(["userInfo","isSuperAdmin","isProblemAdmin"])),methods:{init:function(){this.routeName=this.$route.name,this.trainingId=this.$route.params.trainingId,this.getProblemList(this.currentPage),this.REMOTE_OJ=Object.assign({},r.h)},goEdit:function(t){this.$router.push({name:"admin-edit-problem",params:{problemId:t}})},currentChange:function(t){this.currentPage=t,this.getProblemList(t)},onPageSizeChange:function(t){this.pageSize=t,this.getProblemList(this.currentPage)},getProblemList:function(){var t=this,e=0<arguments.length&&void 0!==arguments[0]?arguments[0]:1;this.loading=!0,e={limit:this.pageSize,currentPage:e,keyword:this.keyword,tid:this.trainingId,queryExisted:!0};0!=this.problemListAuth&&(e.auth=this.problemListAuth),a.a.admin_getTrainingProblemList(e).then((function(e){t.loading=!1,t.total=e.data.data.problemList.total,t.problemList=e.data.data.problemList.records,t.trainingProblemMap=e.data.data.trainingProblemMap}),(function(e){t.loading=!1}))},handleChangeRank:function(t){var e=this;a.a.admin_updateTrainingProblem(t).then((function(t){l.a.success(e.$i18n.t("m.Update_Successfully")),e.getProblemList(1)}))},changeProblemAuth:function(t){var e=this;a.a.admin_changeProblemAuth(t).then((function(t){l.a.success(e.$i18n.t("m.Update_Successfully"))}))},deleteProblem:function(t){var e=this;this.$confirm(this.$i18n.t("m.Delete_Problem_Tips"),"Tips",{type:"warning"}).then((function(){a.a.admin_deleteTrainingProblem(t,null).then((function(t){l.a.success(e.$i18n.t("m.Delete_successfully")),e.getProblemList(e.currentPage)})).catch((function(){}))}),(function(){}))},removeProblem:function(t){var e=this;this.$confirm(this.$i18n.t("m.Remove_Training_Problem_Tips"),"Tips",{type:"warning"}).then((function(){a.a.admin_deleteTrainingProblem(t,e.trainingId).then((function(t){l.a.success("success"),e.getProblemList(e.currentPage)})).catch((function(){}))}),(function(){}))},downloadTestCase:function(t){var e=this;c.a.downloadFile("/api/file/download-testcase?pid="+t).then((function(){e.$alert(e.$i18n.t("m.Download_Testcase_Success"),"Tips")}))},filterByKeyword:function(){this.currentChange(1)},addRemoteOJProblem:function(){var t=this;this.otherOJProblemId?(this.addRemoteOJproblemLoading=!0,a.a.admin_addTrainingRemoteOJProblem(this.otherOJName,this.otherOJProblemId,this.trainingId).then((function(e){t.addRemoteOJproblemLoading=!1,t.AddRemoteOJProblemDialogVisible=!1,l.a.success(t.$i18n.t("m.Add_Successfully")),t.currentChange(1)}),(function(e){t.addRemoteOJproblemLoading=!1}))):l.a.error(this.$i18n.t("m.Problem_ID_is_required"))}},watch:{$route:function(t,e){t.params.trainingId==e.params.trainingId&&t.name==e.name||this.init()}}},i("ca57"),n=i("cba8"),s=Object(n.a)(o,(function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",[i("el-card",[i("div",{attrs:{slot:"header"},slot:"header"},[i("span",{staticClass:"panel-title home-title"},[t._v(t._s(t.$t("m.Training_Problem_List")))]),i("div",{staticClass:"filter-row"},[i("span",[i("el-button",{attrs:{icon:"el-icon-plus",size:"small",type:"primary"},on:{click:function(e){t.addProblemDialogVisible=!0}}},[t._v(t._s(t.$t("m.Add_From_Public_Problem"))+" ")])],1),i("span",[i("el-button",{attrs:{icon:"el-icon-plus",size:"small",type:"success"},on:{click:function(e){t.AddRemoteOJProblemDialogVisible=!0}}},[t._v(t._s(t.$t("m.Add_Remote_OJ_Problem"))+" ")])],1),i("span",[i("vxe-input",{attrs:{placeholder:t.$t("m.Enter_keyword"),size:"medium",type:"search"},on:{"search-click":t.filterByKeyword},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.filterByKeyword.apply(null,arguments)}},model:{value:t.keyword,callback:function(e){t.keyword=e},expression:"keyword"}})],1)])]),i("vxe-table",{ref:"adminProblemList",attrs:{data:t.problemList,loading:t.loading,align:"center","auto-resize":"",stripe:""}},[i("vxe-table-column",{attrs:{field:"id","min-width":"64",title:"ID"}}),i("vxe-table-column",{attrs:{title:t.$t("m.Display_ID"),field:"problemId","min-width":"100"}}),i("vxe-table-column",{attrs:{title:t.$t("m.Title"),field:"title","min-width":"150","show-overflow":""}}),i("vxe-table-column",{attrs:{title:t.$t("m.Author"),field:"author","min-width":"100","show-overflow":""}}),i("vxe-table-column",{attrs:{title:t.$t("m.Training_Problem_Rank"),"min-width":"200"},scopedSlots:t._u([{key:"default",fn:function(e){var n=e.row;return[i("el-input-number",{attrs:{max:2147483647,min:0},on:{change:function(e){return t.handleChangeRank(t.trainingProblemMap[n.id])}},model:{value:t.trainingProblemMap[n.id].rank,callback:function(e){t.$set(t.trainingProblemMap[n.id],"rank",e)},expression:"trainingProblemMap[row.id].rank"}})]}}])}),i("vxe-table-column",{attrs:{title:t.$t("m.Auth"),"min-width":"120"},scopedSlots:t._u([{key:"default",fn:function(e){var n=e.row;return[i("el-select",{attrs:{disabled:!t.isSuperAdmin&&!t.isProblemAdmin,size:"small"},on:{change:function(e){return t.changeProblemAuth(n)}},model:{value:n.auth,callback:function(e){t.$set(n,"auth",e)},expression:"row.auth"}},[i("el-option",{attrs:{disabled:!t.isSuperAdmin&&!t.isProblemAdmin,label:t.$t("m.Public_Problem"),value:1}}),i("el-option",{attrs:{label:t.$t("m.Private_Problem"),value:2}}),i("el-option",{attrs:{disabled:!0,label:t.$t("m.Contest_Problem"),value:3}})],1)]}}])}),i("vxe-table-column",{attrs:{"min-width":"200",title:"Option"},scopedSlots:t._u([{key:"default",fn:function(e){var n=e.row;return[t.isSuperAdmin||t.isProblemAdmin||n.author==t.userInfo.username?i("el-tooltip",{attrs:{content:t.$t("m.Edit"),effect:"dark",placement:"top"}},[i("el-button",{attrs:{icon:"el-icon-edit-outline",size:"mini",type:"primary"},nativeOn:{click:function(e){return t.goEdit(n.id)}}})],1):t._e(),t.isSuperAdmin||t.isProblemAdmin?i("el-tooltip",{attrs:{content:t.$t("m.Download_Testcase"),effect:"dark",placement:"top"}},[i("el-button",{attrs:{icon:"el-icon-download",size:"mini",type:"success"},nativeOn:{click:function(e){return t.downloadTestCase(n.id)}}})],1):t._e(),i("el-tooltip",{attrs:{content:t.$t("m.Remove"),effect:"dark",placement:"top"}},[i("el-button",{attrs:{icon:"el-icon-close",size:"mini",type:"warning"},nativeOn:{click:function(e){return t.removeProblem(n.id)}}})],1)]}}])})],1),i("div",{staticClass:"panel-options"},[i("el-pagination",{staticClass:"page",attrs:{"page-size":t.pageSize,"page-sizes":[10,30,50,100],total:t.total,layout:"prev, pager, next, sizes"},on:{"current-change":t.currentChange,"size-change":t.onPageSizeChange}})],1)],1),i("el-dialog",{attrs:{title:t.$t("m.Add_Training_Problem"),visible:t.addProblemDialogVisible,width:"90%","close-on-click-modal":!1},on:{"update:visible":function(e){t.addProblemDialogVisible=e}}},[i("AddPublicProblem",{attrs:{trainingID:t.trainingId},on:{"on-change":t.getProblemList}})],1),i("el-dialog",{attrs:{title:t.$t("m.Add_Remote_OJ_Problem"),visible:t.AddRemoteOJProblemDialogVisible,width:"350px","close-on-click-modal":!1},on:{"update:visible":function(e){t.AddRemoteOJProblemDialogVisible=e}}},[i("el-form",[i("el-form-item",{attrs:{label:t.$t("m.Remote_OJ")}},[i("el-select",{attrs:{size:"small"},model:{value:t.otherOJName,callback:function(e){t.otherOJName=e},expression:"otherOJName"}},t._l(t.REMOTE_OJ,(function(t,e){return i("el-option",{key:e,attrs:{label:t.name,value:t.key}})})),1)],1),i("el-form-item",{attrs:{label:t.$t("m.Problem_ID"),required:""}},[i("el-input",{attrs:{size:"small"},model:{value:t.otherOJProblemId,callback:function(e){t.otherOJProblemId=e},expression:"otherOJProblemId"}})],1),i("el-form-item",{staticStyle:{"text-align":"center"}},[i("el-button",{attrs:{loading:t.addRemoteOJproblemLoading,icon:"el-icon-plus",type:"primary"},on:{click:t.addRemoteOJProblem}},[t._v(t._s(t.$t("m.Add"))+" ")])],1)],1)],1)],1)}),[],!1,null,"447f0d68",null);e.default=s.exports},ca57:function(t,e,i){"use strict";i("1d07")},d7ec:function(t,e,i){"use strict";i("272d")}}]);