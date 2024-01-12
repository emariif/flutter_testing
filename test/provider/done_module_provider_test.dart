import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/provider/done_module_provider.dart';

void main() {
  group('Provider Test', () {
    // arrange : bagian di mana kita menyiapkan objek dan pengaturan yang akan diuji
    var doneModuleProvider = DoneModuleProvider();
    var testModuleName = 'Test Module';

    setUp(() {
      doneModuleProvider = DoneModuleProvider();
    });

    test('should contain new item when module completed', () {
      // act : aksi yang ingin dijalankan
      doneModuleProvider.complete(testModuleName);
      // assert : di mana kita memverifikasi nilai yang diekspektasikan dengan hasil pemanggilan metode ketika Act.
      var result = doneModuleProvider.doneModuleList.contains(testModuleName);
      expect(result, true);
    });

    test('should not contain item when module removed', () {
      // Hapus modul dengan nama testModuleName
      doneModuleProvider.remove(testModuleName);

      // Periksa apakah doneModuleList masih terdapat berisi testModuleName
      var result = doneModuleProvider.doneModuleList.contains(testModuleName);

      // Ekspektasi bahwa setelah penghapusan, modul tersebut tidak lagi ada dalam daftar
      // Jika kita menulis true harusnya masih ada (tidak terhapus) : ini bukan hasil yang diharapkan
      expect(result, false);
    });
  });
}
