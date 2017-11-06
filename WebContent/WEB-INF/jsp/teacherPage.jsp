<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/teacherPage.css">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/icon/天网.ico" media="screen" />

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>

<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/layui/css/layui.css">
<script src="<%=request.getContextPath()%>/layui/layui.js "></script>
<title>教师门户</title>
<script type="text/javascript">
	 $(document).ready(function () {
		 $('#createCourse').click(function() {
			 $('#courseInfo').hide();
			$('#courseShow').show();
		});
		 $('#checkCourseShow').click(function() {
			 $('#courseShow').hide();
			 $('#courseInfo').show();
			});
		 $('#esc').click(function() {
			 $('#targetup').hide();
			 $('#courseInfo').show();
			});
		 $('#false').click(function() {
			$('#torf').hide();
		});
	 });
	 //添加课程
	 function addCourse() {
		 $.ajax({
             type: "GET",
             data: {
                 "teacherMobile":$('#teacherMobile').val(),
                 "courseName": $('#courseName').val(),
		         "courseType": $('#courseType').val(),
		         "classCapacity": $('#classCapacity').val(),
		         "startTime": $('#startTime').val(),
		         "endTime": $('#endTime').val(),
		         "currentYear": $('#currentYear').val(),
		         "schoolTem": $('#schoolTem').val()
             },
             contentType: "application/json; charset=utf-8",
             async: false,
             //url不加空格！！！！！！！！！！！！！！！！！！！！！！！
             url: "<%=request.getContextPath()%>/course/insertCourse.do",
			success : function(data) {
				alert(data.message);
				window.location.reload();
			},
			error : function(data) {
				alert("????服务器异常");
			},
			dataType : "json",
		});
	}
	//跳转到班级页面，post
	function aClick(clazzId) {
		document.getElementById("asd" + clazzId).submit()
	}
</script>
</head>
<body>
	<!-- 课程二维码 -->
	<img id="target" style="width: 390px; height: 390px; display: none; z-index: 9; background-color: rgba(0, 0, 0, 1);" src="" />
		
	<div class="layui-layout layui-layout-admin">
		<!-- 头部导航 -->
		<div class="layui-header header header-demo">
			<div class="layui-main">
				<a class="CMSlogo" href="/"><span
					style="color: white; font-size: 25px;">CMS</span></a>

				<ul class="layui-nav">
					<li class="layui-nav-item"><a href="">控制台<span
							class="layui-badge">9</span></a></li>
					<li class="layui-nav-item"><a href="">个人中心<span
							class="layui-badge-dot"></span></a></li>
					<li class="layui-nav-item"><a href="#">${teacher.teacherName}老师</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">修改信息</a>
							</dd>
							<dd>
								<a href="javascript:;">安全管理</a>
							</dd>
							<dd>
								<a href="javascript:;">注销</a>
							</dd>
						</dl></li>
				</ul>

			</div>
		</div>
		<!-- 左侧垂直导航 -->
		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:;">默认展开</a>
						<dl class="layui-nav-child">
							<dd>
								<a id="checkCourseShow" href="#">课程信息</a>
							</dd>
							<dd>
								<a id="createCourse" href="#">新建课程</a>
							</dd>
							<dd>
								<a href="">跳转</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="">移动模块</a>
							</dd>
							<dd>
								<a href="">后台模版</a>
							</dd>
							<dd>
								<a href="">电商平台</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="">产品</a></li>
					<li class="layui-nav-item"><a href="">大数据</a></li>
				</ul>
			</div>
		</div>

		<!-- 内容显示 -->
		<div class="layui-body site-demo">
			<br />
			<!-- 新建课程 -->
			<div class="site-text site-block" id="courseShow"
				style="display: none;">
				<form class="layui-form" action="">
					<div class="layui-form-item">
						<label class="layui-form-label">课程名称</label>
						<div class="layui-input-block">
							<input id="courseName" type="text" name="courseName" required
								lay-verify="required" placeholder="请输入课程名称" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<input type="text" id="teacherMobile" name="teacher.teacherMobile"
						value="${teacher.teacherMobile}" style="display: none;" />
					<div class="layui-form-item">
						<label class="layui-form-label">课程类型</label>
						<div class="layui-input-block">
							<input id="courseType" type="radio" name="courseType" value="必修"
								title="必修" checked> <input id="courseType" type="radio"
								name="courseType" value="选修" title="选修">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">班级容量</label>
						<div class="layui-input-block">
							<input id="classCapacity" type="text" name="classCapacity"
								required lay-verify="required" placeholder="请输入班级容量"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">开始时间</label>
							<div class="layui-input-inline">
								<input class="layui-input" id="startTime" type="text"
									name="startTime" placeholder="yyyy-MM-dd">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">结束时间</label>
							<div class="layui-input-inline">
								<input class="layui-input" id="endTime" type="text"
									name="endTime" placeholder="yyyy-MM-dd">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">当前学年</label>
							<div class="layui-input-inline">
								<input class="layui-input" id="currentYear" type="text"
									name="currentYear" placeholder="yyyy">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">当前学期</label>
						<div class="layui-input-block">
							<select id="schoolTem" name="schoolTem" lay-verify="required">
								<option value=""></option>
								<option value="春季">春季学期</option>
								<option value="夏季">夏季学期</option>
								<option value="秋季">秋季学期</option>
								<option value="冬季">冬季学期</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<input id="subButton" class="layui-btn" onclick="addCourse()"
								type="button" value="提交" />
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>

				<script>
					//Demo
					layui.use([ 'form', 'laydate' ], function() {
						var form = layui.form, laydate = layui.laydate;

						//监听提交
						form.on('submit(formDemo)', function(data) {
							layer.msg(JSON.stringify(data.field));
							return false;
						});
						laydate.render({
							elem : '#startTime'
						});
						laydate.render({
							elem : '#endTime'
						});
						laydate.render({
							elem : '#currentYear',
							type : 'year'
						});

					});
				</script>
			</div>
			

			<!-- 课程信息 -->
			<div class="layui-form sessiontable" id="courseInfo"
				style="margin-top: 5%;">
				<table class="layui-table" lay-even style="text-align: center;">
					<colgroup>
						<col width="200">
						<col width="200">
						<col width="150">
						<col width="150">
						<col width="300">
					</colgroup>
					<thead>
						<tr>
							<th style="text-align: center;">课程名称</th>
							<th style="text-align: center;">二维码信息</th>
							<th style="text-align: center;">学年</th>
							<th style="text-align: center;">班级</th>
							<th colspan="3" style="text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${! empty courses}">
								<c:forEach items="${courses}" var="r">
									<tr id="abs${r.courseId}">
										<td><a
   							     href="<%=request.getContextPath()%>/course/forsearchClazz.do?courseId=${r.courseId}">${r.courseName}</a></td>
										<td style="text-align: center;">
									    	<div class="site-demo-button" id="layerDemo">
												<button id="${r.qrImg}" onclick="showQrImg(this.id)" class="layui-btn" data-method="page">照片</button>
											</div>										
										</td>
										<td style="text-align: center;">${r.currentYear}</td>
										<td style="text-align: center;"><c:choose>
												<c:when test="${! empty r.clazz}">
													<c:forEach items="${r.clazz}" var="c">
														<form style="margin-top: 0; margin-bottom: 0;"
															id="asd${c.clazzId}"
															action="<%=request.getContextPath()%>/student/selectStudentByClazzId.do"
															method="post">
															<input name="clazzId" style="display: none;"
																value="${c.clazzId}" /> <a id="${c.clazzId}"
																onclick="aClick(this.id)" href="#">${c.clazzName}</a>
														</form>
														<br />
													</c:forEach>
												</c:when>
												<c:otherwise>
													<a>（空）</a>
												</c:otherwise>
											</c:choose></td>
										<td style="text-align: center;"><a
											href="<%=request.getContextPath()%>/course/forsearchClazz.do?courseId=${r.courseId}&teacherMobile=${teacher.teacherMobile}">查看/签到</a></td>
										<td>
										<!-- <a href="/course/forChangeCousrInfo.do?courseId=${r.courseId}">修改</a> -->
										 <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
				                         <button  class="layui-btn" >修改</button>
                                          </div>
										</td>
										<td>
										 <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
				                         <button id="${r.courseId}" onclick="forDeleteThis(this.id)" class="layui-btn" data-method="notice">删除</button>
                                          </div>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7">（空）</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				
				<script>
				layui.use('table', function() {
					var table = layui.table;
				});
			    </script>
			</div>				
		</div>
				
	</div>

      

	<script>
	//url
	 function showQrImg(id) {
	     var url = "/ClassManageSys/qrImg/" + id + ".gif";
		     var imgPre = document.getElementById("target");
//		     imgPre.style.display = "block";
		     imgPre.src = url;
//		    alert(imgPre.src);
//		     $('#courseInfo').hide();
//		     $('#targetup').show();
	}

	 var tem;
	 function forDeleteThis(courseId) {
		 var courseId = courseId;
		 tem = courseId;
		 //document.getElementById("torf").style.display = "block";
	}
	 function deleteThis() {
		 var Id = tem;
		 lookApplyPeople(Id); 
	}
	 
	 //删除课程
	  function lookApplyPeople(courseId) {
          $.ajax({
              type: "GET",
              data: {
                  "courseId": courseId
              },
              contentType: "application/json; charset=utf-8",
              async: true,
              url: "<%=request.getContextPath()%>/course/deleteCourseById.do",
//              beforeSend:function(){$("#href").html("等待..");},
              success: function (data) {
            	  document.getElementById("abs"+tem).style.display = "none";
              },
              error: function (data) {
                  alert("出错了！");
              },
              dataType: "json",
          });
          $('#torf').hide();
      }
	 
		layui.use(['element','layer'], function() {
			var element = layui.element
			,$ = layui.jquery
			,layer = layui.layer; 
             
			//触发事件
			  var active = {
			    notice: function(){
			      //示范一个公告层
			      layer.open({
			        type: 1
			        ,title: false //不显示标题栏
			        ,closeBtn: false
			        ,area: '300px;'
			        ,shade: 0.8
			        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
			        ,btn: ['删除', '取消']
			        ,yes: function(index, layero){
			        	deleteThis();
			        	layer.closeAll();
			        }
			        ,btn2: function(index, layero){
			            //按钮【按钮二】的回调
			        }
			        ,btnAlign: 'c'
			        ,moveType: 1 //拖拽模式，0或者1
			        ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">确定删除该课程？</div>'
			      });
			    }		   
			    ,page: function(){
			    	layer.open({
			    		  type: 1,
			    		  title: false,
			    		  closeBtn: 0,
			    		  area: '390px',
			    		  skin: 'layui-layer-lan', //没有背景色
			    		  shadeClose: true,
			    		  content: $('#target')
			    		});
			    }
			
			
			  };

			  $('#layerDemo .layui-btn').on('click', function(){
			    var othis = $(this), method = othis.data('method');
			    active[method] ? active[method].call(this, othis) : '';
			  });

			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
	</script>
</body>
</html>