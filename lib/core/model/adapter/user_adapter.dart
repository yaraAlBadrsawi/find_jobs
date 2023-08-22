import 'package:hive/hive.dart';

import '../user.dart';

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0; // Unique identifier for your model

  @override
  UserModel read(BinaryReader reader) {
    return UserModel(
      userID: reader.readString(),
      email: reader.readString(),
      name: reader.readString(),
      userType: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer.writeString(obj.userID);
    writer.writeString(obj.email);
    writer.writeString(obj.name);
    writer.writeString(obj.userType);
  }
}

class StringWrapperAdapter extends TypeAdapter<StringWrapper> {
  @override
  final int typeId = 1; // Unique identifier for your model

  @override
  StringWrapper read(BinaryReader reader) {
    return StringWrapper(reader.readString());
  }

  @override
  void write(BinaryWriter writer, StringWrapper obj) {
    writer.writeString(obj.value);
  }
}


class StringWrapper {
  final String value;

  StringWrapper(this.value);
}
