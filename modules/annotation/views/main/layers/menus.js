<script type="text/javascript">
    // layers/menus.js
    $(function () {

        annotation.onRowContextMenu = function(e, rowIndex, rowData) {
            //console.log('onRowContextMenu ' + rowIndex);
            e.preventDefault();
            var rows=$('#layers').datagrid("getRows");
            var row = rows[rowIndex];
            //if (annotation.layerType[row.idLayerType]['name'] == 'Target') {
            if (row.idLayerType == 0){
                annotation.createASMenu(rowIndex, rowData);
                annotation.ASMenu.menu('show', {
                    left:e.pageX,
                    top:e.pageY
                });
            } else if (annotation.currentSelection.rowIndex == rowIndex) {
                annotation.createContextMenu(rowIndex, rowData);
                annotation.contextMenu.menu('show', {
                    left:e.pageX,
                    top:e.pageY
                });
            }
        }

        annotation.onHeaderContextMenu = function(e, field){
            //console.log('onHeaderContextMenu ' + field);
            e.preventDefault();
            annotation.createHeaderContextMenu(field);
            annotation.headerContextMenu.menu('show', {
                left:e.pageX,
                top:e.pageY
            });
        }

        annotation.contextMenu = null;
        annotation.createContextMenu = function (rowIndex, rowData) {
            //console.log('createContextMenu ' + rowIndex);
            var menu = 'menu' + rowIndex;
            $menu = $('#' + menu);
            //console.log($menu);
            if ($menu.length == 0) {
                $("<div id='" + menu + "'/>").appendTo('body');
                $menu = $('#' + menu);
            } else {
                $menu.html('');
            }
            annotation.contextMenu = $menu;
            annotation.contextMenu.menu({
                onClick: function(item){
                    console.log('---'+item);
                    var value = (item.id == 'clear') ? '' : item.id;
                    annotation.setFields(annotation.currentSelection, value);
                }
            });
            annotation.contextMenu.menu('appendItem', {
                id: 'clear',
                text: {{_'Clear'}},
                name: 'Clear',
                iconCls: 'fa fa-undo'
            });
            var idLayer = rowData['idLayer'];
            //console.log('idLayer = ' + idLayer);
            var labels = annotation.labelTypes[idLayer];
            for(idLabelType in labels){
                //console.log(label);
                var labelType = annotation.labelTypes[idLayer][idLabelType];
                var color = annotation.rgbColors[labelType['idColor']];
                var style = 'background-color:#' + color.rgbBg + ';color:#'+ color.rgbFg + ';';
                var text = "<div style='" + style + "'>" + labelType['label'] + "</div>";
                var icon = labelType['coreType'] == '' ? 'fa fa-caret-right' : annotation.coreIcon[labelType['coreType']];
                annotation.contextMenu.menu('appendItem', {
                    id: idLabelType,
                    text: text,
                    name: labelType['label'],
                    iconCls: icon
                });
            }
        }

        annotation.headerContextMenu = null;
        annotation.createHeaderContextMenu = function (field) {
            if (!annotation.checkSavedData()) {
                return;
            }
            //console.log('createHeaderContextMenu ' + field);
            var menu = 'menu' + field;
            $menu = $('#' + menu);
            //console.log($menu);
            if ($menu.length == 0) {
                $("<div id='" + menu + "'/>").appendTo('body');
                $menu = $('#' + menu);
            } else {
                $menu.html('');
            }
            annotation.headerContextMenu = $menu;
            annotation.headerContextMenu.menu({
                onClick: function(item){
                    console.log(item);
                    if (item.id > 0) {
                        //console.log(item);
                        var wf = annotation.words[annotation.chars[item.name]['word']];
                        if (annotation.lus[item.id].mwe != '0') {
                            annotation.addMWEManualSubcorpus(wf, item.id, annotation.idSentence);
                        } else {
                            annotation.addManualSubcorpus(item.id, annotation.idSentence, wf.startChar, wf.endChar);
                        }
                        //console.log(wf);
                    }
                }
            });
            var wf = annotation.words[annotation.chars[field]['word']];
            $.ajax({
                type: "POST",
                url: {{$manager->getURL('annotation/main/headerMenu')}},
                data: {wordform: wf.word},
                dataType: "json",
                success: function (data, textStatus, jqXHR) {
                    //console.log('success');
                    if (jQuery.isEmptyObject(data)) {
                        annotation.headerContextMenu.menu('appendItem', {
                            id: 0,
                            text: '** No matching lemma **',
                            name: '0',
                            iconCls: 'fa fa-caret-right'
                        });
                    } else {
                        console.log(data);
                        jQuery.each(data, function (i, lu) {
                            console.log(lu);
                            annotation.lus[lu.idLU] = lu;
                            annotation.headerContextMenu.menu('appendItem', {
                                id: lu.idLU,
                                text: lu.fullName,
                                name: field,
                                iconCls: 'fa fa-caret-right'
                            });
                        });
                    }
                },
            });
        }

        annotation.ASMenu = null;
        annotation.createASMenu = function (rowIndex, rowData) {
            //console.log('createASMenu ' + rowIndex);
            var menu = 'menu' + rowData['idLayer'];
            $menu = $('#' + menu);
            //console.log($menu);
            if ($menu.length == 0) {
                $("<div id='" + menu + "'/>").appendTo('body');
                $menu = $('#' + menu);
            } else {
                $menu.html('');
            }
            annotation.ASMenu = $menu;
            annotation.ASMenu.menu({
                onClick: function(item){
                    //console.log(item);
                    var data = {idAnnotationSet: item.name, idSentence: annotation.idSentence};
                    if (item.id == 'addFE') {
                        $.ajax({type: "POST", url: {{$manager->getURL('annotation/main/addFELayer')}}, data: data, dataType: "json",
                           success: function (data) {
                                for (item in data) {
                                    if (annotation.layers[item] === undefined) {
                                        annotation.layers[item] = data[item];
                                    }
                                }
                            }
                        });
                        $.ajax({type: "POST", url: {{$manager->getURL('annotation/main/getFELabels')}}, data: data, dataType: "json",
                            success: function (data) {
                                for (item in data) {
                                    if (annotation.labelTypes[item] === undefined) {
                                        annotation.labelTypes[item] = data[item];
                                    }
                                }
                            }
                        });
                    } else if (item.id == 'delFE') {
                        $.ajax({type: "POST", url: {{$manager->getURL('annotation/main/delFELayer')}}, data: data, dataType: "json"});
                    }
                    $('#layers').datagrid('reload');
                }
            });
            annotation.ASMenu.menu('appendItem', {
                id: 'addFE',
                text: 'Add FE Layer',
                name: rowData['idAnnotationSet'],
                iconCls: 'fa fa-caret-right'
            });
            annotation.ASMenu.menu('appendItem', {
                id: 'delFE',
                text: 'Delete Last FE Layer',
                name: rowData['idAnnotationSet'],
                iconCls: 'fa fa-caret-right'
            });
        }

    });
</script>