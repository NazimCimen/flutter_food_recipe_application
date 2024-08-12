import 'package:equatable/equatable.dart';

class AppVersionEntity extends Equatable {
  final String? versionNumber;
  const AppVersionEntity(this.versionNumber);
  @override
  List<Object?> get props => [versionNumber];
}
