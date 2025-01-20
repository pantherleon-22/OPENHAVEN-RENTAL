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
  
![11](https://github.com/user-attachments/assets/a1aeaedc-49b0-478b-b215-832215c8f455)
- *Ana Sayfa*: İlan ekleme butonu, arama butonu ve mevcut ilanlar bulunur.

![22](https://github.com/user-attachments/assets/5e22a50e-04e8-49c3-b080-7f55add55990)
![33](https://github.com/user-attachments/assets/1a874eba-a9e2-4d71-9e48-4e11631ab502)
![44](https://github.com/user-attachments/assets/dd02cd29-b8dd-465e-8f09-393bbc86e545)
![55](https://github.com/user-attachments/assets/a1f27307-e72e-436d-b964-8ac0b6ad223f)
- *Drawer Menu*: Sayfa geçişleri için linkler bulunur.

![00](https://github.com/user-attachments/assets/63131cb6-1da3-499a-9913-c76b804120bf)
- *Yeni Ev Ekleme*: Yeni bir ev ilanı eklenebilir.

![66](https://github.com/user-attachments/assets/adf7c394-b552-46ef-bd96-3ce3afbfefe2)
- *Müşteri Ekleme*: Müşteri bilgileri Firebase veritabanına kaydedilir. Müşteri ekler, siler ve düzenleyebilirsiniz.

![77](https://github.com/user-attachments/assets/5f3e10c5-dde9-48c4-82c2-cf2d39a9536f)
- *Harita Sayfası*: Geliştiricinin konumu harita üzerinde gösterilir.
  
![88](https://github.com/user-attachments/assets/36801d0e-4fa4-4cef-9a16-b27e97c95acc)

## Veritabanı Yapısı
- *Firebase Firestore*: Müşteri bilgileri Firebase Firestore veritabanında güvenli bir şekilde saklanır.
- Kullanılan Firebase 30 günlük geçici bir veri tabanıdır firebase üzerinden gerekli ayarlamalar ile bu süre ayarlanabilmektedir

## Konum Özelliği
Harita sayfası, uygulama geliştiricisinin konumunu gösterir. Bu özellik, geliştirici ile kullanıcı arasında iletişim kurmak amacıyla kullanılmaktadır.

## Video
Uygulamanın nasıl çalıştığını ve tüm işlevlerini anlatan videoya aşağıdaki YouTube linkinden ulaşabilirsiniz:
[[YouTube Linki]](https://www.youtube.com/shorts/n-ZLWBpN3Do)

## Kodların Açıklanması
https://youtube.com/shorts/72LATE7EdKM


## Ekip Üyeleri
- *AHMET KUTAY ERGİN* - 132230057
- *FATMANUR SENA BÜLBÜL* - 132230062
