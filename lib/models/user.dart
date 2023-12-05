class User {
  final String _taiKhoan;
  final String _matKhau;
  final String? _hoTen;
  final String? _ngaySinh;
  final int? _gioiTinh;
  final String? _moTa;
  final List<String>? _hinhAnh;
  final int? _trangThai;

  User({
    required String taiKhoan,
    required String matKhau,
    String? hoTen,
    String? ngaySinh,
    int? gioiTinh,
    String? moTa,
    List<String>? hinhAnh,
    int? trangThai,
  })  : _taiKhoan = taiKhoan,
        _matKhau = matKhau,
        _hoTen = hoTen,
        _ngaySinh = ngaySinh,
        _gioiTinh = gioiTinh,
        _moTa = moTa,
        _hinhAnh = hinhAnh,
        _trangThai = trangThai;

  String get taiKhoan => _taiKhoan;
  String get matKhau => _matKhau;
  String? get hoTen => _hoTen;
  String? get ngaySinh => _ngaySinh;
  int? get gioiTinh => _gioiTinh;
  String? get moTa => _moTa;
  List<String>? get hinhAnh => _hinhAnh;
  int? get trangThai => _trangThai;

  Map<String, dynamic> toJson() {
    return {
      'taiKhoan': _taiKhoan,
      'matKhau': _matKhau,
      'hoTen': _hoTen,
      'ngaySinh': _ngaySinh,
      'gioiTinh': _gioiTinh,
      'moTa': _moTa,
      'hinhAnh': _hinhAnh,
      'trangThai': _trangThai,
    }..removeWhere((key, value) => value == null);
  }
}
