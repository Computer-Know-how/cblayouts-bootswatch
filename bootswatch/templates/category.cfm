<cfoutput>
<div class="categoryList">
	<!--- Mini RSS --->
	<a class="floatRight" href="#cb.linkRSS(category=category)#" title="RSS Feed For #category.getCategory()#"><i class="icon-rss"></i></a>
	<!--- Category --->
	<i class="icon-tag"></i>
	<a href="#cb.linkCategory(category)#" title="Filter by #category.getCategory()#">#category.getCategory()# (#category.getNumberOfEntries()#)</a>
</div>
</cfoutput>