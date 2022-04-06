import 'package:bloc/bloc.dart';
import 'package:movie_locator_app/core/error/faliure.dart';
import 'package:movie_locator_app/features/domain/usecases/deleteBooking.usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/getBookingDataFromRef.usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/updateBooking.usecase.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bookingBloc/bloc/bloc.dart';
import 'package:url_launcher/url_launcher.dart';

const String SELECTION_FAILURE_MESSAGE = 'selection Failure';
const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class BookingBloc extends Bloc<BookingBlocEvent, BookingBlocState> {
  GetBookingDataFromRef getBookingDataFromRef;
  UpdateBooking updateBooking;
  DeleteBooking deleteBooking;

  BookingBloc(
      {required this.getBookingDataFromRef,
      required this.updateBooking,
      required this.deleteBooking})
      : super(BookingDataLoding()) {
    on<BookingBlocEvent>((event, emit) {});
    on<GetBookingDataEvent>(_onGetBookingdataEvent);
    on<ShowTheaterLocationEvent>(_onShowTheaterLocationEvent);
    on<UpdateBookingEvent>(_onUpdateBookingEvent);
    on<DeleteBookingEvent>(_onDeleteBookingEvent);
  }

  get movieEntity => null;

  @override
  BookingBlocState get initialState => BookingEmpty();

  Future<void> _onGetBookingdataEvent(
      GetBookingDataEvent event, Emitter<BookingBlocState> emit) async {
    final failureOrImageEntity = await getBookingDataFromRef(event.refId);
    failureOrImageEntity.fold(
      (failure) => Error(
          // message: _mapFailureToMessage(failure),
          ),
      (bookingEntity) => emit(BookingDataLoaded(bookingEntity: bookingEntity)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case SelectionFailure:
        return SELECTION_FAILURE_MESSAGE;
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }

  Future<void> _onShowTheaterLocationEvent(
      ShowTheaterLocationEvent event, Emitter<BookingBlocState> emit) async {
    if (await canLaunch(event.link))
      await launch(event.link);
    else
      // can't launch url, there is some error
      throw "Could not launch $event.link";
  }

  Future<void> _onUpdateBookingEvent(
      UpdateBookingEvent event, Emitter<BookingBlocState> emit) async {
    emit(BookingUpdating());
    final failureOrImageEntity = await updateBooking(event.bookingEntity);

    failureOrImageEntity.fold(
      (failure) => Error(
          // message: _mapFailureToMessage(failure),
          ),
      (bookingEntity) => emit(BookingUpdated(bookingEntity: bookingEntity)),
    );
  }

  Future<void> _onDeleteBookingEvent(
      DeleteBookingEvent event, Emitter<BookingBlocState> emit) async {
    final failureOrImageEntity = await deleteBooking(event.bookingEntity);
    failureOrImageEntity.fold(
      (failure) => Error(
          // message: _mapFailureToMessage(failure),
          ),
      (bookingEntity) => emit(BookingDeleted()),
    );
  }
}
