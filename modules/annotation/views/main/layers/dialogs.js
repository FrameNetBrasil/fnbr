<script type="text/javascript">
    // layers/dialog.js
    $(function () {

        annotation.dlgNISave = function() {
            //console.log('NI onClose');
            var nis = annotation.nis;//{};
            var rows=$('#pg').propertygrid("getRows");
            var idLayer = 0;
            //console.log(rows);
            var idLayer = $('#pg').propertygrid("options").idLayer;
            //console.log(idLayer);
            //console.log(nis);
            nis[idLayer] = {};
            for(index in rows) {
                var row = rows[index];
                idLayer = row.idLayer;
                //console.log(row);
                //nis[row.idLayer] = {};
                if ((row.value !== '') && (row.value != '0')) {
                    //console.log('[' + row.value + ']');
                    //console.log(row.name);
                    var idLabel = row.name;
                    //console.log(idLabel);
                    //console.log(annotation.labelTypes[row.idLayer][idLabel]);
                    nis[row.idLayer] = nis[row.idLayer] || {};
                    nis[row.idLayer][idLabel] = {
                        fe: annotation.labelTypes[row.idLayer][idLabel]['label'],
                        idInstantiationType: row.value,
                        label: annotation.instantiationTypeObj[row.value],
                        //idSentenceWord:  annotation.niFields[row.idLayer].substr(2),
                        idColor: annotation.labelTypes[row.idLayer][idLabel]['idColor']
                    };
                }
            }
            //console.log(nis);
            var rowIndex = annotation.currentSelection.rowIndex;
            //console.log('rowIndex = ' + rowIndex);

            $('#layers').datagrid('beginEdit', rowIndex);
            annotation.nis = nis;
            $('#layers').datagrid('getRows')[rowIndex]['ni'] = '';
            $('#layers').datagrid('endEdit', rowIndex);
            $('#layers').datagrid('autoSizeColumn','ni');
            annotation.dirtyData();
        }

        annotation.dlgASOpen = function() {
            var data = [];
            var i = 0;
            for (as in annotation.annotationSets) {
                data[i++] = annotation.annotationSets[as];
            }
            $('#asGrid').datagrid({data: data});
            var rows = $('#asGrid').datagrid('getRows');
            for (r in rows) {
                if (!annotation.annotationSets[rows[r].idAnnotationSet].show) {
                    $('#asGrid').datagrid('checkRow', r);
                }
            }
            $('#dlgAS').dialog('doLayout');
            $('#dlgAS').dialog('open');
            annotation.pushTopDialog('#dlgAS');
        }

        annotation.dlgASSave = function() {
            for (as in annotation.annotationSets) {
                annotation.annotationSets[as].show = true;
            }
            var rowsChecked = $('#asGrid').datagrid('getChecked');
            for (c in rowsChecked) {
                var idAnnotationSet = rowsChecked[c].idAnnotationSet;
                annotation.annotationSets[idAnnotationSet].show = false;
            }
            var rows = $('#layers').datagrid('getRows');
            for (r in rows) {
                rows[r].show = annotation.annotationSets[rows[r].idAnnotationSet].show;
                $('#layers').datagrid('refreshRow', r);
            }
        }

        annotation.dlgASOpenRemove = function() {
            if (!annotation.checkSavedData()) {
                return;
            }
            var data = [];
            var i = 0;
            for (as in annotation.annotationSets) {
                data[i++] = annotation.annotationSets[as];
            }
            $('#asGridRemove').datagrid({data: data});
            var rows = $('#asGridRemove').datagrid('getRows');
            for (r in rows) {
                if (!annotation.annotationSets[rows[r].idAnnotationSet].show) {
                    $('#asGridRemove').datagrid('checkRow', r);
                }
            }
            $('#dlgASRemove').dialog('doLayout');
            $('#dlgASRemove').dialog('open');
            annotation.pushTopDialog('#dlgASRemove');
        }

        annotation.dlgASSaveRemove = function() {
            var AStoRemove = {};
            var rowsChecked = $('#asGridRemove').datagrid('getChecked');
            for (c in rowsChecked) {
                var idAnnotationSet = rowsChecked[c].idAnnotationSet;
                console.log(idAnnotationSet);
                AStoRemove[idAnnotationSet] = idAnnotationSet;
            }
            $.ajax({
                type: "POST",
                url: {{$manager->getURL('annotation/main/deleteAS')}},
                data: {AStoDelete: 'json:' + JSON.stringify(AStoRemove)},
                dataType: "json",
                async: false
            });
            $('#layersPane').html('');
            manager.doGet({{$manager->getURL('annotation/main/layers')}} + '/' + annotation.idSentence + '/' + annotation.idAnnotationSet, 'layersPane');
        }

        annotation.dlgASCommentsSave = function() {
            manager.doPost('', {{$manager->getURL('annotation/main/saveASComments')}}, 'formASComments');
            $('#dlgASComments').dialog('close');
        }


        annotation.dlgCxnOpen = function() {
            $('#cxnGrid').datagrid({singleSelect:true, url: {{$manager->getURL('annotation/main/cxnGridData')}}});
            $('#dlgCxn').dialog('doLayout');
            $('#dlgCxn').dialog('open');
        }

        annotation.dlgCxnClose = function() {
            if (!annotation.checkSavedData()) {
                return;
            }
            var selected = $('#cxnGrid').datagrid('getSelected');
            //console.log(selected);
            $.ajax({
                type: "POST",
                url: {{$manager->getURL('annotation/main/addManualSubcorpus')}},
            data: {idConstruction: selected.idConstruction, idSentence: annotation.idSentence},
            dataType: "json",
                    async: false,
        });
            $('#layersPane').html('');
            manager.doGet({{$manager->getURL('annotation/main/layers')}} + '/' + annotation.idSentence + '/' + annotation.idAnnotationSet, 'layersPane');
        }

        annotation.dlgValidationOpen = function() {
            $('#dlgValidation').dialog('doLayout');
            $('#dlgValidation').dialog('open');
        }

        annotation.ASComments = function (idAnnotationSet) {
            console.log('----' + idAnnotationSet);
            annotation.idASComments = idAnnotationSet;
            $('#dlgASComments').dialog({href: {{$manager->getURL('annotation/main/formASComments')}} + "/" + annotation.idASComments });
            $('#dlgASComments').dialog('doLayout');
            $('#dlgASComments').dialog('open');
        }

        annotation.showMessage = function(element, msg) {
            if (!element.children("div.datagrid-mask").length) {
                $("<div class=\"datagrid-mask\" style=\"display:block\"></div>").appendTo(element);
                var msg = $("<div class=\"datagrid-mask-msg\" style=\"display:block;left:50%\"></div>").html(msg).appendTo(element);
                msg._outerHeight(40);
                msg.css({marginLeft: (-msg.outerWidth() / 2), lineHeight: (msg.height() + "px")});
            }
        }

        annotation.hideMessage = function(element) {
            element.children("div.datagrid-mask-msg").remove();
            element.children("div.datagrid-mask").remove();
        }

        annotation.pushTopDialog = function (element) {
            annotation.topDialog = element;
        }

        annotation.popTopDialog = function () {
            annotation.topDialog = '';
        }


    });
</script>