abstract class ValidatorService {
  void saveErrors(Map<String, List> errors);

  void deleteErrors();

  void onListen(void Function(Map<String, List> value) listener);
}
