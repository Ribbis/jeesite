<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${category.name}</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${category.desciption}" />
	<meta name="keywords" content="${category.keywords}" />
</head>
<body>
	<div class="row">
	   <div class="span2">
	   	 <h4>栏目列表</h4>
		 <ol><c:forEach items="${categoryList}" var="category">
			<li><a href="${ctx}/list-${category.id}${urlSuffix}">${category.name}</a></li>
		 </c:forEach></ol>
	   </div>
	   <div class="span10">
	   	  <c:forEach items="${categoryMap}" var="map" varStatus="status">
	   	  ${status.index % 2 eq 0 ? '<div class="row">':''}
			 <div class="span5">
				<h4><small><a href="${ctx}/list-${map.key.id}${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small>${map.key.name}</h4>
				<c:if test="${map.key.module eq 'article'}">
					<ul><c:forEach items="${map.value}" var="article">
						<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}" style="color:${article.color}">${fns:abbr(article.title,40)}</a></li>
					</c:forEach></ul>
				</c:if>
				<c:if test="${map.key.module eq 'link'}">
					<ul><c:forEach items="${map.value}" var="link">
						<li><a href="${link.href}" target="_blank" style="color:${link.color}"><c:out value="${link.title}" /></a></li>
					</c:forEach></ul>
				</c:if>
			 </div>
		  ${status.index % 2 ne 0 ? '</div>':''}
		  </c:forEach>
	   </div>
	</div>
</body>
</html>
