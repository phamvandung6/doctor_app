class AuthLocalDataSource {
  // Constructor của lớp AuthLocalDataSource khởi tạo một đối tượng
  // authLocalDataSource kiểu Map để lưu trữ dữ liệu, trong đó
  // khóa là kiểu String và giá trị có kiểu là Object?.

  AuthLocalDataSource() : authLocalDataSource = <String, Object?>{};

  final Map<String, Object?> authLocalDataSource;

  // Phương thức write cho phép bạn ghi dữ liệu vào authLocalDataSource
  // với một key và giá trị tương ứng. Kiểu dữ liệu của giá trị được
  // chỉ định bằng generic type T extends Object?.

  void write<T extends Object?>({required String key, T? value}) {
    authLocalDataSource[key] = value;
  }

  // Phương thức read cho phép bạn đọc dữ liệu từ authLocalDataSource
  // với một key và trả về giá trị có kiểu dữ liệu tương ứng với
  // generic type T extends Object?.

  T? read<T extends Object?>({required String key}) {
    final value = authLocalDataSource[key];
    if (value is T) return value;
    return null;
  }
}
