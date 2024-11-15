import 'package:chopper/chopper.dart';

part 'post_service.chopper.dart';

@ChopperApi()
abstract class PostService extends ChopperService {
  @Get(path: '/posts')
  Future<Response<List<dynamic>>> getPosts();

  static PostService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [_$PostService()],
      converter: JsonConverter(),
      interceptors: [
        (Request request) async {
          final modifiedRequest = request.copyWith(
            headers: {'Custom-Header': 'ChopperHeaderValue'},
          );
          print('Request: ${modifiedRequest.url}, Headers: ${modifiedRequest.headers}');
          return modifiedRequest;
        },
      ],
    );
    return _$PostService(client);
  }
}
