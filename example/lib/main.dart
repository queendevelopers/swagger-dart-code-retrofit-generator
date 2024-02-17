import 'package:dio/dio.dart';
import 'package:example/swagger_generated_code/pet_service_yaml.swagger.dart';

void main() async {
  final Dio dio= Dio();
  final petsApi = PetServiceYaml.PetServiceYaml(dio);

  final postResult = await petsApi.petPost(
    body: Pet(
      name: 'Vovanella',
      photoUrls: [
        'https://i.ytimg.com/vi/hO6G8jxV-YU/maxresdefault.jpg',
        'https://i.ytimg.com/vi/5u3iv8AT8G8/maxresdefault.jpg'
      ],
      status: PetStatus.available,
      category: Category(),
    ),
  );

  final pet = Pet.fromJson(postResult.response as Map<String, dynamic>);

  print('Created pet id: ${pet.id}');
}
