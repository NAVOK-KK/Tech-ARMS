import 'package:fast_rsa/fast_rsa.dart';

dynamic encryptsm(String msg) async {
  try {
    var pu = '''-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC58Sm/saXb6yrJBQl0fi+rcIrZkK1EtWZOMpMraQ50CB2ERMKzOnw7IQhPmC4msUdV+nAkJ/3MjZvNwomsuC60k8Dgc98QbuUhmUBWs1fVUtf+HWqOQIKq/ENYKHAluHIKhAYigNCskDmJGcbe0imG3Sor7vROB9yExEglFiL+yQIDAQAB
-----END PUBLIC KEY-----''';

    String enmsg = await RSA.encryptPKCS1v15(msg, pu);

    return enmsg;
  } catch (e) {
    return "error during encryption";
  }
}

dynamic dencryptsms(String msg) async {
  try {
    var d = '''-----BEGIN RSA PRIVATE KEY-----
MIICXQIBAAKBgQC58Sm/saXb6yrJBQl0fi+rcIrZkK1EtWZOMpMraQ50CB2ERMKzOnw7IQhPmC4msUdV+nAkJ/3MjZvNwomsuC60k8Dgc98QbuUhmUBWs1fVUtf+HWqOQIKq/ENYKHAluHIKhAYigNCskDmJGcbe0imG3Sor7vROB9yExEglFiL+yQIDAQABAoGBAJrsQGijTxno2oEaXUJeUMF6x3V2gacZrN/Ca7Rjl9M9X7pwv/gs5o0tfIs0tF8wncsZGo5Fc8UWx5WsXKE35FDJHXTBIRRNv/Tgwb2YusfiWG9YHrxGFI37ZpQI2rdf8jTKaUffBUkebxJgjLW+wphwuiZzGaVUwJvImz1KmWIxAkEA+tv16gI+EtESVm1tsRPQ9aDeJPDQ1J2RGudaZycBzS1uub+w5VIDfBO4HFF3Zs3W6jYpcNftMFr9htXCenJpWwJBAL3Ao4INesTZ7l1UIKNVz5sn2hMmz7iEQl5iY4M37H2l6lz4xqunlE0s4e0NyCHTQvCYzEo9McKRfBhNIeanDasCQF/V2nu8wZQUtUm5YneM136PJ267ZTxkucOqcNoJh+Gnoq5psh3ZmCU1r1d6NABdUOaHLIvEogOgL0zsqvB2dxMCQGYuBR50WccFP/mb4tNx0xDO/fzQKo1HE2I2AzZW+A+VN8YG5RzsaczBPYvknv+v/t0GuwPDPjdzFmsTpgzJqm8CQQDR98uGhgz3H1FL+peUeC2FvbwJlGpINBJCfS70TInwiLRBcDvTUp/wJIAE2A57BY9jZfRSkuo7zeIyQlko6AE3
-----END RSA PRIVATE KEY-----''';

    String demsg = await RSA.decryptPKCS1v15(msg, d);
    return demsg;
  } catch (e) {
    // print(e);
    return "error during dencryption";
  }
}
