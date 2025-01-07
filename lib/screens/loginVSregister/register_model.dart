class RegisterModel {
  // Hàm kiểm tra mật khẩu và xác nhận mật khẩu
  String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Hàm validate tên người dùng
  String? validateUsername(String username) {
    if (username.isEmpty) {
      return 'Please enter username';
    }
    return null;
  }

  // Hàm validate mật khẩu
  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter password';
    }
    // Uncomment nếu bạn muốn yêu cầu độ dài mật khẩu
    // if (password.length < 6) {
    //   return 'Password must be at least 6 characters long';
    // }
    return null;
  }
}
