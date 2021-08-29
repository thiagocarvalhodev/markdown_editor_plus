# simple_markdown_editor

[![Support Me](https://img.shields.io/badge/Donate-Buy%20Me%20A%20Coffe-blue.svg)](https://paypal.me/zahniaradirahman?locale.x=en_US)
[![GitHub stars](https://img.shields.io/github/stars/zahniar88/simple_markdown_editor?color=green)](https://github.com/zahniar88/simple_markdown_editor)
[![undo](https://img.shields.io/pub/v/simple_markdown_editor.svg)](https://pub.dev/packages/simple_markdown_editor)


Simple markdown editor library For flutter.

## Usage

Add dependencies to your `pubspec.yaml`

```yaml
dependencies:
    simple_markdown_editor: ^version
```
> **Recomended Version:** above ^0.1.4

Run `flutter pub get` to install.

## How it works

Import library

```dart
import 'package:simple_markdown_editor/simple_markdown_editor.dart';
```

Initialize controller and focus node. These controllers and focus nodes are optional because if you don't create them, the editor will create them themselves

```dart
TextEditingController _controller = TextEditingController();
FocusNode _focusNode = FocusNode();
```

Show widget for editor

```dart
ZMarkdownEditor(
    controller: _controller,
    enableToolBar: true,
    emojiConvert: true,
    autoCloseAfterSelectEmoji: false,
)
```

if you want to parse text into markdown you can use the following widget:

```dart
String data = '''
**bold**
*italic*

#hashtag
@mention
'''

ZMarkdownParse(
    data: data,
    onTapHastag: (String name, String? match) {
        // name => hashtag
        // match => #hashtag
    },
    onTapMention: (String name, String? match) {
        // name => mention
        // match => #mention
    },
)
```

Result Editor:

<img src="pictures/screenshoot.png" alt="drawing" width="200"/>

___

For demo video, you can see it at this url [Demo](https://youtube.com/)