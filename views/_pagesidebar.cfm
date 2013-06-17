<cfoutput>
<!--- ContentBoxEvent --->
#cb.event("cbui_BeforeSideBar")#

<cfset pageSidebarType = cb.layoutsetting('pageSidebarType','Tabs')>

<cfif pageSidebarType eq "Tabs">
	<ul class="nav nav-tabs nav-stacked">
		#cb.subPageMenu(page=prc.page.getParent(),type="li")#
	</ul>
<cfelseif pageSidebarType eq "List">
	<div class="well sidebar-nav">
		<ul class="nav nav-list">
			#cb.subPageMenu(page=prc.page.getParent(),type="li")#
		</ul>
	</div>
</cfif>

<!--- ContentBoxEvent --->
#cb.event("cbui_afterSideBar")#
</cfoutput>