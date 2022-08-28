import 'dart:io';

import 'package:pokedex/data/datasources/remote_data_source.dart';
import 'package:pokedex/data/exception.dart';
import 'package:pokedex/data/failure.dart';
import 'package:dartz/dartz.dart';

import '../models/pokemon_model.dart';

// for getting pokemons from the data source.
class PokemonRepositoryImpl {
  final RemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  //for getting pokemons. Returns exception if it occurs;
  @override
  Future<Either<Failure, List<PokemonModel>>> getPokemons() async {
    try {
      final results = await remoteDataSource.getPokemons();

      return Right(results);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
