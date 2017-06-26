<script type="text/javascript">
    // layers/save.js
    $(function () {

        annotation.getDataToPost = function() {
            var data = [];
            var i = 0;
            var rows = $('#layers').datagrid('getRows');
            for (r in rows) {
                var row = rows[r];
                var line = {};
                line['ni'] = {};
                for (field in row) {
                    if (field == 'ni') {
                        if (annotation.nis[row['idLayer']]) {
                            line['ni'][row['idLayer']] = {};
                            for (idLabel in annotation.nis[row['idLayer']]) {
                                line['ni'][row['idLayer']][idLabel] = {
                                    idInstantiationType: annotation.nis[row['idLayer']][idLabel]['idInstantiationType'],
                                    idSentenceWord: annotation.nis[row['idLayer']][idLabel]['idSentenceWord']
                                };
                            }
                        }
                    }
                    else {
                        line[field] = row[field];
                    }
                }
                data[i++] = line;
            }
            //console.log(data);
            return JSON.stringify(data);
        }

        annotation.checkSavedData = function() {
            console.log('checkSavedData: ' + (annotation.dataIsSaved ? 'true' : 'false'));
            if (!annotation.dataIsSaved) {
                $.messager.alert('Warning','Save your data before this operation!','warning');
                return false;
            }
            return true;
        }

        annotation.dirtyData = function () {
            console.log('dirtyData');
            annotation.dataIsSaved = false;
            $('#layersPane .datagrid-header-inner').css('background-color','#ffcccc');
        }

        annotation.cleanData = function () {
            console.log('cleanData');
            annotation.dataIsSaved = true;
            $('#layersPane .datagrid-header-inner').css('background-color','#efefef');
        }
    });
</script>