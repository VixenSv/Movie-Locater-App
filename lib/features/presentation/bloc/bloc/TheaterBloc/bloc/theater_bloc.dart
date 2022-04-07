import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_locator_app/core/usecase/usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/addTheater.usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/addTheaterImage.usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/deleteTheater.usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/updateTheater.usecase.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/TheaterBloc/bloc/bloc.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/TheaterBloc/bloc/theater_event.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/TheaterBloc/bloc/theater_state.dart';

import '../../../../../domain/usecases/getTheaterList.usecase.dart';
import '../../../../pages/Home.page.dart';
import '../../../../pages/ViewTheaters.page.dart';

class TheaterBloc extends Bloc<TheaterEvent, TheaterState> {
  AddTheater addTheater;
  AddTheaterImage addTheaterImage;
  GetTheaterList getTheaterList;
  UpdateTheater updateTheater;
  DeleteTheater deleteTheater;

  TheaterBloc(
      {required this.addTheater,
      required this.addTheaterImage,
      required this.getTheaterList,
      required this.updateTheater,
      required this.deleteTheater})
      : super(TheaterListLoading()) {
    on<TheaterEvent>((event, emit) {});

    on<SelectTheaterImageEvent>(_onSelectTheaterImageEvent);
    on<SaveTheaterDataEvent>(_onSaveTheaterDataEvent);
    on<GetTheaterListEvent>(_onGetTheaterListEvent);
    on<UpdateTheaterEvent>(_onUpdateTheaterEvent);
    on<DeleteTheaterEvent>(_onDeleteTheaterEvent);
  }

  @override
  TheaterState get initialState => TheaterEmpty();

  Future<void> _onSelectTheaterImageEvent(
      SelectTheaterImageEvent event, Emitter<TheaterState> emit) async {
    final _picker = ImagePicker();
    var failureOrImageEntity;
    await _picker.pickImage(source: ImageSource.gallery).then((value) async => {
          failureOrImageEntity = await addTheaterImage(value!),
          failureOrImageEntity.fold(
            (failure) => Error(
                // message: _mapFailureToMessage(failure),
                ),
            (url) => emit(TheaterImageSaved(url: url)),
          )
          // emit(TheaterImageSelected(imageFile: value))).onError((error, stackTrace) => emit(TheaterImageSelectionFailed())
        });
  }

  Future<void> _onSaveTheaterDataEvent(
      SaveTheaterDataEvent event, Emitter<TheaterState> emit) async {
    final failureOrImageEntity = await addTheater(event.theaterEntity);
    failureOrImageEntity.fold(
      (failure) => Error(
          // message: _mapFailureToMessage(failure),
          ),
      (bookingEntity) => emit(TheaterListLoading()),
    );

    Navigator.pushReplacement(
      event.context,
      MaterialPageRoute(
          builder: (context) => HomePage(TheaterListPage(), 'Theaters')),
    );
  }

  Future<void> _onGetTheaterListEvent(
      GetTheaterListEvent event, Emitter<TheaterState> emit) async {
    final failureOrImageEntity = await getTheaterList(NoParams());
    failureOrImageEntity.fold(
      (failure) => Error(
          // message: _mapFailureToMessage(failure),
          ),
      (listEntity) => emit(TheaterListLoaded(listEntity: listEntity)),
    );
  }

  Future<void> _onUpdateTheaterEvent(
      UpdateTheaterEvent event, Emitter<TheaterState> emit) async {
    emit(TheaterUpdating());
    final failureOrImageEntity = await updateTheater(event.theaterEntity);
    failureOrImageEntity.fold(
      (failure) => Error(
          // message: _mapFailureToMessage(failure),
          ),
      (listEntity) => emit(TheaterListLoading()),
    );
  }

  Future<void> _onDeleteTheaterEvent(
      DeleteTheaterEvent event, Emitter<TheaterState> emit) async {
    emit(TheaterDeleting());
    final failureOrImageEntity = await deleteTheater(event.ref);
    failureOrImageEntity.fold(
      (failure) => Error(
          // message: _mapFailureToMessage(failure),
          ),
      (listEntity) => emit(TheaterListLoading()),
    );

  }
}
