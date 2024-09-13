import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/functions/validation.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/models/image.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';
import 'package:skar_super_admin/services/api/image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final imageApiServiceProvider =
    Provider<ImageApiService>((ref) => ImageApiService());

var addOrUpdateImageProvider =
    FutureProvider.autoDispose.family<ResultImage, ImageParams>(
  (ref, arg) async {
    ResultImage result = ResultImage.defaultResult();

    try {
      String accessToken = await ref.read(accessTokenProvider);
      ResultImage resultImage =
          await ref.read(imageApiServiceProvider).addOrUpdateImage(
                arg.imageType!,
                arg.oldImage!,
                accessToken,
                arg.imageFile!,
              );

      if (arg.context.mounted) {
        await wrongToken(resultImage.error, ref, arg.context);
      }

      if (resultImage.error == 'some error' && arg.context.mounted) {
        showToast(
          AppLocalizations.of(arg.context)!.someErrorOccurred,
          true,
        );
      }

      result = resultImage;
    } catch (e) {
      result = ResultImage(error: e.toString());
    }

    return result;
  },
);
