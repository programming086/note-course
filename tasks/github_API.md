## Task #14 - Работа с API github gists

Расширьте функциональность приложения Заметки работой с API github gists. В gist будет храниться JSON, описывающий список созданных заметок.

Описание API для работы с gists есть по [ссылке](https://developer.github.com/v3/gists/#list-a-users-gists).

1. Реализовать загрузку списка заметок из gist. Файл в gist для хранения массива заметок в виде JSON должен называться `ios-course-notes-db`. Если при загрузке файл с именем `ios-course-notes-db` не был найден, показывать пустой список заметок.
2. Реализовать возможность создания новой заметки из приложения и сохранения ее в gist в виде JSON в файл `ios-course-notes-db`.
3. Реализовать возможность редактирования заметки в приложении (после редактирования необходимо отправлять запрос для обновления файла `ios-course-notes-db` в gist).
4. Реализовать возможность удаления заметки из приложения (после удаления заметки необходимо отправлять запрос для обновления файла `ios-course-notes-db` в gist).
5. Код необходимо помещать в операции, созданные в [предыдущем задании](operations.md).
6. Все используемые зависимости должны содержаться в архиве проекта. Проверяющий не будет вызывать `pod install`.


### Подсказки

Редактирование и удаление заметки требуется реализовать как обновление уже существующего файла в gist.

Информация о файлах gist в Codable структуре может быть представлена так:

```swift
struct Gist: Codable {
    let files: [String: GistFile]
    ...
}

struct GistFile: Codable {
    let filename: String
    let rawUrl: String

    enum CodingKeys: String, CodingKey { // Позволяет использовать названия полей в структуре отличающиеся от названий ключей в JSON
        case filename
        case rawUrl = "raw_url"
    }    
}
```
Получить массив заметок, загруженных по `rawUrl` из gist (через `URLSession dataTask`), можно так:

```swift
try? JSONDecoder().decode(Notebook.self, from: data)
```
