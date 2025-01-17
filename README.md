# OPENHAVEN RENTAL

## Proje Tanıtımı
*OPENHAVEN RENTAL*, emlakçılar için geliştirilmiş Android tabanlı bir mobil asistan uygulamasıdır. Bu uygulama, emlakçıların ev ilanlarını kolayca eklemelerini, müşterilerini kaydedebilmelerini ve şirketlerinin konumunu harita üzerinden görüntülemelerini sağlar. Uygulama, kullanıcı dostu bir arayüze ve şık bir tasarıma sahip olup, emlakçılar için iş süreçlerini hızlandırmayı amaçlar.

## Kullanıcı Arayüzü ve Sayfalar
Uygulama, çeşitli işlevleri kolayca erişilebilir hale getiren sade ve şık bir tasarıma sahiptir. Aşağıdaki sayfalar uygulamanın temel bileşenleridir:

- *Giriş Ekranı*: Kullanıcı adı ve parola ile güvenli bir giriş sağlar.
- *Ana Sayfa*: Kullanıcıların mevcut ilanlarını görüntülemesine ve yeni ilan eklemelerine olanak tanır.
- *Müşteri Ekleme*: Emlakçılar, müşterilerinin bilgilerini Firebase veritabanına kaydedebilirler.
- *Yeni Ev Ekleme*: Emlakçılar, ev ilanları ekleyebilir ve ilanlarına resim ekleyebilirler.
- *Harita Sayfası*: Uygulama geliştiricisinin (uygulama sahibinin) konumu harita üzerinde gösterilir, iletişim amacıyla kullanılabilir.

## Proje Özellikleri
- *İlan Ekleme*: Kullanıcılar, fotoğrafları URL'ler aracılığıyla yükleyebilir ve görsellerin önizlemelerini görebilir.
- *Müşteri Bilgileri*: Müşteri bilgileri Firebase Firestore veritabanında güvenli bir şekilde saklanır.
- *Harita Özelliği*: Geliştiricinin (uygulama sahibinin) konumunu kullanıcıya gösterir, bu özellik iletişim sayfası işlevi görür.

## Kurulum ve Çalıştırma
### Flutter ve Dart Kurulumu
- Flutter SDK'sını [Flutter Resmi Sitesi](https://flutter.dev/docs/get-started/install) üzerinden kurabilirsiniz.
- Dart SDK kurulumunu [Dart Resmi Sitesi](https://dart.dev/get-dart) üzerinden gerçekleştirebilirsiniz.

### Projeyi Çalıştırma
1. GitHub reposundan projeyi indirin.
2. Proje dizininde terminali açın ve aşağıdaki komutları sırasıyla çalıştırın:
    bash
    flutter pub get
    flutter run
    
3. Uygulama, Android cihazınızda çalışacaktır.

## Ekran Görüntüleri
- *Giriş Ekranı*: Kullanıcı adı ve parola ile giriş yapılır.
- *Ana Sayfa*: İlan ekleme butonu ve mevcut ilanlar.
- *Müşteri Ekleme*: Müşteri bilgileri Firebase veritabanına kaydedilir.
- *Yeni Ev Ekleme*: Yeni bir ev ilanı eklenebilir.
- *Harita Sayfası*: Geliştiricinin konumu harita üzerinde gösterilir.

## Veritabanı Yapısı
- *Firebase Firestore*: Müşteri bilgileri Firebase Firestore veritabanında güvenli bir şekilde saklanır.

## Konum Özelliği
Harita sayfası, sadece uygulama geliştiricisinin (yani sizin) konumunu gösterir. Bu özellik, geliştirici ile kullanıcı arasında iletişim kurmak amacıyla kullanılmaktadır.

## Video
Uygulamanın nasıl çalıştığını ve tüm işlevlerini anlatan videoya aşağıdaki YouTube linkinden ulaşabilirsiniz:
[YouTube Linki]

## Ekip Üyeleri
- *AHMET KUTAY ERGİN* - 132230057
- *FATMANUR SENA BÜLBÜL* - 132230062
