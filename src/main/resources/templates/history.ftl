<#import "layout.ftl" as layout>
<@layout.layout>
    <div id="wiki-wrapper" class="history">
        <div id="head">
            <h1>History for <strong>${page.name}</strong></h1>
            <ul class="actions">
                <li class="minibutton">
                </li>
                <li class="minibutton">
                    <a href="/${page.urlPath}" class="action-view-page">View Page</a>
                </li>
                <li class="minibutton">
                    <a href="/edit/${page.urlPath}" class="action-edit-page">Edit Page</a>
                </li>
            </ul>
        </div>
        <div id="wiki-history">
            <ul class="actions">
                <li class="minibutton">
                    <a href="javascript:void(0);" class="action-compare-revision">Compare Revisions</a>
                </li>
            </ul>

            <form name="compare-versions" id="version-form" method="post"
                  action="/compare/${page.urlPath}">
                <fieldset>
                    <table>
                        <tbody>
                            <#list page.versions as version>
                                <tr>
                                    <td class="checkbox">
                                        <input type="checkbox" name="versions[]" value="">
                                    </td>
                                    <td class="author">
                                        <a href="javascript:void(0);">
                                            <span class="username">${version.committerIdent.name}</span>
                                        </a>
                                    </td>
                                    <td class="commit-name">
                                        <span class="time-elapsed" title="">${(version.commitTime * 1000)?number_to_datetime}</span>&nbsp;
                                        ${version.shortMessage}
                                        [<a href="/${page.urlPath}/${version.id.getName()}">${version.id.getName()[0..7]}</a>]
                                    </td>
                                </tr>
                            </#list>
                        </tbody>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
</@layout.layout>