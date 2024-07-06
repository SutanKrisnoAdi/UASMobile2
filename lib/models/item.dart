class Item {
  final int id;
  final String kode;
  final String nama;
  final int qty;

  Item({required this.id, required this.kode, required this.nama, required this.qty});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: int.parse(json['id']),
      kode: json['kode'],
      nama: json['nama'],
      qty: int.parse(json['qty']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kode': kode,
      'nama': nama,
      'qty': qty,
    };
  }
}
