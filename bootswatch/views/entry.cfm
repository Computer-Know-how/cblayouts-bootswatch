<cfoutput>
<div class="row-fluid">
	<div class="span9">
		<!--- ContentBoxEvent --->
		#cb.event("cbui_preEntryDisplay")#

		<!--- top gap --->
		<div class="post-top-gap"></div>

		<!--- post --->
		<div class="post" id="post_#prc.entry.getContentID()#">

			<!--- Date --->
			<div class="post-date" title="Posted on #prc.entry.getDisplayPublishedDate()#">
				<span class="post-month">#dateFormat(prc.entry.getPublishedDate(),"MMM")#</span>
				<span class="post-day">#dateFormat(prc.entry.getPublishedDate(),"dd")#</span>
			</div>

			<!--- Title --->
			<div class="post-title">

				<!--- content Author --->
				<div class="post-content-author">
					#cb.quickAvatar(author=prc.entry.getAuthorEmail(),size=30)# #prc.entry.getAuthorName()#
				</div>

				<!--- Title --->
				<h2><a href="#cb.linkEntry(prc.entry)#" rel="bookmark" title="#prc.entry.getTitle()#">#prc.entry.getTitle()#</a></h2>

				<!--- Category Bar --->
				<span class="post-cat"><i class="icon-tag"></i> #cb.quickCategoryLinks(prc.entry)#</span>

				<!--- content --->
				<div class="post-content">
					#prc.entry.renderContent()#
				</div>
			</div>

			<!--- Comments Bar --->
			#html.anchor(name="comments")#
			<div class="post-comments">
				<div class="infoBar">
					<cfif NOT cb.isCommentsEnabled(prc.entry)>
					<i class="icon-warning-sign icon-2x"></i>
					Comments are currently closed
					<cfelse>
					<button class="button2" onclick="toggleCommentForm()"><i class="icon-comments"></i> Add Comment (#prc.entry.getNumberOfApprovedComments()#)</button>
					</cfif>
				</div>
			</div>

			<!--- Separator --->
			<div class="separator"></div>

			<!--- Comment Form: I can build it or I can quick it? --->
			<div id="commentFormShell">
			#cb.quickCommentForm(prc.entry)#
			</div>

			<div class="clr"></div>

			<!--- Display Comments --->
			<div id="comments">
				#cb.quickComments()#
			</div>

		</div>

		<!--- ContentBoxEvent --->
		#cb.event("cbui_postEntryDisplay")#

	</div>

	<div class="span3">
		<div class="well">
			#cb.quickView(view='_blogsidebar')#
		</div>
	</div>
</div>

<!--- Custom JS --->
<script type="text/javascript">
	$(document).ready(function() {
	 	// form validator
		$("##commentForm").validator({position:'top left'});
		<cfif cb.isCommentFormError()>
		toggleCommentForm();
		</cfif>
	});
	function toggleCommentForm(){
		$("##commentForm").slideToggle();
	}
</script>
</cfoutput>