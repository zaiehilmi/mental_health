<!-- This README is prepared by zaie. do contact me if need help (zaiehilmi@gmail.com) 
based on template by https://www.figma.com/@sushobhan
-->
# schedule_management Template

## Getting Started

### Prerequisites
- Flutter v3.29

### Run the project
- `flutter pub get`
- `flutter run` (this will open any ready device)

## Architecture
This project is based on MVVM architecture.

#### Tech Stack
| Tech | Description |
| --- | --- |
| Riverpod | The state management |
| go_router | Navigation and routing solution |
| Easy Localization | Localization purposes. currently the default language is set to English (en_EN) |
| Drift | SQL database |
| Orange | Local key-value storage for user preferences. No-SQL database |
| Dio | API client. complete with the interceptor |

#### The module folder will consists of the following:
| File indicator | Description |
| --- | --- |
| `*_screen.dart` | UI of the module |
| `*_vm.dart` | View model of the module. Use Riverpod here |
| `*_model.dart` | The model of the module |

### Project Structure

##### if you have a module called `schedule`, the folder will be like this:
```
- lib/
  - modules/
    - schedule/
      - schedule_screen.dart
      - schedule_vm.dart
      - schedule_model.dart
```

##### if inside the module has a submodule such as `schedule_detail`, the folder will be like this:
```
- lib/
  - modules/
    - schedule/
      - schedule_screen.dart
      - schedule_vm.dart
      - schedule_model.dart
      - schedule_detail/
        - schedule_detail_screen.dart
        - schedule_detail_vm.dart
        - schedule_detail_model.dart
```

##### for all custom widgets that only used in the module, the folder will be like this:
```
- lib/
  - modules/
    - schedule/
      - schedule_screen.dart
      - schedule_vm.dart
      - schedule_model.dart
      - widgets/
        - _schedule_widget.dart
        - _schedule_detail_widget.dart
```