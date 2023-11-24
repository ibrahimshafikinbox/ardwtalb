abstract class ChatStates {}

class ChatInitialState extends ChatStates {}

class ChatLoadingState extends ChatStates {}

class ChatSuccessState extends ChatStates {}

class ChatErrorState extends ChatStates {}
// chat rooms

class GetChatRoomsLoadingState extends ChatStates {}

class GetChatRoomsSuccessState extends ChatStates {}

class GetChatRoomsErrorState extends ChatStates {}
