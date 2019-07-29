## Task #13.1 - Протокол Decodable на практике

Для решения задачи вам понадобится логин на [github](https://github.com/). Если вы ещё не зарегистрированы на [github.com](https://github.com/), пожалуйста, сделайте это. Также потребуются созданные gists в интерфейсе [github gists](https://gist.github.com/). Достаточно будет создать хотя бы один-два gist.

1. С помощью github API получите список публичных gists и выведите полученную информацию в консоль.

2. Структура, описывающая gist должна содержать поля со следующими данными: 
    * дата создания;
    * логин владельца gist;
    * количество комментариев;
    * информация о файлах gist.

3. Для получения публичных gists используйте метод:
`GET /gists`
Описание API для работы с gists есть [по ссылке](https://developer.github.com/v3/gists/#list-all-public-gists).


###Заготовка

Ниже вы найдёте структуру кода, которая поможет вам реализовать задание.

```swift
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct Gist: Decodable {

    // implement Gist struct
    // ...

    let files: [String: GistFile]
    let owner: Owner
}

struct Owner: Decodable {

    // implement Owner struct
    // ...

}

struct GistFile: Decodable {

    // implement GistFile struct
    // ...

}

func load() {

    // load gists data with URLSession.shared.dataTask and print loaded gists info
    // ...

}

load()
```


