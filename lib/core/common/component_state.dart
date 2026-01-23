sealed class ComponentState<T> {}

class InitialState<T> extends ComponentState<T> {}

class LoadingState<T> extends ComponentState<T> {}

class ErrorState<T> extends ComponentState<T> {
   Exception? exception;
   ErrorState(this.exception);
}
class SuccessState<T> extends ComponentState<T> {
   T data;
   SuccessState(this.data);
}
