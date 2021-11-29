function addRowHandlers() {
    var table = document.getElementById('TicketTable')
    var rows = table.getElementsByTagName('tr')
    for (i = 0; i < rows.length; i++) {
        var currentRow = table.rows[i]
        var createClickHandler = function(row) {
            return function() {
                var cell = row.getElementsByTagName('td')[0]
                var id = cell.innerHTML
                alert('id:' + id)
            }
        }

        currentRow.onclick = createClickHandler(currentRow)
    }
}
// window.onload = addRowHandlers()

if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href)
}

function openForm(i) {
    document.getElementById('form-' + i).style.display = 'block'
}

function closeForm(i) {
    document.getElementById('form-' + i).style.display = 'none'
}