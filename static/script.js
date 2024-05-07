document.getElementById('formForInserting').addEventListener('submit', function(action) {
    action.preventDefault();

    const kitapData = {
        kitap_name: document.getElementById('kitap_name').value,
        writer: document.getElementById('writer').value,
        release_date: parseInt(document.getElementById('release_date').value, 10),
        issuer: document.getElementById('issuer').value,
        pages: parseInt(document.getElementById('pages').value, 10)
    };

    fetch('/kitaps', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(kitapData)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Ответ сети неправильный:  ' + response.statusText);
        }
        return response.json();
    })
    .then(data => {
        console.log('Круто , получилось!:', data);
        appendKitapToList(data);
    })
    .catch((error) => {
        console.error('Не получилось добавить книгу(:', error);
    });
});

function appendKitapToList(kitap) {
    const list = document.getElementById('kitapList');
    const listItem = document.createElement('li');
    listItem.textContent = `${kitap.kitap_name} by ${kitap.writer}, published in ${kitap.release_date} by ${kitap.issuer}, ${kitap.pages} pages`;
    list.appendChild(listItem);
}

function loadKitapsFromServer() {
    fetch('/kitaps')
    .then(response => response.json())
    .then(kitaps => {
        kitaps.forEach(kitap => appendKitapToList(kitap));
    })
    .catch(error => console.error('Книги не показались:', error));
}

window.onload = loadKitapsFromServer;