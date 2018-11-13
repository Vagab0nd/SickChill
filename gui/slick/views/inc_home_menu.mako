<%!
    import sickbeard
%>
<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 tex-center">
        <div class="text-center">
            % if sickbeard.HOME_LAYOUT == 'poster':
                <span class="show-option">
                    <input id="filterShowName" class="form-control form-control-inline input-sm input200" type="search" placeholder="${_('Filter Show Name')}">
                </span>
            % endif
            % if sickbeard.ROOT_DIRS:
                <span class="show-option">${_('Root')}:</span>
                <label>
                    <form method="post" action="" id="rootDirForm">
                        <select id="rootDirSelect" name="root" class="form-control form-control-inline input200" title="Root Select">
                        <option value="-1" ${('', 'selected="selected"')[selected_root == '-1']}>${_('All')}</option>
                        % for root_dir in sickbeard.ROOT_DIRS.split('|')[1:]:
                            <option value="${loop.index}" ${('', 'selected="selected"')[selected_root == str(loop.index)]}>${loop.index}</option>
                        % endfor
                        </select>
                    </form>
                </label>
            % endif
            % if sickbeard.HOME_LAYOUT != 'poster':
                <span class="show-option">
                    <button type="button" class="resetsorting btn btn-inline">${_('Clear Filter(s)')}</button>
                </span>
                <span class="show-option">
                    <button id="popover" type="button" class="btn btn-inline">${_('Select Columns')} <b class="caret"></b></button>
                </span>
            % endif
            <label>
                <span class="show-option">${_('Layout')}:</span>
                <select name="layout" class="form-control form-control-inline input-sm" onchange="location = this.options[this.selectedIndex].value;" title="Layout">
                    <option value="${srRoot}/setHomeLayout/?layout=poster" ${('', 'selected="selected"')[sickbeard.HOME_LAYOUT == 'poster']}>${_('Poster')}</option>
                    <option value="${srRoot}/setHomeLayout/?layout=small" ${('', 'selected="selected"')[sickbeard.HOME_LAYOUT == 'small']}>${_('Small Poster')}</option>
                    <option value="${srRoot}/setHomeLayout/?layout=banner" ${('', 'selected="selected"')[sickbeard.HOME_LAYOUT == 'banner']}>${_('Banner')}</option>
                    <option value="${srRoot}/setHomeLayout/?layout=simple" ${('', 'selected="selected"')[sickbeard.HOME_LAYOUT == 'simple']}>${_('Simple')}</option>
                </select>
            </label>
            % if sickbeard.HOME_LAYOUT == 'poster':
                <label>
                    <span class="show-option">${_('Sort By')}:</span>
                    <select id="postersort" class="form-control form-control-inline input-sm" title="Poster Sort">
                        <option value="name" data-sort="${srRoot}/setPosterSortBy/?sort=name" ${('', 'selected="selected"')[sickbeard.POSTER_SORTBY == 'name']}>${_('Name')}</option>
                        <option value="date" data-sort="${srRoot}/setPosterSortBy/?sort=date" ${('', 'selected="selected"')[sickbeard.POSTER_SORTBY == 'date']}>${_('Next Episode')}</option>
                        <option value="network" data-sort="${srRoot}/setPosterSortBy/?sort=network" ${('', 'selected="selected"')[sickbeard.POSTER_SORTBY == 'network']}>${_('Network')}</option>
                        <option value="progress" data-sort="${srRoot}/setPosterSortBy/?sort=progress" ${('', 'selected="selected"')[sickbeard.POSTER_SORTBY == 'progress']}>${_('Progress')}</option>
                    </select>
                </label>

                ##<label>
                ##    <span class="show-option">${_('Direction')}:</span>
                ##    <select id="postersortdirection" class="form-control form-control-inline input-sm" title="Sort">
                ##        <option value="true" data-sort="${srRoot}/setPosterSortDir/?direction=1" ${('', 'selected="selected"')[sickbeard.POSTER_SORTDIR == 1]}>${_('Ascending')} </option>
                ##        <option value="false" data-sort="${srRoot}/setPosterSortDir/?direction=0" ${('', 'selected="selected"')[sickbeard.POSTER_SORTDIR == 0]}>${_('Descending')}</option>
                ##    </select>
                ##</label>
                ##<label>
                ##    <span class="show-option">${_('Status Filter')}:</span>
                ##    <button id="popover" type="button" class="btn pull-right" data-original-title="" title="" aria-describedby="popover633648">Select statuses <b class="caret"></b></button>
                ##    <div class="popover fade bottom in" role="tooltip" id="popover633648" style="top: 26px; left: 816.813px; display: block;">
                ##        <div class="arrow" style="left: 50%;"></div>
                ##        <h3 class="popover-title" style="display: none;"></h3>
                ##        <div class="popover-content">
                ##            <div id="popover-target">
                ##                <span class="tablesorter-column-selector">
                ##                    <label><input filter-by-status type="checkbox" value="continuing" data-filter="${srRoot}/changePosterFilterByStatus/?filter=continuing" ${('', 'class="checked"')['continuing' in sickbeard.POSTER_FILTERBY]}>${_('Continuing')}</label>
                ##                    <label><input filter-by-status type="checkbox" value="ended" data-filter="${srRoot}/changePosterFilterByStatus/?filter=ended" ${('', 'class="checked"')['ended' in sickbeard.POSTER_FILTERBY]}>${_('Ended')}</label>
                ##                    <label><input filter-by-status type="checkbox" value="paused" data-filter="${srRoot}/changePosterFilterByStatus/?filter=paused" ${('', 'class="checked"')['paused' in sickbeard.POSTER_FILTERBY]}>${_('Paused')}</label>
                ##                </span>
                ##            </div>
                ##        </div>
                ##    </div>
                ##</label>
                <label>
                    <span class="show-option">${_('Poster Size')}:</span>
                    <div style="width: 100px; display: inline-block; margin-left: 7px;" id="posterSizeSlider"></div>
                </label>
            % endif
        </div>
    </div>
</div>
