<script type="text/javascript">
    // layers/datagrid.js
    $(function () {

        var tb = annotation.toolbarNull;
        if (annotation.canSave) {
            if (annotation.isMaster) {
                tb = annotation.toolbarMaster;
            } else if (annotation.isSenior) {
                tb = annotation.toolbarSenior;
            } else {
                tb = annotation.toolbar;
            }
        }

        annotation.setFields = function(selection, value) {
            $('#layers').datagrid('beginEdit', selection.rowIndex);
            var i = 0; var wf = ''; var word = {};
            for (field in selection.fields) {
                $('#layers').datagrid('getRows')[selection.rowIndex][field] = value;
            }
            $('#layers').datagrid('endEdit', selection.rowIndex);
            annotation.clearSelection(selection.rowIndex);
            annotation.dirtyData();
        }

        // datagrid
        var frozenColumns = [
            {{foreach $data->layers['frozenColumns'] as $column}}
        {field:{{$column['field']}}, title:{{$column['title']}} {{if $column['formatter'] != ''}},formatter:{{$column['formatter']|noescape}} {{/if}} } {{sep}},{{/sep}}
        {{/foreach}}
        ];
        var columns = [
            {{foreach $data->layers['columns'] as $column}}
        {field:{{$column['field']}},title:{{$column['title']}},hidden:{{$column['hidden']|noescape}}
            {{if $column['formatter'] != ''}},formatter:{{$column['formatter']|noescape}} {{/if}}
            {{if $column['styler'] != ''}},styler:{{$column['styler']|noescape}} {{/if}}
            {{if $column['resizable'] != ''}},resizable:{{$column['resizable']|noescape}} {{/if}}
            {{if $column['width'] != ''}},width:{{$column['width']|noescape}} {{/if}}
        } {{sep}},{{/sep}}
        {{/foreach}}
        ];

        $('#layers').datagrid({
            url:{{$manager->getURL('annotation/main/layersData')}} + "/" + {{$data->idSentence}} + "/" + {{$data->idAnnotationSet}},
            method:'get',
            collapsible:true,
            fitColumns: false,
            autoRowHeight: false,
            nowrap: true,
            rowStyler: annotation.rowStyler,
            showHeader: true,
            onBeforeSelect: function() {return false;},
            onSelect: annotation.onSelect,
            onClickCell: annotation.onClickCell,
            onRowContextMenu: annotation.onRowContextMenu,
            onHeaderContextMenu: annotation.onHeaderContextMenu,
            toolbar: tb,
            frozenColumns: [frozenColumns],
            columns: [columns],
            onLoadSuccess: function() {
                annotation.initCursor();
            }
        });

    });
</script>