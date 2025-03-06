
class AppDir{
  final String img;
  final String db;
  AppDir({required this.img,required this.db});

  @override
  String toString() {
    return 'AppDataDir{img: $img,db: $db}';
  }
}