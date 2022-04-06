import 'package:dartz/dartz.dart';
import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';
import 'package:movie_locator_app/features/domain/irepositories/movieLocator.repository.dart';
import '../../../core/error/faliure.dart';
import '../../../core/usecase/usecase.dart';

class DeleteBooking implements UseCase<BookingEntity, BookingEntity> {
  final MovieLocatorRepository repository;

  DeleteBooking(this.repository);

  @override
  Future<Either<Failure, BookingEntity>> call(BookingEntity entity) async {
    return await repository.deleteBookingData(entity);
  }
}
