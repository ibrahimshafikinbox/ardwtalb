abstract class CreateNewAdState {}

class CreateNewAdInitial extends CreateNewAdState {}

class CreateNewAdLoading extends CreateNewAdState {}

class CreateNewAdSuccess extends CreateNewAdState {}

class CreateNewAdError extends CreateNewAdState {
  final String message;
  CreateNewAdError(this.message);
}

//picked image
class PickedImagesuccess extends CreateNewAdState {}

class PickedImageError extends CreateNewAdState {}

class GetDepartmentLoading extends CreateNewAdState {}

class GetDepartmentSuccess extends CreateNewAdState {}

class GetDepartmentError extends CreateNewAdState {}
