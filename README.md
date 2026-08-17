# AI Chat App

Flutter ve Google Gemini API kullanılarak geliştirilmiş modern bir mobil yapay zeka sohbet uygulaması.

---

## Özellikler

* **Kullanıcı Dostu Arayüz:** Kullanıcı ve yapay zeka mesajları için sağa/sola hizalı özel sohbet balonları (MessageBubble).
* **Google Gemini Entegrasyonu:** gemini-2.5-flash modeli ile hızlı ve dinamik yanıt akışı.
* **Durum Yönetimi:** İstek sırasında dinamik yüklenme göstergesi (CircularProgressIndicator) ve anlık mesaj listesi güncellemesi.
* **Hata Yönetimi:** Ağ veya API hatalarına karşı kontrollü asenkron yapı.

---

## Kullanılan Teknolojiler

* **Framework:** Flutter
* **Dil:** Dart
* **Paketler:** http
* **API:** Google Generative AI REST API (gemini-2.5-flash)

---

## Proje Yapısı

lib/
├── models/
│   └── message_model.dart     # Mesaj veri modeli
├── screens/
│   └── chat_screen.dart       # Ana sohbet ekranı ve arayüz yönetimi
├── services/
│   └── api_service.dart       # Gemini API bağlantısı ve HTTP istekleri
├── widgets/
│   └── message_bubble.dart    # Mesaj balonu arayüz bileşeni
└── main.dart                  # Uygulama başlangıç noktası

---

## Kurulum ve Çalıştırma

1. Projeyi bilgisayarınıza klonlayın:
   git clone https://github.com/KULLANICI_ADIN/ai_chat.git
   cd ai_chat

2. Bağımlılıkları yükleyin:
   flutter pub get

3. API Anahtarını Ekleyin:
   lib/services/api_service.dart dosyasını açın ve _apiKey değişkenine kendi Google AI Studio anahtarınızı yazın:
   static const String _apiKey = 'BURAYA_GEMINI_API_KEY_YAZIN';

4. Uygulamayı çalıştırın:
   flutter run