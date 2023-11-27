import 'package:club_valledupar_app/lib.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

@Injectable(as: ResetPasswordService)
class GoToResetPasswordService implements ResetPasswordService {
  @override
  Future<void> resetPassword() {
    final uri = Uri.parse("$domain/forgot-password");
    return launchUrl(uri);
  }
}
