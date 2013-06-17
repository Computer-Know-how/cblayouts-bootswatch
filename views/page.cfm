<cfoutput>

	<!--- ContentBoxEvent --->
	#cb.event("cbui_prePageDisplay")#

	<!--- top gap --->
	<div class="post-top-gap"></div>

	<!--- post --->
	<div class="post" id="post_#prc.page.getContentID()#">
		<!--- Title --->
		<div class="post-title">
			<div class="shortcodes">
			<!--- Title --->
			<div class="underlined-title">
				<h2>#prc.page.getTitle()#</h2>
				<div class="text-divider5">
					<span></span>
				</div>
			</div>
			</div>

			<!--- Render Content --->
			#prc.page.renderContent()#
		</div>

		<!--- Comments Bar --->
		<cfif cb.isCommentsEnabled(prc.page)>

			#html.anchor(name="comments")#
			<div class="post-comments">
				<div class="infoBar">
					<button class="button2" onclick="toggleCommentForm()"> <i class="icon-comments"></i> Add Comment (#prc.page.getNumberOfApprovedComments()#)</button>
				</div>
				<br/>
			</div>

			<!--- Separator --->
			<div class="separator"></div>

			<!--- Comment Form: I can build it or I can quick it? --->
			<div id="commentFormShell">
			#cb.quickCommentForm(prc.page)#
			</div>

			<!--- clear --->
			<div class="clr"></div>

			<!--- Display Comments --->
			<div id="comments">
				#cb.quickComments()#
			</div>

		</cfif>

	</div>

	<!--- ContentBoxEvent --->
	#cb.event("cbui_postPageDisplay")#

	<!--- Custom JS --->
	<!---<script type="text/javascript">
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
	</script>--->
</cfoutput>