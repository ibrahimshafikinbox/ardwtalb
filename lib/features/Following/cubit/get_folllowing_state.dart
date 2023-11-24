abstract class FollowingState {}

class FollowingInitial extends FollowingState {}

class FollowingLoading extends FollowingState {}

class FollowingSuccess extends FollowingState {}

class FollowingError extends FollowingState {}
// User following details

class GetUserFollowingDetailsLoadingstate extends FollowingState {}

class GetUserFollowingDetailsSuccessstate extends FollowingState {}

class GetUserFollowingDetailsErrorstate extends FollowingState {}
// Get following Ads States

class GetFollowingAdsLoading extends FollowingState {}

class GetFollowingAdsSuccess extends FollowingState {}

class GetFollowingAdsError extends FollowingState {}

// add rting states

class RateOthersCustomerLoading extends FollowingState {}

class RateOthersCustomerSuccess extends FollowingState {}

class RateOthersCustomerError extends FollowingState {}
