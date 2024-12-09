import 'package:flutter/material.dart';

import '../info_data.dart';

class DynamicContentSelector extends StatelessWidget {
  final int pageKey; // Sayfa belirleme için anahtar
  const DynamicContentSelector({Key? key, required this.pageKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sayfaya göre dinamik içerik seçimi
    final pageData = _getPageData(pageKey);

    if (pageData == null) {
      return Scaffold(
        body: Center(
          child: Text('Geçersiz Sayfa'),
        ),
      );
    }

    return DynamicContentPage(
      appBarTitle: pageData['appBarTitle'],
      imageUrl: pageData['imageUrl'],
      pageTitle: pageData['pageTitle'],
      introductionText: pageData['introductionText'],
      sections: pageData['sections'],
    );
  }

  // Sayfa verilerini döndüren fonksiyon
  Map<String, dynamic>? _getPageData(int pageKey) {
    switch (pageKey) {
      case 1:
        return {
          'appBarTitle': 'Aile İlişkileri',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Aile İlişkilerinin Önemi',
          'introductionText':
              'Aile, bireyin sosyal ve duygusal gelişiminde kritik bir rol oynar. Sağlıklı aile ilişkileri, mutlu ve dengeli bir yaşam sürdürmenin temelidir.',
          'sections': [
            Section(
              title: 'İletişim Becerileri',
              contents: [
                InteractiveExercise(
                  title: 'Empati Egzersizi',
                  description:
                      'Aile bireylerinden birisi gün içinde yaşadığı bir olayı detaylı olarak anlatır. Diğer aile üyeleri aktif bir şekilde dinler ve anlamak için sorular sorar. Bu süreçte, anlatıcının duygularını anlamaya çalışarak empati kurar ve geri bildirim verirler.',
                  benefit:
                      'Empati geliştirme ve iletişim becerilerini artırma. Ayrıca, aile bireyleri arasındaki duygusal bağı güçlendirme.',
                ),
                SimpleTask(
                  title: 'Birlikte Zaman Geçirme',
                  description:
                      'Her gün en az 30 dakika birlikte vakit geçirin. Bu süre zarfında bir oyun oynayın, bir film izleyin veya ortak bir hobiyle ilgilenin.',
                ),
              ],
            ),
            Section(
              title: 'Duygusal Paylaşım Oyunu',
              contents: [
                InteractiveExercise(
                  title: 'Duygusal Paylaşım Oyunu',
                  description:
                      'Her aile üyesi sırayla bir duygu kartı seçer (örneğin, mutlu, üzgün, kızgın). Bu duyguyu hissettiği bir anısını paylaşır. Diğer aile üyeleri aktif dinleyerek ve empati kurarak anıyı anlamaya çalışır.',
                  benefit:
                      'Duygusal farkındalığı artırma ve duygusal bağları güçlendirme. Ayrıca, aile üyelerinin birbirlerinin duygusal durumlarına daha duyarlı hale gelmelerini sağlama.',
                ),
              ],
            ),
            Section(
              title: 'Basit Görevler',
              contents: [
                SimpleTask(
                  title: 'Günlük Birlikte Zaman Geçirme',
                  description:
                      'Aile bireyleri her gün en az 30 dakika birlikte zaman geçirir. Bu süre zarfında bir oyun oynar, bir etkinlik yapar veya sadece sohbet eder.',
                ),
                SimpleTask(
                  title: 'Pozitif Geri Bildirim Verme',
                  description:
                      'Her aile üyesi diğerlerine pozitif geri bildirimde bulunur. Örneğin, "Bugün yaptığın yemek çok lezzetliydi" veya "Çok iyi bir iş çıkardın" gibi.',
                ),
                SimpleTask(
                  title: 'Aile Toplantısı Düzenleme',
                  description:
                      'Haftada bir kez aile toplantısı düzenleyin. Bu toplantıda herkes haftasını paylaşır, birlikte çözülmesi gereken sorunları konuşur ve ortak kararlar alır.',
                ),
              ],
            ),
            Section(
              title: 'Aile Günlüğü',
              contents: [
                SimpleTask(
                  title: 'Aile Günlüğü Tutma',
                  description:
                      'Aile bireyleri, günlük olarak yaşadıkları önemli olayları ve hissettiklerini bir aile günlüğüne yazar. Bu günlük, haftalık veya aylık olarak birlikte gözden geçirilir.',
                ),
              ],
            ),
          ],
        };

      case 2:
        return {
          'appBarTitle': 'Anksiyete Yönetimi',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Anksiyetenin Önemi',
          'introductionText':
              'Anksiyete, kişinin stresli durumlar karşısında verdiği doğal bir tepkidir. Ancak, bazı kişilerde günlük yaşamı etkileyen yoğun bir korku veya endişe haline gelebilir.',
          'sections': [
            Section(
              title: 'Anksiyete Belirtileri',
              contents: [
                SimpleTask(
                  title: 'Sürekli Endişe',
                  description:
                      'Kişinin sürekli olarak endişeli hissetmesi, gelecekle ilgili sürekli kaygı duymasıdır.',
                ),
                SimpleTask(
                  title: 'Hızlı Kalp Atışı',
                  description:
                      'Endişe anlarında kalp atışının hızlanması, nefes darlığı yaşama durumu.',
                ),
                SimpleTask(
                  title: 'Uyku Problemleri',
                  description:
                      'Uykuya dalmada güçlük, sık sık uyanma veya dinlendirici olmayan uyku.',
                ),
              ],
            ),
            Section(
              title: 'Etkileşimli Egzersizler',
              contents: [
                InteractiveExercise(
                  title: 'Nefes Egzersizi: 4-7-8 Tekniği',
                  description:
                      'Rahat bir pozisyonda oturun. 4 saniye boyunca burnunuzdan derin nefes alın, 7 saniye boyunca nefesi tutun, 8 saniye boyunca ağızdan yavaşça nefes verin.',
                  benefit: 'Kaygıyı azaltmaya ve sakinleşmeye yardımcı olur.',
                ),
                InteractiveExercise(
                  title: 'Duygu Günlüğü',
                  description:
                      'Her gün hissettiğiniz duyguları yazın. Duygularınızı tanımak ve anlamak, kaygıyı yönetmeye yardımcı olabilir.',
                  benefit:
                      'Duygusal farkındalığı artırır ve kaygıyı yönetmeye yardımcı olur.',
                ),
              ],
            ),
            Section(
              title: 'Basit Görevler',
              contents: [
                SimpleTask(
                  title: 'Günlük Egzersiz',
                  description:
                      'Her gün en az 30 dakika fiziksel aktivite yapın. Egzersiz, endorfin salgılayarak kaygıyı azaltabilir.',
                ),
                SimpleTask(
                  title: 'Meditasyon',
                  description:
                      'Günde en az 10 dakika meditasyon yapın. Meditasyon, zihninizi sakinleştirir ve ruh halinizi iyileştirir.',
                ),
                SimpleTask(
                  title: 'Doğada Zaman Geçirme',
                  description:
                      'Haftada en az bir kez doğada zaman geçirin. Doğa ile temas, stres seviyelerini azaltabilir ve zihninizi tazeleyebilir.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'Uzman Yardımı',
                  description:
                      'Anksiyeteyle başa çıkmakta zorlanıyorsanız, bir uzmandan yardım alın. Terapi ve danışmanlık, anksiyeteyi yönetmede etkili olabilir.',
                ),
              ],
            ),
          ],
        };
      case 3:
        return {
          'appBarTitle': 'Arkadaşlık İlişkileri',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Arkadaşlık İlişkilerinin Önemi',
          'introductionText':
              'Arkadaşlık, kişinin sosyal ve duygusal gelişiminde büyük bir rol oynar. Güçlü arkadaşlık ilişkileri, bireyin yaşam kalitesini artırır ve zorluklarla başa çıkmada destek sağlar.',
          'sections': [
            Section(
              title: 'İletişim Becerileri',
              contents: [
                InteractiveExercise(
                  title: 'Empati ve Dinleme Egzersizi',
                  description:
                      'Arkadaşlarınızla empati kurarak ve aktif bir şekilde dinleyerek ilişkilerinizi güçlendirebilirsiniz. Bir arkadaşınız size bir olay anlattığında, onu gerçekten dinleyin ve anlamak için sorular sorun.',
                  benefit:
                      'Empati geliştirme, ilişki bağlarını güçlendirme ve karşılıklı anlayışı artırma.',
                ),
                SimpleTask(
                  title: 'Haftalık Buluşma',
                  description:
                      'Her hafta en az bir kez bir arkadaşınızla buluşun ve birlikte zaman geçirin. Bu süre zarfında bir kahve içebilir, yürüyüş yapabilir veya birlikte bir etkinliğe katılabilirsiniz.',
                ),
              ],
            ),
            Section(
              title: 'Duygusal Paylaşım',
              contents: [
                InteractiveExercise(
                  title: 'Duygu Kartları',
                  description:
                      'Her arkadaşınızla sırayla bir duygu kartı seçin (örneğin, mutlu, üzgün, kızgın). Bu duyguyu hissettiğiniz bir anınızı paylaşın ve arkadaşınızdan benzer bir anıyı paylaşmasını isteyin.',
                  benefit:
                      'Duygusal farkındalığı artırma ve arkadaşlık bağlarını güçlendirme.',
                ),
              ],
            ),
            Section(
              title: 'Basit Görevler',
              contents: [
                SimpleTask(
                  title: 'Teşekkür Etme',
                  description:
                      'Arkadaşlarınıza yaptıkları şeyler için teşekkür edin ve minnettarlığınızı ifade edin. Küçük jestler, arkadaşlık ilişkilerini güçlendirebilir.',
                ),
                SimpleTask(
                  title: 'Birlikte Yeni Bir Aktivite Deneme',
                  description:
                      'Arkadaşlarınızla birlikte yeni bir aktivite veya hobi deneyin. Bu, ilişkinizi tazeleyecek ve birlikte yeni deneyimler yaşamanızı sağlayacaktır.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'Destek Olma',
                  description:
                      'Arkadaşlarınız zor zamanlar geçirdiğinde onlara destek olun ve yanlarında olduğunuzu hissettirin. Dinlemek ve empati kurmak, arkadaşlık ilişkilerini derinleştirir.',
                ),
              ],
            ),
          ],
        };

      case 4:
        return {
          'appBarTitle': 'Depresyon Yönetimi',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Depresyonun Önemi',
          'introductionText':
              'Depresyon, sürekli bir üzüntü ve ilgi kaybı durumudur. Bu durum, kişinin günlük yaşamını ve işlevselliğini olumsuz etkileyebilir. Depresyon, duygusal, bilişsel ve fiziksel belirtilerle kendini gösterebilir ve bireylerin yaşam kalitesini ciddi şekilde düşürebilir.',
          'sections': [
            Section(
              title: 'Depresyon Belirtileri',
              contents: [
                SimpleTask(
                  title: 'Sürekli Üzüntü',
                  description:
                      'Kişi, sürekli olarak üzüntülü ve boş hissetme durumundadır. Günlük yaşamda hiçbir şeyden zevk alamaz ve mutsuzluk sürekli olarak devam eder.',
                ),
                SimpleTask(
                  title: 'Enerji Kaybı',
                  description:
                      'Kişi, sürekli olarak yorgun ve bitkin hisseder. Günlük aktiviteleri gerçekleştirmek için gerekli enerjiyi bulamaz.',
                ),
                SimpleTask(
                  title: 'İlgi Kaybı',
                  description:
                      'Kişi, daha önce ilgi duyduğu aktivitelere karşı ilgisini kaybeder. Hobiler, sosyal etkinlikler ve günlük aktiviteler artık çekici gelmez.',
                ),
                SimpleTask(
                  title: 'Uyku Problemleri',
                  description:
                      'Depresyon, uyku düzenini olumsuz etkileyebilir. Kişi, uykuya dalmada güçlük çeker, sık sık uyanır veya sabahları erken uyanır ve tekrar uyuyamaz.',
                ),
                SimpleTask(
                  title: 'Konsantrasyon Zorluğu',
                  description:
                      'Kişi, dikkatini toplamakta ve karar vermekte zorluk çeker. Günlük işlerini tamamlamakta güçlük yaşayabilir.',
                ),
              ],
            ),
            Section(
              title: 'Etkileşimli Egzersizler',
              contents: [
                InteractiveExercise(
                  title: 'Derin Nefes Egzersizi',
                  description:
                      'Rahat bir pozisyonda oturun veya uzanın. Burnunuzdan derin bir nefes alın, birkaç saniye tutun ve ağzınızdan yavaşça nefes verin. Bu egzersizi 5 dakika boyunca tekrarlayın.',
                  benefit: 'Stresi azaltır ve rahatlama sağlar.',
                ),
                InteractiveExercise(
                  title: 'Pozitif Düşünce Günlüğü',
                  description:
                      'Her gün kendiniz hakkında olumlu şeyler yazın. Başarılarınızı, güçlü yönlerinizi ve sevdiğiniz şeyleri listeleyin.',
                  benefit:
                      'Olumlu düşünme alışkanlığını geliştirir ve özgüveni artırır.',
                ),
              ],
            ),
            Section(
              title: 'Basit Görevler',
              contents: [
                SimpleTask(
                  title: 'Günlük Egzersiz',
                  description:
                      'Her gün en az 30 dakika yürüyüş yapın veya hafif egzersizler yapın. Fiziksel aktivite, depresyon belirtilerini hafifletebilir.',
                ),
                SimpleTask(
                  title: 'Meditasyon',
                  description:
                      'Günde en az 10 dakika meditasyon yapın. Meditasyon, zihninizi sakinleştirir ve ruh halinizi iyileştirir.',
                ),
                SimpleTask(
                  title: 'Yaratıcı Aktiviteler',
                  description:
                      'Resim yapmak, yazı yazmak veya müzik dinlemek gibi yaratıcı aktivitelerle ilgilenin. Bu aktiviteler, zihninizi meşgul eder ve rahatlamanızı sağlar.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'Uzman Yardımı',
                  description:
                      'Depresyonla başa çıkmakta zorlanıyorsanız, bir uzmandan yardım almak önemlidir. Terapist veya danışman, depresyonu yönetmede etkili olabilir ve size uygun stratejiler sunabilir.',
                ),
                SimpleTask(
                  title: 'Destek Grupları',
                  description:
                      'Benzer deneyimler yaşayan kişilerle bir araya gelerek destek gruplarına katılın. Bu gruplar, duygusal destek sağlar ve yalnız hissetmemenize yardımcı olur.',
                ),
              ],
            ),
          ],
        };

      case 5:
        return {
          'appBarTitle': 'Duygusal Zeka Geliştirme',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Duygusal Zeka Nedir?',
          'introductionText':
              'Duygusal zeka, bireylerin kendi duygularını ve başkalarının duygularını tanıma, anlama ve yönetme yeteneğidir. Yüksek duygusal zeka, daha sağlıklı ve mutlu ilişkiler kurmaya, stresle başa çıkmaya ve kişisel başarıyı artırmaya yardımcı olabilir.',
          'sections': [
            Section(
              title: 'Duygusal Zekanızı Anlama',
              contents: [
                SimpleTask(
                  title: 'Duygularınızı Tanıma',
                  description:
                      'Her gün belirli zamanlarda durun ve o anda nasıl hissettiğinizi düşünün. Duygularınızı tanımlayın ve neden böyle hissettiğinizi anlamaya çalışın.',
                ),
                SimpleTask(
                  title: 'Duygusal Günlük Tutma',
                  description:
                      'Günlük olarak duygularınızı bir günlüğe yazın. Bu, duygusal farkındalığınızı artırır ve duygularınızı daha iyi yönetmenize yardımcı olur.',
                ),
              ],
            ),
            Section(
              title: 'Empati Geliştirme',
              contents: [
                InteractiveExercise(
                  title: 'Empati Egzersizi',
                  description:
                      'Başka bir kişinin duygularını anlamak ve paylaşmak için çaba gösterin. Bir arkadaşınız veya aile üyeniz size bir şey anlattığında, onun duygularını anlamaya çalışın ve empati kurun.',
                  benefit:
                      'Empati, duygusal zekayı geliştirmenin önemli bir bileşenidir ve sağlıklı ilişkiler kurmada kritik bir rol oynar.',
                ),
                SimpleTask(
                  title: 'Aktif Dinleme',
                  description:
                      'Konuşmalar sırasında, karşınızdaki kişiyi aktif olarak dinleyin. Göz teması kurarak ve beden dilinizi kullanarak dinlediğinizi gösterin.',
                ),
              ],
            ),
            Section(
              title: 'Duyguları Yönetme',
              contents: [
                InteractiveExercise(
                  title: 'Nefes Egzersizi',
                  description:
                      'Stresli veya zorlayıcı durumlarda derin nefes alarak sakinleşin. Nefesinizi kontrol etmek, duygusal tepkilerinizi yönetmenize yardımcı olur.',
                  benefit: 'Stres yönetimi ve duygusal denge sağlama.',
                ),
                SimpleTask(
                  title: 'Duygusal Kontrol',
                  description:
                      'Zorlayıcı durumlarda kendinizi sakinleştirmek için derin nefes alarak ve düşüncelerinizi yeniden odaklayarak duygusal kontrol sağlayın.',
                ),
              ],
            ),
            Section(
              title: 'Kendini Motive Etme',
              contents: [
                InteractiveExercise(
                  title: 'Hedef Belirleme',
                  description:
                      'Kısa ve uzun vadeli hedefler belirleyin ve bu hedeflere ulaşmak için adımlar atın. Hedeflerinizi net bir şekilde tanımlamak, motive olmanıza yardımcı olur.',
                  benefit:
                      'Kişisel ve profesyonel gelişimi destekler, motivasyonu artırır.',
                ),
                SimpleTask(
                  title: 'Pozitif Düşünme',
                  description:
                      'Her gün kendinize pozitif şeyler söyleyin ve olumsuz düşünceleri pozitife çevirin. Pozitif düşünme alışkanlığı, kendinizi motive etmenize yardımcı olur.',
                ),
              ],
            ),
            Section(
              title: 'Sosyal Beceri Geliştirme',
              contents: [
                InteractiveExercise(
                  title: 'İletişim Becerilerini Geliştirme',
                  description:
                      'İyi bir iletişimci olmak için açık ve net konuşun. Karşınızdaki kişiyi anlamaya çalışın ve ona değer verildiğini hissettirin.',
                  benefit:
                      'Sosyal etkileşimleri güçlendirir ve daha sağlıklı ilişkiler kurmanıza yardımcı olur.',
                ),
                SimpleTask(
                  title: 'Takım Çalışması',
                  description:
                      'Bir ekip içinde çalışırken işbirliği yapın ve takım arkadaşlarınızla etkili bir şekilde iletişim kurun. Takım çalışması, sosyal becerilerinizi geliştirir.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'Mentorluk ve Danışmanlık',
                  description:
                      'Duygusal zeka geliştirme sürecinde bir mentor veya danışmandan destek alın. Mentorlar, size rehberlik ederek duygusal zekanızı geliştirmenize yardımcı olabilir.',
                ),
                SimpleTask(
                  title: 'Destek Grupları',
                  description:
                      'Benzer hedefleri olan kişilerle bir araya gelerek destek gruplarına katılın. Destek grupları, duygusal zeka gelişiminizi destekleyebilir ve motivasyon sağlayabilir.',
                ),
              ],
            ),
          ],
        };

      case 6:
        return {
          'appBarTitle': 'Empati Geliştirme',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Empatinin Önemi',
          'introductionText':
              'Empati, başkalarının duygularını anlama ve paylaşma yeteneğidir. Empati, sağlıklı ve güçlü ilişkiler kurmanın temel taşlarından biridir. Başkalarının perspektifinden bakarak ve onların hislerini anlamaya çalışarak, daha anlayışlı ve destekleyici bir kişi olabilirsiniz.',
          'sections': [
            Section(
              title: 'Empatiyi Anlama',
              contents: [
                SimpleTask(
                  title: 'Empati Nedir?',
                  description:
                      'Empati, başkalarının duygularını anlama ve paylaşma yeteneğidir. Empati kurmak, bir başkasının ne hissettiğini anlamaya çalışmak ve bu duyguları paylaşmak anlamına gelir.',
                ),
                SimpleTask(
                  title: 'Empati Türleri',
                  description:
                      'Bilişsel empati, başkalarının perspektifini anlama yeteneğidir. Duygusal empati ise başkalarının duygularını hissetme yeteneğidir. Şefkatli empati, başkalarının duygusal durumlarına yardımcı olma arzusudur.',
                ),
              ],
            ),
            Section(
              title: 'Empati Geliştirme Egzersizleri',
              contents: [
                InteractiveExercise(
                  title: 'Aktif Dinleme',
                  description:
                      'Birisi size bir şey anlatırken, aktif bir şekilde dinleyin. Göz teması kurarak, beden dilinizi kullanarak ve dikkatlice dinleyerek karşınızdaki kişiye odaklanın. Dinlediklerinizi tekrar ederek ve onaylayarak geri bildirimde bulunun.',
                  benefit:
                      'Aktif dinleme, karşınızdaki kişinin anlaşıldığını hissetmesini sağlar ve empati kurma yeteneğinizi geliştirir.',
                ),
                InteractiveExercise(
                  title: 'Rol Yapma Egzersizi',
                  description:
                      'Farklı senaryolar oluşturarak ve bu senaryolarda farklı roller oynayarak empati yeteneğinizi geliştirin. Bu egzersiz, başkalarının perspektifini anlama ve onların duygularını hissetme yeteneğinizi artırır.',
                  benefit:
                      'Başkalarının duygusal durumlarını daha iyi anlamanıza yardımcı olur ve duygusal empati yeteneğinizi geliştirir.',
                ),
              ],
            ),
            Section(
              title: 'Empatiyi Günlük Hayata Dahil Etme',
              contents: [
                SimpleTask(
                  title: 'Empati Kurma Fırsatlarını Arama',
                  description:
                      'Günlük hayatınızda empati kurma fırsatlarını arayın. Birisi size bir sorununu anlatırken, onun duygularını anlamaya çalışın ve bu duyguları paylaşın. Küçük jestlerle ve sözlerle destek olun.',
                ),
                SimpleTask(
                  title: 'Empati Geliştirici Kitaplar Okuma',
                  description:
                      'Empati üzerine yazılmış kitaplar okuyarak bilgi ve farkındalığınızı artırın. Bu kitaplar, empati kurma yeteneğinizi geliştirebilir ve empati konusunda derinlemesine bilgi edinmenize yardımcı olabilir.',
                ),
                SimpleTask(
                  title: 'Duygusal Paylaşım',
                  description:
                      'Aileniz, arkadaşlarınız veya iş arkadaşlarınızla duygusal paylaşımlar yapın. Onların duygusal durumlarını anlamaya çalışın ve kendi duygularınızı da paylaşın. Bu, duygusal bağları güçlendirebilir ve karşılıklı empatiyi artırabilir.',
                ),
              ],
            ),
            Section(
              title: 'Empatinin Faydaları',
              contents: [
                SimpleTask(
                  title: 'Sağlıklı İlişkiler',
                  description:
                      'Empati, sağlıklı ve güçlü ilişkiler kurmanın temelidir. Empati kurarak başkalarının duygusal ihtiyaçlarını anlayabilir ve onlara destek olabilirsiniz. Bu da ilişkilerinizi güçlendirir ve derinleştirir.',
                ),
                SimpleTask(
                  title: 'Stres Azaltma',
                  description:
                      'Empati, stres ve çatışmaları azaltmada etkili bir araçtır. Empati kurarak başkalarının bakış açısını anladığınızda, çatışmaları daha yapıcı bir şekilde çözebilir ve stres düzeyinizi düşürebilirsiniz.',
                ),
                SimpleTask(
                  title: 'Duygusal Zeka Gelişimi',
                  description:
                      'Empati, duygusal zekanın önemli bir bileşenidir. Empati kurarak duygusal farkındalığınızı artırabilir ve duygusal zekanızı geliştirebilirsiniz.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'Mentorluk ve Danışmanlık',
                  description:
                      'Empati geliştirme sürecinde bir mentor veya danışmandan destek alın. Mentorlar, size rehberlik ederek empati yeteneğinizi geliştirmenize yardımcı olabilir.',
                ),
                SimpleTask(
                  title: 'Destek Grupları',
                  description:
                      'Benzer hedefleri olan kişilerle bir araya gelerek destek gruplarına katılın. Destek grupları, empati gelişiminizi destekleyebilir ve motivasyon sağlayabilir.',
                ),
              ],
            ),
          ],
        };

      case 7:
        return {
          'appBarTitle': 'Farkındalık Geliştirme',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Farkındalık Nedir?',
          'introductionText':
              'Farkındalık, kişinin kendi düşüncelerinin, duygularının, bedeninin ve çevresinin farkında olma yeteneğidir. Farkındalık, bilinçli olarak anı yaşamak, kendini ve çevresini gözlemlemek ve yargısız bir şekilde kabul etmektir.',
          'sections': [
            Section(
              title: 'Farkındalığı Anlama',
              contents: [
                SimpleTask(
                  title: 'Farkındalık Nedir?',
                  description:
                      'Farkındalık, mevcut anın bilincinde olmak ve bu anda meydana gelen düşünce, duygu ve duyumları gözlemlemektir. Bu, kendimize ve çevremize daha dikkatli ve bilinçli bir şekilde yaklaşmamızı sağlar.',
                ),
                SimpleTask(
                  title: 'Farkındalık Türleri',
                  description:
                      'Temel farkındalık, kendi bedenimizin, düşüncelerimizin ve duygularımızın farkında olmayı içerir. İkinci tür farkındalık ise çevremizde olup bitenlerin bilincinde olmayı ve bunları gözlemlemeyi içerir.',
                ),
              ],
            ),
            Section(
              title: 'Farkındalık Egzersizleri',
              contents: [
                InteractiveExercise(
                  title: 'Nefes Farkındalığı',
                  description:
                      'Bir sandalye veya yerde rahat bir pozisyonda oturun. Nefesinize odaklanın; her nefes alıp vermeyi hissedin. Dikkatiniz dağıldığında, nazikçe nefesinize geri dönün. Bu egzersizi 5-10 dakika boyunca tekrarlayın.',
                  benefit:
                      'Zihni sakinleştirir, stresi azaltır ve anı yaşamayı teşvik eder.',
                ),
                InteractiveExercise(
                  title: 'Vücut Taraması',
                  description:
                      'Uzanın ve gözlerinizi kapatın. Başınızdan ayak parmaklarınıza kadar yavaşça bedeninizin her bir kısmını tarayın. Hangi bölgenin gergin olduğunu ve nasıl hissettiğinizi fark edin. Her bölgeye odaklanarak rahatlatmaya çalışın.',
                  benefit:
                      'Bedenin farkında olmayı ve fiziksel gerginlikleri azaltmayı sağlar.',
                ),
              ],
            ),
            Section(
              title: 'Günlük Farkındalık Uygulamaları',
              contents: [
                SimpleTask(
                  title: 'Günlük Hayatta Farkındalık',
                  description:
                      'Günlük rutinlerinizi bilinçli olarak yapın. Örneğin, yemek yerken her lokmanın tadını çıkarın, yürürken adımlarınızı hissedin ve çevrenizi gözlemleyin.',
                ),
                SimpleTask(
                  title: 'Duygu ve Düşünce Günlüğü',
                  description:
                      'Günlük olarak hissettiğiniz duyguları ve düşündüğünüz şeyleri bir günlüğe yazın. Bu, duygusal farkındalığınızı artırır ve düşüncelerinizi gözlemlemenizi sağlar.',
                ),
                SimpleTask(
                  title: 'Farkındalık Yürüyüşü',
                  description:
                      'Dışarıda yürüyüşe çıktığınızda çevrenizi bilinçli olarak gözlemleyin. Ağaçların, çiçeklerin ve binaların detaylarına dikkat edin. Her adımda zemini ve rüzgarı hissedin.',
                ),
              ],
            ),
            Section(
              title: 'Farkındalığın Faydaları',
              contents: [
                SimpleTask(
                  title: 'Stres Azaltma',
                  description:
                      'Farkındalık uygulamaları, zihni sakinleştirir ve stresi azaltır. Stresli durumlarla başa çıkma yeteneğinizi artırır.',
                ),
                SimpleTask(
                  title: 'Duygusal Denge',
                  description:
                      'Farkındalık, duygusal tepkilerinizi daha iyi yönetmenize yardımcı olur ve duygusal denge sağlar. Duygusal farkındalık, daha sağlıklı ilişkiler kurmanıza katkıda bulunur.',
                ),
                SimpleTask(
                  title: 'Odaklanma ve Verimlilik',
                  description:
                      'Farkındalık uygulamaları, odaklanma yeteneğinizi artırır ve verimliliğinizi yükseltir. Günlük işlerinizi daha dikkatli ve etkili bir şekilde yapmanızı sağlar.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'Farkındalık Uygulamaları ve Kursları',
                  description:
                      'Farkındalık uygulamaları ve meditasyon kurslarına katılarak profesyonel rehberlik alın. Bu kurslar, farkındalık becerilerinizi geliştirmede size yardımcı olabilir.',
                ),
                SimpleTask(
                  title: 'Destek Grupları',
                  description:
                      'Benzer hedefleri olan kişilerle bir araya gelerek destek gruplarına katılın. Destek grupları, farkındalık gelişiminizi destekleyebilir ve motivasyon sağlayabilir.',
                ),
              ],
            ),
          ],
        };

      case 8:
        return {
          'appBarTitle': 'İletişim Becerileri Geliştirme',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'İletişim Becerilerinin Önemi',
          'introductionText':
              'İletişim becerileri, bireylerin kendilerini ifade etme, başkalarını anlama ve etkili iletişim kurma yeteneklerini içerir. Güçlü iletişim becerileri, sağlıklı ve başarılı ilişkiler kurmanın anahtarıdır.',
          'sections': [
            Section(
              title: 'İletişim Becerilerini Anlama',
              contents: [
                SimpleTask(
                  title: 'İletişim Nedir?',
                  description:
                      'İletişim, düşüncelerin, duyguların ve bilgilerin paylaşılmasıdır. Sözlü, yazılı ve beden dili ile iletişim kurabiliriz. Etkili iletişim, mesajların doğru bir şekilde iletilmesini ve anlaşılmasını sağlar.',
                ),
                SimpleTask(
                  title: 'Etkili İletişimin Unsurları',
                  description:
                      'Etkili iletişim, açık ve net ifadeler, aktif dinleme, empati kurma ve geri bildirim verme gibi unsurları içerir. Bu unsurlar, iletişimi daha etkili hale getirir ve anlaşmazlıkları önler.',
                ),
              ],
            ),
            Section(
              title: 'İletişim Becerilerini Geliştirme Egzersizleri',
              contents: [
                InteractiveExercise(
                  title: 'Aktif Dinleme Egzersizi',
                  description:
                      'Birisi size bir şey anlattığında, dikkatlice dinleyin. Göz teması kurarak, başınızı sallayarak ve beden dilinizi kullanarak dinlediğinizi gösterin. Karşınızdaki kişinin söylediklerini tekrar ederek geri bildirimde bulunun.',
                  benefit:
                      'Aktif dinleme, karşılıklı anlayışı artırır ve iletişimi güçlendirir.',
                ),
                InteractiveExercise(
                  title: 'Empati Egzersizi',
                  description:
                      'Bir arkadaşınız veya aile üyeniz size bir olay anlattığında, onun duygularını anlamaya çalışın ve empati kurun. Onun bakış açısından düşünerek ve duygularını paylaşarak geri bildirimde bulunun.',
                  benefit:
                      'Empati, iletişim becerilerini geliştirir ve duygusal bağları güçlendirir.',
                ),
              ],
            ),
            Section(
              title: 'Günlük İletişim Becerileri Uygulamaları',
              contents: [
                SimpleTask(
                  title: 'Açık ve Net Konuşma',
                  description:
                      'Konuşurken açık ve net ifadeler kullanın. Düşüncelerinizi ve duygularınızı doğrudan ve anlaşılır bir şekilde ifade edin.',
                ),
                SimpleTask(
                  title: 'Geribildirim Verme ve Alma',
                  description:
                      'İletişim sırasında karşı tarafın söylediklerine geri bildirim verin. Onların görüşlerine değer verdiğinizi gösterin ve aynı şekilde, size verilen geribildirimleri dikkatlice dinleyin ve değerlendirin.',
                ),
                SimpleTask(
                  title: 'Beden Dili Kullanma',
                  description:
                      'İletişim sırasında beden dilinizi kullanarak mesajlarınızı güçlendirin. Göz teması kurmak, gülümsemek, el hareketleri ve duruşunuzla mesajlarınızı destekleyin.',
                ),
              ],
            ),
            Section(
              title: 'İletişim Becerilerinin Faydaları',
              contents: [
                SimpleTask(
                  title: 'Güçlü İlişkiler',
                  description:
                      'Etkili iletişim, sağlıklı ve güçlü ilişkiler kurmanın temelidir. Açık ve dürüst iletişim, karşılıklı güven ve anlayış oluşturur.',
                ),
                SimpleTask(
                  title: 'İş Hayatında Başarı',
                  description:
                      'İyi iletişim becerileri, iş hayatında başarılı olmanın anahtarıdır. İş arkadaşlarınız ve yöneticilerinizle etkili iletişim kurmak, işbirliğini artırır ve kariyerinizi ilerletir.',
                ),
                SimpleTask(
                  title: 'Kişisel Gelişim',
                  description:
                      'İletişim becerilerini geliştirmek, kişisel gelişiminizin bir parçasıdır. Kendinizi daha iyi ifade edebilir, başkalarını daha iyi anlayabilir ve duygusal zekanızı artırabilirsiniz.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'İletişim Kursları ve Eğitimleri',
                  description:
                      'İletişim becerilerinizi geliştirmek için kurslara ve eğitimlere katılın. Bu programlar, size pratik yapma ve uzmanlardan geri bildirim alma fırsatı sunar.',
                ),
                SimpleTask(
                  title: 'Mentorluk ve Danışmanlık',
                  description:
                      'İletişim becerilerinizi geliştirme sürecinde bir mentor veya danışmandan destek alın. Mentorlar, size rehberlik ederek iletişim yeteneklerinizi geliştirmenize yardımcı olabilir.',
                ),
              ],
            ),
          ],
        };

      case 9:
        return {
          'appBarTitle': 'Kariyer Yönetimi',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Kariyer Yönetiminin Önemi',
          'introductionText':
              'Kariyer yönetimi, bireyin kariyer hedeflerini belirleme, bu hedeflere ulaşma yollarını planlama ve kariyer yolculuğunu yönetme sürecidir. Etkili kariyer yönetimi, kişisel ve profesyonel gelişimi destekler ve başarıyı artırır.',
          'sections': [
            Section(
              title: 'Kariyer Planlaması',
              contents: [
                SimpleTask(
                  title: 'Kariyer Hedefleri Belirleme',
                  description:
                      'Kariyerinizde neyi başarmak istediğinizi belirleyin. Kısa, orta ve uzun vadeli hedefler koyarak bu hedeflere ulaşmak için adımlar planlayın.',
                ),
                SimpleTask(
                  title: 'Kendini Değerlendirme',
                  description:
                      'Güçlü yönlerinizi, zayıf yönlerinizi, ilgi alanlarınızı ve değerlerinizi değerlendirin. Kendinizi daha iyi tanıyarak kariyer hedeflerinizi daha net belirleyebilirsiniz.',
                ),
              ],
            ),
            Section(
              title: 'Kariyer Gelişimi',
              contents: [
                InteractiveExercise(
                  title: 'Beceri Geliştirme',
                  description:
                      'Kariyerinizde ilerlemek için gerekli becerileri belirleyin ve bu becerileri geliştirmek için eğitimler, kurslar veya sertifikasyon programlarına katılın.',
                  benefit:
                      'Gelişmiş beceriler, iş performansınızı artırır ve kariyer fırsatlarınızı genişletir.',
                ),
                InteractiveExercise(
                  title: 'Mentorluk ve Danışmanlık',
                  description:
                      'Bir mentor veya kariyer danışmanından destek alın. Mentorlar, kariyer yolculuğunuzda size rehberlik edebilir ve değerli geri bildirimler sunabilir.',
                  benefit:
                      'Kariyer hedeflerinize ulaşmanız için rehberlik ve motivasyon sağlar.',
                ),
              ],
            ),
            Section(
              title: 'İş Arama Stratejileri',
              contents: [
                SimpleTask(
                  title: 'Etkili Özgeçmiş Hazırlama',
                  description:
                      'Güçlü yönlerinizi ve deneyimlerinizi vurgulayan etkili bir özgeçmiş hazırlayın. Özgeçmişinizin profesyonel ve dikkat çekici olmasına özen gösterin.',
                ),
                SimpleTask(
                  title: 'Networking',
                  description:
                      'Profesyonel ağınızı genişletin ve sektörünüzdeki insanlarla bağlantılar kurun. Etkili bir network, iş fırsatları yaratmada önemli bir rol oynar.',
                ),
                SimpleTask(
                  title: 'Mülakat Hazırlığı',
                  description:
                      'İş görüşmelerine iyi hazırlanarak kendinizi en iyi şekilde ifade edin. Sık sorulan mülakat sorularını çalışın ve etkili yanıtlar hazırlayın.',
                ),
              ],
            ),
            Section(
              title: 'İş ve Özel Hayat Dengesi',
              contents: [
                InteractiveExercise(
                  title: 'Zaman Yönetimi',
                  description:
                      'Günlük görevlerinizi ve sorumluluklarınızı yönetmek için etkili zaman yönetimi teknikleri kullanın. Önceliklerinizi belirleyin ve planlı çalışın.',
                  benefit:
                      'Zaman yönetimi, iş ve özel hayat arasında denge kurmanıza yardımcı olur.',
                ),
                InteractiveExercise(
                  title: 'Stres Yönetimi',
                  description:
                      'Stresli durumlarla başa çıkmak için nefes egzersizleri, meditasyon veya yoga gibi stres yönetimi tekniklerini kullanın.',
                  benefit: 'Stresi azaltır ve genel yaşam kalitenizi artırır.',
                ),
              ],
            ),
            Section(
              title: 'Kariyer Gelişiminde Devamlılık',
              contents: [
                SimpleTask(
                  title: 'Sürekli Öğrenme',
                  description:
                      'Kariyeriniz boyunca sürekli öğrenmeye ve gelişmeye açık olun. Yeni beceriler öğrenmek ve bilgilerinizi güncellemek için fırsatlar arayın.',
                ),
                SimpleTask(
                  title: 'Geribildirim Alma ve Değerlendirme',
                  description:
                      'İş arkadaşlarınızdan, yöneticilerinizden veya mentorlarınızdan düzenli olarak geri bildirim alın. Bu geri bildirimleri değerlendirin ve gelişim alanlarınızı belirleyin.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'Kariyer Danışmanlığı',
                  description:
                      'Kariyer yönetimi konusunda profesyonel danışmanlık alın. Kariyer danışmanları, hedeflerinize ulaşmanız için stratejiler geliştirmede size yardımcı olabilir.',
                ),
                SimpleTask(
                  title: 'Destek Grupları',
                  description:
                      'Benzer kariyer hedefleri olan kişilerle bir araya gelerek destek gruplarına katılın. Destek grupları, motivasyonunuzu artırabilir ve değerli geri bildirimler sağlayabilir.',
                ),
              ],
            ),
          ],
        };

      case 10:
        return {
          'appBarTitle': 'Kendine Güven Geliştirme',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Kendine Güvenin Önemi',
          'introductionText':
              'Kendine güven, kişinin kendi yeteneklerine, değerliliğine ve kararlarına olan inancıdır. Yüksek kendine güven, bireyin yaşam kalitesini artırır, zorluklarla başa çıkmasını kolaylaştırır ve başarıya ulaşmasına yardımcı olur.',
          'sections': [
            Section(
              title: 'Kendine Güveni Anlama',
              contents: [
                SimpleTask(
                  title: 'Kendine Güven Nedir?',
                  description:
                      'Kendine güven, kişinin kendi yeteneklerine ve değerine olan inancıdır. Bu, kişinin hedeflerine ulaşma, kararlar alma ve zorluklarla başa çıkma konusundaki güvenini yansıtır.',
                ),
                SimpleTask(
                  title: 'Kendine Güvenin Unsurları',
                  description:
                      'Kendini tanıma, olumlu düşünme, hedef belirleme ve başarıları kutlama gibi unsurlar, kendine güveni oluşturur ve geliştirir. Bu unsurlar, bireyin kendine olan güvenini pekiştirir.',
                ),
              ],
            ),
            Section(
              title: 'Kendine Güven Geliştirme Egzersizleri',
              contents: [
                InteractiveExercise(
                  title: 'Günlük Olumlama Egzersizi',
                  description:
                      'Her gün kendinize olumlu şeyler söyleyin. "Başarabilirim", "Değerliyim" ve "Yetenekliyim" gibi olumlamaları tekrar ederek kendinize olan güveninizi artırın.',
                  benefit:
                      'Olumlu düşünme alışkanlığını geliştirir ve kendine güveni artırır.',
                ),
                InteractiveExercise(
                  title: 'Başarı Günlüğü Tutma',
                  description:
                      'Her gün veya hafta sonunda başardığınız şeyleri yazın. Küçük veya büyük fark etmeksizin başarılarınızı yazarak kendinize olan güveninizi pekiştirin.',
                  benefit:
                      'Başarılarınızı fark etmenizi sağlar ve kendine olan güveninizi artırır.',
                ),
              ],
            ),
            Section(
              title: 'Günlük Kendine Güven Uygulamaları',
              contents: [
                SimpleTask(
                  title: 'Kendinize İyi Bakma',
                  description:
                      'Kendinize fiziksel, zihinsel ve duygusal olarak iyi bakın. Sağlıklı beslenme, düzenli egzersiz ve yeterli uyku gibi alışkanlıklar, kendinize olan güveninizi artırır.',
                ),
                SimpleTask(
                  title: 'Olumlu İnsanlarla Çevrili Olma',
                  description:
                      'Kendinize güvenen, destekleyici ve olumlu insanlarla vakit geçirin. Bu kişiler, sizi motive eder ve kendinize olan güveninizi artırır.',
                ),
                SimpleTask(
                  title: 'Küçük Adımlarla Hedeflere Ulaşma',
                  description:
                      'Büyük hedefleri küçük adımlara bölerek başlayın. Küçük adımlarla ilerlemek, başarı hissi yaratarak kendinize olan güveninizi artırır.',
                ),
              ],
            ),
            Section(
              title: 'Kendine Güvenin Faydaları',
              contents: [
                SimpleTask(
                  title: 'İş Hayatında Başarı',
                  description:
                      'Yüksek kendine güven, iş hayatında başarılı olmanıza yardımcı olur. Kendine güvenen bireyler, daha iyi kararlar alır ve zorluklarla başa çıkmada daha etkili olur.',
                ),
                SimpleTask(
                  title: 'Sağlıklı İlişkiler',
                  description:
                      'Kendine güven, sağlıklı ve dengeli ilişkiler kurmanın anahtarıdır. Kendine güvenen bireyler, karşılıklı saygıya dayalı ilişkiler geliştirir ve sürdürür.',
                ),
                SimpleTask(
                  title: 'Duygusal Denge',
                  description:
                      'Kendine güven, duygusal denge sağlar. Zorluklarla başa çıkarken daha az stres yaşar ve daha olumlu bir bakış açısına sahip olursunuz.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'Kendine Güven Eğitimi',
                  description:
                      'Kendine güveni geliştirmek için eğitim ve seminerlere katılın. Bu programlar, özgüveninizi artırmak için pratik yapma ve uzmanlardan geri bildirim alma fırsatı sunar.',
                ),
                SimpleTask(
                  title: 'Destek Grupları',
                  description:
                      'Benzer hedefleri olan kişilerle bir araya gelerek destek gruplarına katılın. Destek grupları, motivasyonunuzu artırabilir ve kendine güveninizi geliştirebilir.',
                ),
              ],
            ),
          ],
        };

      case 11:
        return {
          'appBarTitle': 'Kişisel Gelişim',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Kişisel Gelişimin Önemi',
          'introductionText':
              'Kişisel gelişim, bireyin potansiyelini gerçekleştirmek için kendini sürekli olarak geliştirme sürecidir. Bu süreç, yetenekleri ve becerileri geliştirme, duygusal zekayı artırma, hedefler belirleme ve başarıya ulaşma çabalarını içerir.',
          'sections': [
            Section(
              title: 'Kişisel Gelişim Hedefleri Belirleme',
              contents: [
                SimpleTask(
                  title: 'Kısa ve Uzun Vadeli Hedefler',
                  description:
                      'Hayatınızda neyi başarmak istediğinizi belirleyin. Kısa vadeli (3-6 ay), orta vadeli (1-3 yıl) ve uzun vadeli (5-10 yıl) hedefler koyarak bu hedeflere ulaşmak için adımlar planlayın.',
                ),
                SimpleTask(
                  title: 'Kendini Değerlendirme',
                  description:
                      'Güçlü yönlerinizi, zayıf yönlerinizi, ilgi alanlarınızı ve değerlerinizi değerlendirerek kişisel gelişim hedeflerinizi netleştirin. Kendinizi tanıyarak, neleri geliştirmek istediğinizi daha iyi anlayabilirsiniz.',
                ),
              ],
            ),
            Section(
              title: 'Kişisel Gelişimi Destekleyen Egzersizler',
              contents: [
                InteractiveExercise(
                  title: 'Pozitif Düşünme Egzersizi',
                  description:
                      'Her gün kendinize olumlu şeyler söyleyin. "Başarabilirim", "Değerliyim" ve "Yetenekliyim" gibi olumlamaları tekrar ederek pozitif bir düşünce yapısı oluşturun.',
                  benefit:
                      'Olumlu düşünme alışkanlığını geliştirir ve kendinize olan güveninizi artırır.',
                ),
                InteractiveExercise(
                  title: 'Kendine Yatırım Yapma',
                  description:
                      'Yeni beceriler öğrenmek ve mevcut becerilerinizi geliştirmek için kurslara, seminerlere veya online eğitimlere katılın. Bu, kendinize yatırım yapmanın önemli bir yoludur.',
                  benefit:
                      'Kişisel ve profesyonel gelişimi destekler, özgüveni artırır.',
                ),
              ],
            ),
            Section(
              title: 'Günlük Kişisel Gelişim Uygulamaları',
              contents: [
                SimpleTask(
                  title: 'Düzenli Okuma',
                  description:
                      'Her gün en az 30 dakika kitap, makale veya kişisel gelişimle ilgili içerikler okuyun. Bu, bilgi birikiminizi artırır ve zihninizi açar.',
                ),
                SimpleTask(
                  title: 'Yazma Alışkanlığı',
                  description:
                      'Duygu ve düşüncelerinizi ifade etmek için günlük tutun. Bu, duygusal farkındalığınızı artırır ve düşüncelerinizi netleştirir.',
                ),
                SimpleTask(
                  title: 'Fiziksel Aktivite',
                  description:
                      'Düzenli egzersiz yapın. Fiziksel aktivite, hem bedensel hem de zihinsel sağlığınızı iyileştirir ve kendinize olan güveninizi artırır.',
                ),
              ],
            ),
            Section(
              title: 'Kişisel Gelişimin Faydaları',
              contents: [
                SimpleTask(
                  title: 'Kariyer Başarısı',
                  description:
                      'Kişisel gelişim, kariyer hedeflerinize ulaşmanıza yardımcı olur. Yeni beceriler öğrenmek ve mevcut becerileri geliştirmek, iş performansınızı artırır ve kariyer fırsatlarınızı genişletir.',
                ),
                SimpleTask(
                  title: 'Sağlıklı İlişkiler',
                  description:
                      'Kişisel gelişim, daha sağlıklı ve dengeli ilişkiler kurmanıza katkıda bulunur. Empati kurma, iletişim becerilerini geliştirme ve duygusal zekayı artırma, ilişkilerinizi güçlendirir.',
                ),
                SimpleTask(
                  title: 'Duygusal Denge',
                  description:
                      'Kişisel gelişim, duygusal denge sağlar. Kendi duygularınızı ve düşüncelerinizi daha iyi anlamanızı ve yönetmenizi sağlar.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'Kişisel Gelişim Kursları',
                  description:
                      'Kişisel gelişimle ilgili kurslara ve seminerlere katılarak profesyonel rehberlik alın. Bu programlar, gelişiminizi destekleyecek bilgi ve beceriler sunar.',
                ),
                SimpleTask(
                  title: 'Mentorluk ve Danışmanlık',
                  description:
                      'Kişisel gelişim sürecinde bir mentor veya danışmandan destek alın. Mentorlar, hedeflerinize ulaşmanız için rehberlik ve motivasyon sağlar.',
                ),
              ],
            ),
          ],
        };

      case 12:
        return {
          'appBarTitle': 'Meditasyon',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Meditasyonun Önemi',
          'introductionText':
              'Meditasyon, zihni sakinleştirmek, farkındalığı artırmak ve duygusal dengeyi sağlamak için uygulanan bir tekniktir. Düzenli meditasyon yapmak, stresle başa çıkmayı kolaylaştırır, ruh halini iyileştirir ve genel sağlığı destekler.',
          'sections': [
            Section(
              title: 'Meditasyon Nedir?',
              contents: [
                SimpleTask(
                  title: 'Meditasyonun Tanımı',
                  description:
                      'Meditasyon, zihni odaklayarak ve sakinleştirerek ruhsal bir farkındalık durumu yaratmayı amaçlayan bir uygulamadır. Meditasyon teknikleri, derin nefes almayı, odaklanmayı ve rahatlamayı içerir.',
                ),
                SimpleTask(
                  title: 'Meditasyonun Faydaları',
                  description:
                      'Düzenli meditasyon yapmak stres düzeylerini azaltır, anksiyeteyi hafifletir, odaklanmayı artırır ve duygusal dengeyi sağlar. Meditasyon ayrıca uyku kalitesini iyileştirir ve genel sağlık üzerinde olumlu etkiler yaratır.',
                ),
              ],
            ),
            Section(
              title: 'Meditasyon Teknikleri',
              contents: [
                InteractiveExercise(
                  title: 'Nefes Farkındalığı Meditasyonu',
                  description:
                      'Rahat bir pozisyonda oturun ve gözlerinizi kapatın. Nefesinize odaklanın, her nefesi içeri ve dışarı alırken farkına varın. Dikkatiniz dağıldığında, nazikçe nefesinize geri dönün. Bu egzersizi 10-15 dakika boyunca tekrarlayın.',
                  benefit:
                      'Zihni sakinleştirir, stresi azaltır ve odaklanmayı artırır.',
                ),
                InteractiveExercise(
                  title: 'Rehberli Meditasyon',
                  description:
                      'Rehberli meditasyon uygulamaları veya ses kayıtları eşliğinde meditasyon yapın. Rehberli meditasyon, meditasyon sürecini yönlendiren bir kişinin sesini takip etmenizi sağlar ve meditasyonun daha derin ve odaklanmış olmasına yardımcı olur.',
                  benefit:
                      'Daha derin bir meditasyon deneyimi sağlar ve yeni başlayanlar için rehberlik sunar.',
                ),
              ],
            ),
            Section(
              title: 'Günlük Meditasyon Uygulamaları',
              contents: [
                SimpleTask(
                  title: 'Günlük Meditasyon Zamanı Ayırma',
                  description:
                      'Her gün belirli bir süre meditasyon yapmak için zaman ayırın. Sabahları veya akşamları meditasyon yaparak günlük rutininize dahil edebilirsiniz. Düzenli meditasyon pratiği, zihinsel ve duygusal sağlığınızı destekler.',
                ),
                SimpleTask(
                  title: 'Sessiz Bir Ortam Yaratma',
                  description:
                      'Meditasyon yaparken sessiz ve sakin bir ortam yaratın. Gürültü ve dikkat dağıtıcı unsurlardan uzak bir alan seçin. Bu, meditasyon sürecinin daha etkili olmasını sağlar.',
                ),
                SimpleTask(
                  title: 'Meditasyon Pozisyonu',
                  description:
                      'Meditasyon yaparken rahat bir pozisyon bulun. Oturarak veya uzanarak meditasyon yapabilirsiniz. Vücudunuzun rahat olduğundan emin olun ve omurganızı düz tutmaya özen gösterin.',
                ),
              ],
            ),
            Section(
              title: 'Meditasyonun Faydaları',
              contents: [
                SimpleTask(
                  title: 'Stres Azaltma',
                  description:
                      'Meditasyon, stres düzeylerini azaltmada etkili bir tekniktir. Düzenli meditasyon yapmak, stresle başa çıkma becerilerinizi artırır ve genel yaşam kalitenizi iyileştirir.',
                ),
                SimpleTask(
                  title: 'Duygusal Denge',
                  description:
                      'Meditasyon, duygusal dengeyi sağlar ve duygusal tepkilerinizi yönetmenize yardımcı olur. Meditasyon pratiği, daha sakin ve huzurlu bir ruh hali yaratır.',
                ),
                SimpleTask(
                  title: 'Odaklanma ve Konsantrasyon',
                  description:
                      'Meditasyon, zihni odaklamayı ve konsantrasyonu artırır. Düzenli meditasyon pratiği, zihinsel berraklığı ve üretkenliği destekler.',
                ),
                SimpleTask(
                  title: 'Uyku Kalitesi',
                  description:
                      'Meditasyon, uyku kalitesini iyileştirir. Meditasyon yaparak rahatladığınızda, uykuya dalmanız ve dinlendirici bir uyku almanız daha kolay olur.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'Meditasyon Uygulamaları ve Kursları',
                  description:
                      'Meditasyon uygulamaları ve kurslarına katılarak profesyonel rehberlik alın. Bu programlar, meditasyon becerilerinizi geliştirmenize ve derinleştirmenize yardımcı olabilir.',
                ),
                SimpleTask(
                  title: 'Destek Grupları',
                  description:
                      'Benzer hedefleri olan kişilerle bir araya gelerek meditasyon destek gruplarına katılın. Destek grupları, meditasyon pratiğinizi sürdürmenize ve motivasyon sağlamanıza yardımcı olabilir.',
                ),
              ],
            ),
          ],
        };

      case 13:
        return {
          'appBarTitle': 'Öz Bakım',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Öz Bakımın Önemi',
          'introductionText':
              'Öz bakım, bireyin fiziksel, zihinsel ve duygusal sağlığını koruma ve iyileştirme sürecidir. Öz bakım, sağlıklı yaşam alışkanlıkları oluşturmayı, stresle başa çıkmayı ve genel iyilik halini artırmayı amaçlar.',
          'sections': [
            Section(
              title: 'Öz Bakım Nedir?',
              contents: [
                SimpleTask(
                  title: 'Öz Bakımın Tanımı',
                  description:
                      'Öz bakım, bireyin kendi sağlığını ve iyilik halini korumak için yaptığı faaliyetlerdir. Bu, sağlıklı yaşam alışkanlıkları, stres yönetimi ve duygusal bakım gibi unsurları içerir.',
                ),
                SimpleTask(
                  title: 'Öz Bakımın Faydaları',
                  description:
                      'Öz bakım, fiziksel sağlığı korur, zihinsel sağlığı iyileştirir, stres düzeylerini azaltır ve genel yaşam kalitesini artırır. Düzenli öz bakım uygulamaları, bireyin daha mutlu ve dengeli bir yaşam sürmesini sağlar.',
                ),
              ],
            ),
            Section(
              title: 'Fiziksel Öz Bakım',
              contents: [
                InteractiveExercise(
                  title: 'Düzenli Egzersiz',
                  description:
                      'Her gün en az 30 dakika fiziksel aktivite yapın. Yürüyüş, koşu, yoga veya yüzme gibi egzersizler hem bedensel hem de zihinsel sağlığınızı iyileştirir.',
                  benefit:
                      'Fiziksel sağlığı korur ve enerji seviyelerini artırır.',
                ),
                InteractiveExercise(
                  title: 'Sağlıklı Beslenme',
                  description:
                      'Dengeli ve besleyici bir diyet uygulayın. Bol su için, meyve ve sebzeleri diyetinize ekleyin ve işlenmiş gıdalardan kaçının.',
                  benefit: 'Genel sağlık ve enerji seviyelerini iyileştirir.',
                ),
              ],
            ),
            Section(
              title: 'Zihinsel Öz Bakım',
              contents: [
                InteractiveExercise(
                  title: 'Meditasyon ve Farkındalık',
                  description:
                      'Her gün meditasyon yaparak veya farkındalık egzersizleri uygulayarak zihinsel sağlığınızı destekleyin. Bu uygulamalar, stres düzeylerini azaltır ve zihinsel berraklığı artırır.',
                  benefit: 'Zihinsel sağlığı korur ve stresi azaltır.',
                ),
                InteractiveExercise(
                  title: 'Yaratıcı Aktiviteler',
                  description:
                      'Sanat, müzik, yazı yazma veya el işleri gibi yaratıcı aktivitelerle zihninizi meşgul edin. Bu aktiviteler, zihinsel sağlığı iyileştirir ve duygusal dengeyi sağlar.',
                  benefit: 'Zihinsel rahatlama ve duygusal denge sağlar.',
                ),
              ],
            ),
            Section(
              title: 'Duygusal Öz Bakım',
              contents: [
                InteractiveExercise(
                  title: 'Duygu Günlüğü Tutma',
                  description:
                      'Duygularınızı ifade etmek için günlük tutun. Her gün hissettiklerinizi yazmak, duygusal farkındalığınızı artırır ve duygusal dengeyi sağlar.',
                  benefit: 'Duygusal farkındalık ve denge sağlar.',
                ),
                InteractiveExercise(
                  title: 'Pozitif İlişkiler Kurma',
                  description:
                      'Destekleyici ve olumlu ilişkiler kurun. Aile, arkadaşlar ve iş arkadaşlarınızla sağlıklı ve pozitif ilişkiler geliştirerek duygusal sağlığınızı destekleyin.',
                  benefit: 'Duygusal destek ve mutluluk sağlar.',
                ),
              ],
            ),
            Section(
              title: 'Öz Bakım Alışkanlıkları',
              contents: [
                SimpleTask(
                  title: 'Düzenli Uyku',
                  description:
                      'Her gece yeterli ve kaliteli uyku alın. Uyku düzeninizi korumak için belirli bir uyku ve uyanma saati belirleyin.',
                ),
                SimpleTask(
                  title: 'Kendi İhtiyaçlarınıza Öncelik Verme',
                  description:
                      'Kendi ihtiyaçlarınıza ve sınırlarınıza saygı gösterin. Zaman zaman "hayır" demeyi öğrenin ve kendinize zaman ayırın.',
                ),
                SimpleTask(
                  title: 'Stres Yönetimi',
                  description:
                      'Stresle başa çıkmak için nefes egzersizleri, yoga veya meditasyon gibi stres yönetimi tekniklerini kullanın.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'Profesyonel Destek',
                  description:
                      'Öz bakım konusunda zorlanıyorsanız, bir terapist, danışman veya sağlık profesyonelinden destek alın. Profesyonel yardım, öz bakım stratejilerinizi geliştirmenize yardımcı olabilir.',
                ),
                SimpleTask(
                  title: 'Destek Grupları',
                  description:
                      'Benzer hedefleri olan kişilerle bir araya gelerek destek gruplarına katılın. Destek grupları, motivasyonunuzu artırabilir ve öz bakım pratiğinizi sürdürülebilir kılabilir.',
                ),
              ],
            ),
          ],
        };

      case 14:
        return {
          'appBarTitle': 'Stres Yönetimi',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Stres Yönetiminin Önemi',
          'introductionText':
              'Stres yönetimi, bireyin stresle başa çıkma ve stresi etkili bir şekilde yönetme yeteneğidir. Etkili stres yönetimi, duygusal dengeyi sağlar, zihinsel sağlığı korur ve genel yaşam kalitesini artırır.',
          'sections': [
            Section(
              title: 'Stresi Anlama',
              contents: [
                SimpleTask(
                  title: 'Stres Nedir?',
                  description:
                      'Stres, bireyin fiziksel veya zihinsel baskı altında hissettiği tepkidir. Bu, kısa süreli stres (akut stres) veya uzun süreli stres (kronik stres) şeklinde olabilir.',
                ),
                SimpleTask(
                  title: 'Stres Belirtileri',
                  description:
                      'Stres belirtileri arasında hızlı kalp atışı, kas gerginliği, baş ağrıları, uyku problemleri, endişe ve sinirlilik yer alır. Her bireyde belirtiler farklı şekillerde ortaya çıkabilir.',
                ),
              ],
            ),
            Section(
              title: 'Stres Yönetimi Teknikleri',
              contents: [
                InteractiveExercise(
                  title: 'Nefes Egzersizleri',
                  description:
                      'Derin nefes almak, vücudunuzun gevşemesine ve stres düzeylerinizin düşmesine yardımcı olur. Burnunuzdan derin bir nefes alın, birkaç saniye tutun ve ağzınızdan yavaşça nefes verin. Bu egzersizi birkaç dakika boyunca tekrarlayın.',
                  benefit: 'Stresi azaltır ve rahatlama sağlar.',
                ),
                InteractiveExercise(
                  title: 'Farkındalık Meditasyonu',
                  description:
                      'Rahat bir pozisyonda oturun ve dikkatinizi nefesinize veya belirli bir odak noktasına verin. Düşüncelerinizi gözlemleyin ancak onlara takılmayın. Bu egzersizi 10-15 dakika boyunca yaparak zihninizi sakinleştirin.',
                  benefit: 'Zihni sakinleştirir ve stresi azaltır.',
                ),
              ],
            ),
            Section(
              title: 'Günlük Stres Yönetimi Uygulamaları',
              contents: [
                SimpleTask(
                  title: 'Egzersiz Yapma',
                  description:
                      'Düzenli fiziksel aktivite, vücudunuzda stres hormonlarını azaltır ve endorfin salgılanmasını teşvik eder. Yürüyüş, koşu, yoga veya yüzme gibi aktivitelerle stresi azaltın.',
                ),
                SimpleTask(
                  title: 'Sağlıklı Beslenme',
                  description:
                      'Besleyici bir diyet, enerji seviyenizi artırır ve stresle başa çıkmanıza yardımcı olur. İşlenmiş gıdalardan kaçının ve meyve, sebze, tam tahıllar ve protein açısından zengin gıdaları tercih edin.',
                ),
                SimpleTask(
                  title: 'Uyku Düzenine Dikkat Etme',
                  description:
                      'Yeterli uyku, vücudunuzun stresle başa çıkma yeteneğini artırır. Her gece 7-8 saat uyumaya özen gösterin ve düzenli bir uyku rutini oluşturun.',
                ),
              ],
            ),
            Section(
              title: 'Duygusal ve Zihinsel Stres Yönetimi',
              contents: [
                InteractiveExercise(
                  title: 'Pozitif Düşünme ve Olumlama',
                  description:
                      'Gün boyunca kendinize olumlu şeyler söyleyin ve olumsuz düşünceleri pozitife çevirin. "Başarabilirim", "Güçlüyüm" gibi olumlamalarla zihninizi pozitif düşüncelere yönlendirin.',
                  benefit: 'Duygusal denge sağlar ve stresi azaltır.',
                ),
                InteractiveExercise(
                  title: 'Duygusal Paylaşım',
                  description:
                      'Stresli olduğunuzda duygularınızı güvendiğiniz bir arkadaşınız veya aile üyenizle paylaşın. Destek almak, duygusal yükünüzü hafifletir ve stresi yönetmenize yardımcı olur.',
                  benefit: 'Duygusal destek sağlar ve rahatlama yaratır.',
                ),
              ],
            ),
            Section(
              title: 'Stres Yönetiminin Faydaları',
              contents: [
                SimpleTask(
                  title: 'Fiziksel Sağlık',
                  description:
                      'Etkili stres yönetimi, kalp sağlığını korur, bağışıklık sistemini güçlendirir ve genel sağlık durumunu iyileştirir. Stresin fiziksel etkilerini azaltır.',
                ),
                SimpleTask(
                  title: 'Duygusal Denge',
                  description:
                      'Stres yönetimi, duygusal denge sağlar ve duygusal tepkilerinizi daha iyi yönetmenize yardımcı olur. Daha sakin ve dengeli bir ruh hali yaratır.',
                ),
                SimpleTask(
                  title: 'Odaklanma ve Verimlilik',
                  description:
                      'Stres yönetimi, zihinsel berraklığı artırır ve odaklanma yeteneğinizi geliştirir. Daha etkili ve verimli çalışmanıza yardımcı olur.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'Profesyonel Destek',
                  description:
                      'Stresle başa çıkmakta zorlanıyorsanız, bir terapist veya danışmandan destek alın. Profesyonel yardım, stres yönetim stratejilerinizi geliştirmenize yardımcı olabilir.',
                ),
                SimpleTask(
                  title: 'Destek Grupları',
                  description:
                      'Benzer stres yönetimi hedefleri olan kişilerle bir araya gelerek destek gruplarına katılın. Destek grupları, motivasyonunuzu artırabilir ve stresle başa çıkma becerilerinizi geliştirebilir.',
                ),
              ],
            ),
          ],
        };

      case 15:
        return {
          'appBarTitle': 'Uyku Yönetimi',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Uyku Yönetiminin Önemi',
          'introductionText':
              'Uyku, genel sağlık ve iyilik hali için hayati öneme sahiptir. Kaliteli bir uyku, fiziksel ve zihinsel sağlık, ruh hali ve genel yaşam kalitesini iyileştirir. Etkili uyku yönetimi, günlük işlevselliği artırır ve kronik hastalık risklerini azaltır.',
          'sections': [
            Section(
              title: 'Uykunun Önemi',
              contents: [
                SimpleTask(
                  title: 'Uyku Nedir?',
                  description:
                      'Uyku, vücudun ve zihnin yenilenmesi ve onarılması için gereken doğal bir süreçtir. Uyku sırasında vücut, enerji depolarını yeniler, hücreleri onarır ve hafızayı güçlendirir.',
                ),
                SimpleTask(
                  title: 'Uyku Döngüleri',
                  description:
                      'Uyku, REM (hızlı göz hareketi) ve non-REM olmak üzere iki ana döngüden oluşur. Her döngü, fiziksel ve zihinsel onarım süreçleri için önemlidir. Bir gece boyunca, bu döngüler birkaç kez tekrar eder.',
                ),
              ],
            ),
            Section(
              title: 'Uyku Kalitesini Artırma',
              contents: [
                InteractiveExercise(
                  title: 'Uyku Düzeni Oluşturma',
                  description:
                      'Her gece aynı saatte yatağa gidin ve sabah aynı saatte uyanın. Düzenli bir uyku düzeni oluşturmak, biyolojik saatinizi düzenler ve daha kaliteli bir uyku sağlar.',
                  benefit:
                      'Düzenli uyku, vücudunuzun biyolojik saatini düzenler ve uyku kalitesini artırır.',
                ),
                InteractiveExercise(
                  title: 'Rahatlatıcı Bir Uyku Ortamı Yaratma',
                  description:
                      'Yatak odanızı uyku için ideal bir ortam haline getirin. Oda sıcaklığını ayarlayın, karanlık ve sessiz bir ortam sağlayın ve rahat bir yatak kullanın.',
                  benefit:
                      'Rahat bir uyku ortamı, daha derin ve kesintisiz uyku sağlar.',
                ),
              ],
            ),
            Section(
              title: 'Günlük Uyku Alışkanlıkları',
              contents: [
                SimpleTask(
                  title: 'Yatmadan Önce Rahatlama',
                  description:
                      'Yatmadan önce rahatlatıcı bir rutin oluşturun. Ilık bir banyo yapın, kitap okuyun veya hafif bir meditasyon yapın. Bu aktiviteler, vücudunuzun uykuya hazırlanmasına yardımcı olur.',
                ),
                SimpleTask(
                  title: 'Ekran Süresini Sınırlama',
                  description:
                      'Yatmadan en az bir saat önce elektronik cihazları kullanmayı bırakın. Ekranlardan yayılan mavi ışık, uyku hormonu olan melatonin üretimini engelleyebilir ve uykuya dalmayı zorlaştırabilir.',
                ),
                SimpleTask(
                  title: 'Sağlıklı Beslenme ve Egzersiz',
                  description:
                      'Dengeli beslenme ve düzenli egzersiz, uyku kalitesini artırır. Ancak, yatmadan hemen önce ağır yemeklerden ve yoğun egzersizlerden kaçının.',
                ),
              ],
            ),
            Section(
              title: 'Uyku Yönetiminin Faydaları',
              contents: [
                SimpleTask(
                  title: 'Fiziksel Sağlık',
                  description:
                      'Yeterli ve kaliteli uyku, bağışıklık sistemini güçlendirir, kalp sağlığını korur ve obezite riskini azaltır. Ayrıca, vücudun enerji depolarını yeniler ve kasları onarır.',
                ),
                SimpleTask(
                  title: 'Zihinsel Sağlık',
                  description:
                      'Kaliteli uyku, beyin fonksiyonlarını iyileştirir, hafızayı güçlendirir ve bilişsel performansı artırır. Uyku eksikliği, dikkat dağınıklığına ve karar verme becerilerinin zayıflamasına yol açabilir.',
                ),
                SimpleTask(
                  title: 'Ruh Hali ve Duygusal Denge',
                  description:
                      'Yeterli uyku, ruh halini iyileştirir ve duygusal dengeyi sağlar. Uyku eksikliği, anksiyete, depresyon ve stres düzeylerini artırabilir.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'Uyku Bozuklukları İçin Destek',
                  description:
                      'Uyku sorunları yaşıyorsanız, bir uyku uzmanından veya doktordan destek alın. Uyku bozuklukları, profesyonel tedavi gerektirebilir.',
                ),
                SimpleTask(
                  title: 'Uyku İzleme Araçları',
                  description:
                      'Uyku düzeninizi ve kalitenizi izlemek için uyku izleme cihazları veya uygulamalar kullanın. Bu araçlar, uyku alışkanlıklarınızı analiz etmenize ve iyileştirmenize yardımcı olabilir.',
                ),
              ],
            ),
          ],
        };

      case 16:
        return {
          'appBarTitle': 'Zaman Yönetimi',
          'imageUrl': 'https://via.placeholder.com/400',
          'pageTitle': 'Zaman Yönetiminin Önemi',
          'introductionText':
              'Zaman yönetimi, bireylerin zamanlarını etkili ve verimli bir şekilde kullanma sürecidir. Etkili zaman yönetimi, üretkenliği artırır, stresi azaltır ve kişisel ve profesyonel hedeflere ulaşmayı kolaylaştırır.',
          'sections': [
            Section(
              title: 'Zaman Yönetimini Anlama',
              contents: [
                SimpleTask(
                  title: 'Zaman Yönetimi Nedir?',
                  description:
                      'Zaman yönetimi, görevleri ve aktiviteleri planlayarak ve organize ederek zamanı en verimli şekilde kullanma sürecidir. İyi bir zaman yönetimi, öncelikleri belirlemeyi ve görevleri zamanında tamamlamayı içerir.',
                ),
                SimpleTask(
                  title: 'Zamanın Değeri',
                  description:
                      'Zaman sınırlı bir kaynaktır ve etkili kullanılması önemlidir. Zamanı verimli kullanmak, daha fazla iş başarmayı ve kişisel hedeflere ulaşmayı sağlar.',
                ),
              ],
            ),
            Section(
              title: 'Zaman Yönetimi Teknikleri',
              contents: [
                InteractiveExercise(
                  title: 'Görev Listesi Oluşturma',
                  description:
                      'Günlük, haftalık veya aylık olarak yapılacaklar listesi hazırlayın. Görevlerinizi yazılı olarak planlamak, hangi işlerin öncelikli olduğunu belirlemenize yardımcı olur ve motivasyon sağlar.',
                  benefit:
                      'Görevlerin organize edilmesini sağlar ve işlerin tamamlanmasını kolaylaştırır.',
                ),
                InteractiveExercise(
                  title: 'Zaman Bloklama',
                  description:
                      'Belirli görevler için belirli zaman aralıkları ayırın. Zaman bloklama, odaklanmayı artırır ve belirli görevler için yeterli zaman ayırmanıza yardımcı olur.',
                  benefit:
                      'Görevler arasında denge sağlar ve odaklanmayı artırır.',
                ),
              ],
            ),
            Section(
              title: 'Günlük Zaman Yönetimi Uygulamaları',
              contents: [
                SimpleTask(
                  title: 'Öncelikleri Belirleme',
                  description:
                      'Görevlerinizi önem derecesine göre sıralayın. En önemli ve acil olanları önce tamamlayın. Bu, iş yükünüzü yönetmenizi ve önemli işlere odaklanmanızı sağlar.',
                ),
                SimpleTask(
                  title: 'Zaman Kaynaklarını Belirleme',
                  description:
                      'Zamanınızı hangi aktivitelere harcadığınızı analiz edin. Zaman kaybına neden olan aktiviteleri belirleyin ve bunları azaltmaya veya ortadan kaldırmaya çalışın.',
                ),
                SimpleTask(
                  title: 'Molalar Verme',
                  description:
                      'Uzun süreli çalışmalar sırasında kısa molalar verin. Molalar, zihinsel yorgunluğu azaltır ve verimliliği artırır.',
                ),
              ],
            ),
            Section(
              title: 'Zaman Yönetiminin Faydaları',
              contents: [
                SimpleTask(
                  title: 'Artan Üretkenlik',
                  description:
                      'Etkili zaman yönetimi, daha fazla iş başarmayı sağlar. Zamanı verimli kullanmak, daha az zamanda daha çok iş yapmanıza yardımcı olur.',
                ),
                SimpleTask(
                  title: 'Azalan Stres',
                  description:
                      'Görevlerinizi planlamak ve organize etmek, stres düzeylerini azaltır. Belirli bir plana sahip olmak, iş yükünüzü yönetmenizi kolaylaştırır ve kaygıyı azaltır.',
                ),
                SimpleTask(
                  title: 'Gelişmiş İş-Yaşam Dengesi',
                  description:
                      'Etkili zaman yönetimi, iş ve özel yaşam arasında denge sağlar. Zamanı iyi yönetmek, kişisel yaşamınıza daha fazla zaman ayırmanıza olanak tanır.',
                ),
              ],
            ),
            Section(
              title: 'Destek ve Yardım',
              contents: [
                SimpleTask(
                  title: 'Zaman Yönetimi Uygulamaları',
                  description:
                      'Zamanınızı verimli bir şekilde yönetmek için dijital uygulamalar ve araçlar kullanın. Bu uygulamalar, görevlerinizi planlamanıza ve takip etmenize yardımcı olur.',
                ),
                SimpleTask(
                  title: 'Zaman Yönetimi Eğitimi',
                  description:
                      'Zaman yönetimi becerilerinizi geliştirmek için eğitimlere ve seminerlere katılın. Bu programlar, zaman yönetimi stratejilerini öğrenmenize ve uygulamanıza yardımcı olabilir.',
                ),
              ],
            ),
          ],
        };

      // Diğer sayfalar buraya eklenebilir...
      default:
        return null; // Geçersiz sayfa
    }
  }
}
