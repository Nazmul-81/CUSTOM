class SearchModel {
  final hsCode;
  final hsCode2;
  final description;
  final su;
  final cd;
  final rd;
  final sd;
  final vat;
  final ait;
  final at;
  final tti;
  final image;

  SearchModel(this.hsCode, this.hsCode2, this.description, this.su, this.cd,
      this.rd, this.sd, this.vat, this.ait, this.at, this.tti, this.image);

  @override
  String toString() {
    String str = '$hsCode$hsCode2$description$su$cd$rd$sd$vat$ait$at$tti$image';
    return str;
  }
}
