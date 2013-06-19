<cfoutput>
<!--- post --->
<div class="post" id="post_#entry.getContentID()#">

	<!--- Date --->
	<div class="post-date" title="Posted on #entry.getDisplayPublishedDate()#">
		<span class="post-month">#dateFormat(entry.getPublishedDate(),"MMM")#</span>
		<span class="post-day">#dateFormat(entry.getPublishedDate(),"dd")#</span>
	</div>

	<!--- Title --->
	<div class="post-title">

		<!--- content Author --->
		<div class="post-content-author">
			#cb.quickAvatar(author=entry.getAuthorEmail(),size=30)# #entry.getAuthorName()#
		</div>

		<!--- Title --->
		<h2><a href="#cb.linkEntry(entry)#" rel="bookmark" title="#entry.getTitle()#">#entry.getTitle()#</a></h2>

		<!--- Category Bar --->
		<span class="post-cat"><i class="icon-tag"></i> #cb.quickCategoryLinks(entry)#</span>

		<!--- content --->
		<div class="post-content">
			<!--- excerpt or content --->
			<cfif entry.hasExcerpt()>
				#entry.getExcerpt()#
				<div class="post-more">
					<a href="#cb.linkEntry(entry)#" title="Read The Full Entry!"><button class="button2">Read More...</button></a>
				</div>
			<cfelse>
				#entry.renderContent()#
			</cfif>
		</div>

	</div>

	<!--- Comments Bar --->
	<div class="post-comments">
		<!--- <div class="infoBar"> --->
			<cfif NOT cb.isCommentsEnabled(entry)>
			<i class="icon-warning-sign icon-2x"></i>
			Comments are currently closed
			<cfelse>
			<a href="#cb.linkEntry(entry)###comments" title="View Comments"><i class="icon-comments icon-2x"></i> #entry.getNumberOfApprovedComments()#</a>
			</cfif>
		<!--- </div> --->
	</div>

	<div class="separator"></div>
</div>
</cfoutput>