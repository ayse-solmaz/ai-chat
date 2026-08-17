# AI Chat App

Flutter ve Google Gemini API kullanılarak geliştirilmiş modern bir mobil yapay zeka sohbet uygulaması.

---

## Özellikler

* **Kullanıcı Dostu Arayüz:** Kullanıcı ve yapay zeka mesajları için sağa/sola hizalı özel sohbet balonları (MessageBubble).
* **Google Gemini Entegrasyonu:** Gemini 2.5 Flash modeli ile hızlı ve dinamik yanıt akışı.
* **Durum Yönetimi:** İstek sırasında dinamik yüklenme göstergesi (CircularProgressIndicator) ve anlık mesaj listesi güncellemesi.
* **Hata Yönetimi:** Ağ veya API hatalarına karşı kontrollü asenkron yapı.
* **Gerçek Zamanlı Yanıtlar:** API yanıtlarının anlık olarak kullanıcıya gösterilmesi.

---

## Kullanılan Teknolojiler

* **Framework:** Flutter
* **Programlama Dili:** Dart
* **HTTP Paketi:** http
* **API:** Google Generative AI REST API (Gemini 2.5 Flash)
* **Minimum Flutter Sürümü:** 3.0 ve üzeri

---

## Proje Yapısı

```
lib/
├── models/
│   └── message_model.dart       # Mesaj veri modeli
├── screens/
│   └── chat_screen.dart         # Ana sohbet ekranı ve arayüz yönetimi
├── services/
│   └── api_service.dart         # Gemini API bağlantısı ve HTTP istekleri
├── widgets/
│   └── message_bubble.dart      # Mesaj balonu arayüz bileşeni
└── main.dart                    # Uygulama başlangıç noktası
```

---

## Kurulum ve Çalıştırma

### 1. Projeyi Klonlayın

```bash
git clone https://github.com/ayse-solmaz/ai-chat.git
cd ai_chat
```

### 2. Bağımlılıkları Yükleyin

```bash
flutter pub get
```

### 3. Google Gemini API Anahtarını Ekleyin

1. [Google AI Studio](https://aistudio.google.com) sitesine gidin
2. "Get API Key" butonuna tıklayın
3. Yeni bir API anahtarı oluşturun
4. `lib/services/api_service.dart` dosyasını açın
5. Aşağıdaki satırda API anahtarınızı yazın:

```dart
static const String _apiKey = 'BURAYA_GEMINI_API_KEY_YAZIN';
```

### 4. Uygulamayı Çalıştırın

```bash
flutter run
```

---

## Dosya Açıklamaları

### `message_model.dart`
Mesaj nesnelerinin yapısını tanımlar. Kullanıcı ve yapay zeka mesajlarını depolamak için gerekli olan veri modelini içerir.

### `chat_screen.dart`
Sohbet arayüzünün ana ekranını oluşturur. Mesaj listesini yönetir, kullanıcı girişini alır ve API yanıtlarını ekrana gösterir.

### `api_service.dart`
Google Gemini API ile iletişimi sağlar. HTTP isteklerini gönderir ve API yanıtlarını işler.

### `message_bubble.dart`
Sohbet balonlarını oluşturan arayüz bileşenidir. Kullanıcı ve yapay zeka mesajlarını farklı stillerle gösterir.

### `main.dart`
Uygulamanın başlangıç noktasıdır ve MaterialApp yapılandırmasını içerir.

---

## Ortam Değişkenleri (İsteğe Bağlı)

API anahtarını güvenli bir şekilde yönetmek için `.env` dosyası kullanabilirsiniz:

```env
GEMINI_API_KEY=BURAYA_API_KEY_YAZIN
```

Ardından `flutter_dotenv` paketi yükleyerek kullanabilirsiniz.

---

## Sorun Giderme

**Problem:** "API Key not found" hatası
- **Çözüm:** API anahtarının doğru şekilde `api_service.dart` dosyasına yapıştırıldığını kontrol edin.

**Problem:** "Network error" hatası
- **Çözüm:** İnternet bağlantınızı kontrol edin ve Google Gemini API'nin erişilebilir olduğunu doğrulayın.

**Problem:** Uygulamada yanıtlar görünmüyor
- **Çözüm:** API yanıt süresini kontrol edin ve Debug konsolunda hataları kontrol edin.

---
