import 'package:flutter_travel_app/data/model/home_screen_model.dart';
import 'package:flutter_travel_app/data/repo/travel_repo.dart';

class TravelRepoImpl extends TravelRepo {
  @override
  Future<HomeScreenModel> getHomeScreenModelData() async {
    return HomeScreenModel(
      profileInfo: ProfileInfo(
        name: 'Shivam',
        imageUrl:
            'https://images.unsplash.com/photo-1703368068320-188aafd42ed3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwcm9maWxlLXBhZ2V8MXx8fGVufDB8fHx8fA%3D%3D',
      ),
      placesList: const [
        'Mount Fuji, Tokyo',
        'Manali, Himanchal Pradesh',
        'New Delhi, Delhi',
        'Jaipur, Rajasthan',
        'Amsterdam, Netherland',
      ],
      placesListDetailed: [
        PlacesListDetailed(
            url:
                'https://images.unsplash.com/photo-1627894483216-2138af692e32?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dmFyYW5hc2l8ZW58MHx8MHx8fDA%3D',
            placeName: 'Varanasi, India',
            capitalName: 'Varanasi',
            countryName: 'India',
            rating: '4.9',
            price: '150',
            temperature: '18',
            travelTime: '10',
            description:
                'Varanasi also Benares, Banaras or Kashi is a city on the Ganges river in northern India that has a central place in the traditions of pilgrimage, death, and mourning in the Hindu world.[17][b] The city has a syncretic tradition of Muslim artisanship that underpins its religious tourism.[20] Located in the middle-Ganges valley in the southeastern part of the state of Uttar Pradesh, Varanasi lies on the left bank of the river. It is 692 kilometres (430 mi) to the southeast of Indias capital New Delhi and 320 kilometres (200 mi) to the southeast of the state capital, Lucknow. It lies 121 kilometres (75 mi) downstream of Prayagraj, where the confluence with the Yamuna river is another major Hindu pilgrimage site. Varanasi, the centre of the Bhojpuri cultural region is one of the worlds oldest continually inhabited cities.[21][22][23] Kashi, its ancient name, was associated with a kingdom of the same name of 2,500 years ago. The Lion capital of Ashoka at nearby Sarnath has been interpreted to be a commemoration of the Buddhas first sermon there in the fifth century BCE.[24][25] In the 8th century, Adi Shankara established the worship of Shiva as an official sect of Varanasi. Tulsidas wrote his Awadhi language epic, the Ramcharitmanas, a Bhakti movement reworking of the Sanskrit Ramayana, in Varanasi. Several other major figures of the Bhakti movement were born in Varanasi, including Kabir and Ravidas.[26] In the 16th century, Rajput nobles in the service of the courts and armies of the Mughal emperor Akbar, sponsored the building or further enhancement of the major Shiva temple in the city; they also built other temples, all displaying an empire-wide architectural style.[27][28] Under the Treaty of Faizabad, the East India Company acquired Benares in 1775,[29][30] the city later successively becoming a part of the Benares Division in the Ceded and Conquered Provinces, the North-Western Provinces, and the United Provinces, and after Indias independence of Uttar Pradesh.'),
        PlacesListDetailed(
            url:
                'https://images.unsplash.com/photo-1606667544139-81e47935d769?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fG1hbmFsaXxlbnwwfHwwfHx8MA%3D%3D',
            placeName: 'Manali, Himachal Pradesh',
            capitalName: 'Shimla',
            countryName: 'India',
            rating: '4.2',
            price: '230',
            temperature: '12',
            travelTime: '5',
            description:
                'Manali is a town, near Kullu town in Kullu district in the Indian state of Himachal Pradesh.[2] It is situated in the northern end of the Kullu Valley, formed by the Beas River. The town is located in the Kullu district, approximately 270 kilometres (170 mi) north of the state capital of Shimla and 544 kilometres (338 mi) northeast of the national capital of New Delhi. With a population of 8,096 people recorded in the 2011 Indian census Manali is the beginning of an ancient trade route through Lahaul (H.P) and Ladakh, over the Karakoram Pass and onto Yarkand and Hotan in the Tarim Basin of China. Manali is a popular tourist destination in India and serves as the gateway to the Lahaul and Spiti district as well as the city of Leh in Ladakh.'),
        PlacesListDetailed(
          url:
              'https://images.unsplash.com/photo-1536098561742-ca998e48cbcc?q=80&w=2036&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          placeName: 'Mount Fuji, Tokyo',
          capitalName: 'Tokyo',
          countryName: 'Japan',
          rating: '4.5',
          price: '250',
          temperature: '16',
          travelTime: '8',
          description:
              'Mount Fuji is an active stratovolcano located on the Japanese island of Honshū, with a summit elevation of 3,776.24 m (12,389 ft 3 in). It is the tallest mountain in Japan, the second-highest volcano located on an island in Asia (after Mount Kerinci on the island of Sumatra), and seventh-highest peak of an island on Earth.[1] Mount Fuji last erupted from 1707 to 1708.[4][5] The mountain is located about 100 km (62 mi) southwest of Tokyo and is visible from the Japanese capital on clear days. Mount Fujis exceptionally symmetrical cone, which is covered in snow for about five months of the year, is commonly used as a cultural icon of Japan and is frequently depicted in art and photography, as well as visited by sightseers, hikers and mountain climbers.',
        ),
        PlacesListDetailed(
          url:
              'https://images.unsplash.com/photo-1598977054780-2dc700fdc9d3?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          placeName: 'New Delhi, Delhi',
          capitalName: 'New Delhi',
          countryName: 'India',
          rating: '4.7',
          price: '20',
          temperature: '18',
          travelTime: '1',
          description:
              'New Delhi is the capital of India and a part of the National Capital Territory of Delhi (NCT). New Delhi is the seat of all three branches of the Government of India, hosting the Rashtrapati Bhavan, Sansad Bhavan, and the Supreme Court. New Delhi is a municipality within the NCT, administered by the NDMC, which covers mostly Lutyens Delhi and a few adjacent areas. The municipal area is part of a larger administrative district, the New Delhi district.',
        ),
        PlacesListDetailed(
          url:
              'https://images.unsplash.com/photo-1599661046289-e31897846e41?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8amFpcHVyfGVufDB8fDB8fHww',
          placeName: 'Jaipur, Rajasthan',
          capitalName: 'Jaipur',
          countryName: 'India',
          rating: '4.1',
          price: '80',
          temperature: '20',
          travelTime: '3',
          description:
              'Jaipur formerly Jeypore, is the capital and the largest city of the Indian state of Rajasthan. As of 2011, the city has a population of 3.1 million, making it the tenth most populous city in the country. Jaipur is also known as the Pink City due to the dominant colour scheme of its buildings and as the Paris of India. C. V. Raman called it the Island of Glory. It is located 268 km (167 miles) from the national capital New Delhi. Jaipur was founded in 1727 by the Kachhwaha Rajput ruler Jai Singh II,[12][13] the ruler of Amer, after whom the city is named. It is one of the earliest planned cities of modern India, designed by Vidyadhar Bhattacharya.[14] During the British Colonial period, the city served as the capital of Jaipur State. After independence in 1947, Jaipur was made the capital of the newly formed state of Rajasthan.',
        ),
        PlacesListDetailed(
          url:
              'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGFyaXN8ZW58MHx8MHx8fDA%3D',
          placeName: 'Paris, France',
          capitalName: 'Paris',
          countryName: 'France',
          rating: '4.9',
          price: '500',
          temperature: '12',
          travelTime: '19',
          description:
              'Paris is the capital and most populous city of France. With an official estimated population of 2,102,650 residents as of 1 January 2023[2] in an area of more than 105 km2 (41 sq mi),[5] Paris is the fifth-most populated city in the European Union and the 30th most densely populated city in the world in 2022.[6] Since the 17th century, Paris has been one of the worlds major centres of finance, diplomacy, commerce, culture, fashion, and gastronomy. For its leading role in the arts and sciences, as well as its early and extensive system of street lighting, in the 19th century, it became known as the City of Light.',
        ),
        PlacesListDetailed(
          url:
              'https://images.unsplash.com/photo-1567157577867-05ccb1388e66?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bXVtYmFpfGVufDB8fDB8fHww',
          placeName: 'Mumbai, India',
          capitalName: 'Mumbai',
          countryName: 'India',
          rating: '4.3',
          price: '130',
          temperature: '24',
          travelTime: '11',
          description:
              'Mumbai formerly known as Bombay[a] — the official name until 1995) is the capital city of the Indian state of Maharashtra. Mumbai is the de facto financial centre and the most populous city of India with an estimated city proper population of 12.5 million (1.25 crore).[19] Mumbai is the centre of the Mumbai Metropolitan Region, the sixth most populous metropolitan area in the world with a population of over 23 million (2.3 crore) living within the Mumbai Metropolitan Region.[20] Mumbai lies on the Konkan coast on the west coast of India and has a deep natural harbour. In 2008, Mumbai was named an alpha world city.',
        ),
        PlacesListDetailed(
          url:
              'https://images.unsplash.com/photo-1520986606214-8b456906c813?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGxvbmRvbnxlbnwwfHwwfHx8MA%3D%3D',
          placeName: 'London, UK',
          capitalName: 'London',
          countryName: 'UK',
          rating: '4.5',
          price: '600',
          temperature: '14',
          travelTime: '28',
          description:
              'London is the capital and largest city of England and the United Kingdom, with a population of around 8.8 million.[1][note 1] It stands on the River Thames in south-east England at the head of a 50-mile (80 km) estuary down to the North Sea and has been a major settlement for nearly two millennia.[9] The City of London, its ancient core and financial centre, was founded by the Romans as Londinium and retains its medieval boundaries.[note 2][10] The City of Westminster, to the west of the City of London, has for centuries hosted the national government and parliament. Since the 19th century,[11] the name "London" also refers to the metropolis around this core, historically split among the counties of Middlesex, Essex, Surrey, Kent, and Hertfordshire,[12] which since 1965 has largely comprised Greater London,[13] which is governed by 33 local authorities and the Greater London Authority.',
        ),
        PlacesListDetailed(
          url:
              'https://images.unsplash.com/photo-1527838832700-5059252407fa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dHVya2V5fGVufDB8fDB8fHww',
          placeName: 'Pamukalle, Turkey',
          capitalName: 'Pamukalle',
          countryName: 'Turkey',
          rating: '4.9',
          price: '700',
          temperature: '3',
          travelTime: '36',
          description:
              'Pamukkale, meaning "cotton castle" in Turkish, is a natural site in Denizli Province in southwestern Turkey. The area is famous for a carbonate mineral left by the flowing of thermal spring water.[1][2] It is located in Turkeys Inner Aegean region, in the River Menderes valley, which has a temperate climate for most of the year.The ancient Greek city of Hierapolis was built on top of the travertine formation which is in total about 2,700 metres (8,860 ft) long, 600 m (1,970 ft) wide and 160 m (525 ft) high. It can be seen from the hills on the opposite side of the valley in the town of Denizli, 20 km away. This area has been drawing visitors to its thermal springs since the time of classical antiquity.[1] The Turkish name refers to the surface of the shimmering, snow-white limestone, shaped over millennia by calcite-rich springs.[2] Dripping slowly down the mountainside, mineral-rich waters collect in and cascade down the mineral terraces, into pools below.',
        ),
      ],
    );
  }
}
