## ¿Cómo probar la app?
- `flutter pub get` para instalar las librerías.
- `flutter run -d chrome` para iniciar ver el proyecto en el navegador.

## Inicio de sesión con Firebase
La funcionalidad más compleja es utilizar Firebase como un CRUD. Así que comencé clonando un repo que ya tenía implementada esa funcionalidad: https://github.com/gitanjal/flutterfirebasedemo/tree/upload_image

Reemplacé los accesos a Firebase en `lib/firebase_options.dart` con los mismos datos 

Ahora los productos se guardan en la Firestore Database

![p9](https://user-images.githubusercontent.com/78570710/213745138-21c31c71-bdd1-4587-bc2f-bfa124774d9e.jpg)

## Agregar items

Se agregó el valor "favorito" al momento de subir un producto a Firebase en el archivo `lib/add_item.dart`

```dart
TextFormField(
  controller: _controllerFavorite,
  decoration: InputDecoration(
      hintText: 'Enter the FAVORITE CATEGORY of the item'
  ),
  validator: (String? value){

    if(value==null || value.isEmpty)
    {
      return 'Please enter the item FAVORITE CATEGORY';
    }

    return null;
  },
),
```

![p6](https://user-images.githubusercontent.com/78570710/213744804-0d99bf8f-095d-4792-96c4-fa86401deb1f.jpg)

## Lista de productos

Se agregaron 10 productos pero no la funcionalidad para agruparlos de 6 en 6.

![p7](https://user-images.githubusercontent.com/78570710/213744914-ebe28ae4-1bbb-446d-8ec3-c4b9062309b8.jpg)

## Edición y eliminación de productos

En el archivo `item_details.dart` se encuentra la AppBar con botones para editar y eliminar productos:

```dart
appBar: AppBar(
  title: Text('Item details'),
  actions: [
    IconButton(
        onPressed: () {
          data['id'] = itemId;
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditItem(data)));
        },
        icon: Icon(Icons.edit)),
    IconButton(onPressed: (){
      _reference.delete();
    }, icon: Icon(Icons.delete))
  ],
),
```

![p8](https://user-images.githubusercontent.com/78570710/213744983-4806d9b5-9e64-4849-ae5b-a049b5df3c43.jpg)
