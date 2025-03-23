import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kueski_challenge/presentation/states/cubit/movies_cubit.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension GetDeviceTypeX on BuildContext {
  List<String> getGenres(List<int> genreIds) {
    final genres = watch<MoviesCubit>().genres;
    if (genres.isEmpty || genreIds.isEmpty) {
      return [];
    }

    final genresStr = <String>[];
    for (final genreId in genreIds) {
      final result = genres.where((g) => g.id == genreId).toList();
      if (result.isNotEmpty) {
        genresStr.add(result.first.name);
      }
    }

    return genresStr;
  }
}
