import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/error/faliure.dart';
import '../../../core/usecase/usecase.dart';
import '../entities/theater.entity.dart';
import '../irepositories/movieLocator.repository.dart';

class AddTheaterImage implements UseCase<String,XFile>{
  late final MovieLocatorRepository repository;

  AddTheaterImage(this.repository);

  @override
  Future<Either<Failure, String>> call(XFile file) async{
    return await repository.addTheaterImage(file);
  }

}