import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flutter_website/bloc/theme/theme_event.dart';
import 'package:simple_flutter_website/bloc/theme/theme_state.dart';
import 'package:simple_flutter_website/utils/theme.dart';

class ThemeDataBloc extends Bloc<ThemeDataEvent, ThemeDataState> {
  ThemeDataBloc()
      : super(
          LightThemeActivated(
            theme: AppTheme.lightTheme,
          ),
        ) {
    on<ChangToLightThemeData>(activateLightTheme);
    on<ChangToDarkThemeData>(activateDarkTheme);
  }
  Future<void> activateDarkTheme(event, emit) async {
    emit(
      DarkThemeActivated(
        theme: AppTheme.darkTheme,
      ),
    );
  }

  Future<void> activateLightTheme(event, emit) async {
    emit(
      LightThemeActivated(
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
