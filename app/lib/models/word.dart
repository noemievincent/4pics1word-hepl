import 'package:cloud_firestore/cloud_firestore.dart';

import 'letter.dart';

class Word {
  final String? id;
  final String word;
  final String category;
  final String previewImage;
  final List<String> images;
  final List<String> definitions;
  final List<Letter> letters;

  Word({
    this.id,
    required this.word,
    required this.category,
    required this.previewImage,
    required this.images,
    required this.definitions,
    required this.letters,
  });

  Map toJson() => {
        'id': id,
        'word': word,
        'category': category,
        'previewImage': previewImage,
        'images': images,
        'definitions': definitions,
        'letters': letters,
      };

  factory Word.fromJson(Map<String, dynamic> json) {
    List<String> images = [];
    for (var image in json['images']) {
      images.add(image);
    }

    List<String> definitions = [];
    for (var definition in json['definitions']) {
      definitions.add(definition);
    }

    List<Letter> letters = [];
    for (var i = 0; i < json['letters'].length; ++i) {
      letters.add(Letter(id: i, letter: json['letters'][i]['letter']));
    }

    return Word(
      id: json['id'] as String,
      word: json['word'] as String,
      category: json['category'] as String,
      previewImage: json['previewImage'] as String,
      images: images,
      definitions: definitions,
      letters: letters,
    );
  }

  factory Word.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    List<String> images = [];
    for (var image in data['images']) {
      images.add(image);
    }

    List<String> definitions = [];
    for (var definition in data['definitions']) {
      definitions.add(definition);
    }

    List<Letter> letters = [];
    for (var i = 0; i < data['letters'].length; ++i) {
      letters.add(Letter(id: i, letter: data['letters'][i]['letter']));
    }

    return Word(
      id: doc.id,
      word: data['word'] ?? '',
      category: data['category'] ?? '',
      previewImage: data['previewImage'] ?? '',
      images: images,
      definitions: definitions,
      letters: letters,
    );
  }

  @override
  String toString() {
    return '\nid: $id, \nword: $word, \ncategory: $category, \nimages: $images, \ndefinitions: $definitions, \nletters: $letters';
  }
}

// List<Word> wordsData = [
//   Word(
//       word: "Abeille",
//       category: "nom féminin",
//       previewImage: "assets/img/abeille/abeille_3.png",
//       images: const [
//         "assets/img/abeille/abeille_1.png",
//         "assets/img/abeille/abeille_2.png",
//         "assets/img/abeille/abeille_3.png",
//         "assets/img/abeille/abeille_4.png"
//       ],
//       definitions: const [
//         "Insecte vivant en colonies et produisant la cire et le miel.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "A"),
//         Letter(id: 1, letter: "B"),
//         Letter(id: 2, letter: "E"),
//         Letter(id: 3, letter: "I"),
//         Letter(id: 4, letter: "L"),
//         Letter(id: 5, letter: "L"),
//         Letter(id: 6, letter: "E"),
//       ]),
//   Word(
//       word: "Chenille",
//       category: "nom féminin",
//       previewImage: "assets/img/chenille/chenille_1.png",
//       images: const [
//         "assets/img/chenille/chenille_1.png",
//         "assets/img/chenille/chenille_2.png",
//         "assets/img/chenille/chenille_3.png",
//         "assets/img/chenille/chenille_4.png"
//       ],
//       definitions: const [
//         "Bande sans fin souple, à maillons métalliques ou en caoutchouc liés et articulés par des axes à chacune de leurs extrémités, interposée entre le sol et les roues d'un véhicule pour assurer la traction dans des terrains à faible coefficient d'adhérence.",
//         "Forme larvaire des insectes de l'ordre des lépidoptères.",
//         "Groupe de danseurs à la queue leu-leu.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "C"),
//         Letter(id: 1, letter: "H"),
//         Letter(id: 2, letter: "E"),
//         Letter(id: 3, letter: "N"),
//         Letter(id: 4, letter: "I"),
//         Letter(id: 5, letter: "L"),
//         Letter(id: 6, letter: "L"),
//         Letter(id: 7, letter: "E"),
//       ]),
//   Word(
//       word: "Souris",
//       category: "nom féminin",
//       previewImage: "assets/img/souris/souris_2.png",
//       images: const [
//         "assets/img/souris/souris_1.png",
//         "assets/img/souris/souris_2.png",
//         "assets/img/souris/souris_3.png",
//         "assets/img/souris/souris_4.png"
//       ],
//       definitions: const [
//         "Petit mammifère rongeur (muridé), ubiquiste, au pelage gris, qui fréquente bois et champs, mais aussi et surtout les maisons.",
//         "Dispositif de pointage qui se relie à l'ordinateur et permet de déplacer le curseur (la flèche) à l'écran.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "S"),
//         Letter(id: 1, letter: "O"),
//         Letter(id: 2, letter: "U"),
//         Letter(id: 3, letter: "R"),
//         Letter(id: 4, letter: "I"),
//         Letter(id: 5, letter: "S"),
//       ]),
//   Word(
//       word: "Paille",
//       category: "nom féminin",
//       previewImage: "assets/img/paille/paille_4.png",
//       images: const [
//         "assets/img/paille/paille_1.png",
//         "assets/img/paille/paille_2.png",
//         "assets/img/paille/paille_3.png",
//         "assets/img/paille/paille_4.png"
//       ],
//       definitions: const [
//         "Tige de graminée, en particulier de céréale, dépouillée de son grain.",
//         "Tube ouvert aux deux extrémités qui permet d'aspirer nos boissons une fois trempées dans un liquide.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "P"),
//         Letter(id: 1, letter: "A"),
//         Letter(id: 2, letter: "I"),
//         Letter(id: 3, letter: "L"),
//         Letter(id: 4, letter: "L"),
//         Letter(id: 5, letter: "E"),
//       ]),
//   Word(
//       word: "CD",
//       category: "nom masculin",
//       previewImage: "assets/img/cd/cd_4.png",
//       images: const [
//         "assets/img/cd/cd_1.png",
//         "assets/img/cd/cd_2.png",
//         "assets/img/cd/cd_3.png",
//         "assets/img/cd/cd_4.png"
//       ],
//       definitions: const [
//         "Disque numérique de 12 centimètres de diamètre à lecture par laser.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "C"),
//         Letter(id: 1, letter: "D"),
//       ]),
//   Word(
//       word: "Pelouse",
//       category: "nom féminin",
//       previewImage: "assets/img/pelouse/pelouse_3.png",
//       images: const [
//         "assets/img/pelouse/pelouse_1.png",
//         "assets/img/pelouse/pelouse_2.png",
//         "assets/img/pelouse/pelouse_3.png",
//         "assets/img/pelouse/pelouse_4.png"
//       ],
//       definitions: const [
//         "Terrain couvert d'herbe maintenue rase par des fauches fréquentes.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "P"),
//         Letter(id: 1, letter: "E"),
//         Letter(id: 2, letter: "L"),
//         Letter(id: 3, letter: "O"),
//         Letter(id: 4, letter: "U"),
//         Letter(id: 5, letter: "S"),
//         Letter(id: 6, letter: "E"),
//       ]),
//   Word(
//       word: "Batterie",
//       category: "nom féminin",
//       previewImage: "assets/img/batterie/batterie_3.png",
//       images: const [
//         "assets/img/batterie/batterie_1.png",
//         "assets/img/batterie/batterie_2.png",
//         "assets/img/batterie/batterie_3.png",
//         "assets/img/batterie/batterie_4.png"
//       ],
//       definitions: const [
//         "Système destiné au stockage de l'énergie électrique sous une forme différente.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "B"),
//         Letter(id: 1, letter: "A"),
//         Letter(id: 2, letter: "T"),
//         Letter(id: 3, letter: "T"),
//         Letter(id: 4, letter: "E"),
//         Letter(id: 5, letter: "R"),
//         Letter(id: 6, letter: "I"),
//         Letter(id: 7, letter: "E")
//       ]),
//   Word(
//       word: "Applaudir",
//       category: "verbe",
//       previewImage: "assets/img/applaudir/applaudir_4.png",
//       images: const [
//         "assets/img/applaudir/applaudir_1.png",
//         "assets/img/applaudir/applaudir_2.png",
//         "assets/img/applaudir/applaudir_3.png",
//         "assets/img/applaudir/applaudir_4.png"
//       ],
//       definitions: const [
//         "Louer, approuver quelqu'un, quelque chose, lui marquer son admiration en battant des mains.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "A"),
//         Letter(id: 1, letter: "P"),
//         Letter(id: 2, letter: "P"),
//         Letter(id: 3, letter: "L"),
//         Letter(id: 4, letter: "A"),
//         Letter(id: 5, letter: "U"),
//         Letter(id: 6, letter: "D"),
//         Letter(id: 7, letter: "I"),
//         Letter(id: 8, letter: "R"),
//       ]),
//   Word(
//       word: "Lire",
//       category: "verbe",
//       previewImage: "assets/img/lire/lire_2.png",
//       images: const [
//         "assets/img/lire/lire_1.png",
//         "assets/img/lire/lire_2.png",
//         "assets/img/lire/lire_3.png",
//         "assets/img/lire/lire_4.png"
//       ],
//       definitions: const [
//         "Prendre connaissance du contenu d'un texte par la lecture.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "L"),
//         Letter(id: 1, letter: "I"),
//         Letter(id: 2, letter: "R"),
//         Letter(id: 3, letter: "E"),
//       ]),
//   Word(
//       word: "Soupe",
//       category: "nom féminin",
//       previewImage: "assets/img/soupe/soupe_1.png",
//       images: const [
//         "assets/img/soupe/soupe_1.png",
//         "assets/img/soupe/soupe_2.png",
//         "assets/img/soupe/soupe_3.png",
//         "assets/img/soupe/soupe_4.png"
//       ],
//       definitions: const [
//         "Potage ou bouillon servi sur des tranches de pain.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "S"),
//         Letter(id: 1, letter: "O"),
//         Letter(id: 2, letter: "U"),
//         Letter(id: 3, letter: "P"),
//         Letter(id: 4, letter: "E"),
//       ]),
//   Word(
//       word: "Brun",
//       category: "adjectif",
//       previewImage: "assets/img/brun/brun_4.png",
//       images: const [
//         "assets/img/brun/brun_1.png",
//         "assets/img/brun/brun_2.png",
//         "assets/img/brun/brun_3.png",
//         "assets/img/brun/brun_4.png"
//       ],
//       definitions: const [
//         "Couleur intermédiaire entre le roux et le noir.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "B"),
//         Letter(id: 1, letter: "R"),
//         Letter(id: 2, letter: "U"),
//         Letter(id: 3, letter: "N"),
//       ]),
//   Word(
//       word: "Botte",
//       category: "nom féminin",
//       previewImage: "assets/img/botte/botte_1.png",
//       images: const [
//         "assets/img/botte/botte_1.png",
//         "assets/img/botte/botte_2.png",
//         "assets/img/botte/botte_3.png",
//         "assets/img/botte/botte_4.png"
//       ],
//       definitions: const [
//         "Chaussure de cuir, de caoutchouc, etc., qui enferme le pied et la jambe et quelquefois le bas de la cuisse ou même la cuisse entière.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "B"),
//         Letter(id: 1, letter: "O"),
//         Letter(id: 2, letter: "T"),
//         Letter(id: 3, letter: "T"),
//         Letter(id: 4, letter: "E"),
//       ]),
//   Word(
//       word: "Billet",
//       category: "nom masculin",
//       previewImage: "assets/img/billet/billet_1.png",
//       images: const [
//         "assets/img/billet/billet_1.png",
//         "assets/img/billet/billet_2.png",
//         "assets/img/billet/billet_3.png",
//         "assets/img/billet/billet_4.png"
//       ],
//       definitions: const [
//         "Petit carton ou papier imprimé constatant un droit ou une convention, en particulier donnant accès quelque part.",
//         "Moyen de paiement généralement en papier imprimé, émis le plus souvent par la banque centrale ou l'Institut d'émission d'un pays.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "B"),
//         Letter(id: 1, letter: "I"),
//         Letter(id: 2, letter: "L"),
//         Letter(id: 3, letter: "L"),
//         Letter(id: 4, letter: "E"),
//         Letter(id: 5, letter: "T"),
//       ]),
//   Word(
//       word: "Dentelle",
//       category: "nom féminin",
//       previewImage: "assets/img/dentelle/dentelle_1.png",
//       images: const [
//         "assets/img/dentelle/dentelle_1.png",
//         "assets/img/dentelle/dentelle_2.png",
//         "assets/img/dentelle/dentelle_3.png",
//         "assets/img/dentelle/dentelle_4.png"
//       ],
//       definitions: const [
//         "Tissu ajouré constitué par l'entrelacement de fils formant un fond de réseau sur lequel se détachent des motifs décoratifs.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "D"),
//         Letter(id: 1, letter: "E"),
//         Letter(id: 2, letter: "N"),
//         Letter(id: 3, letter: "T"),
//         Letter(id: 4, letter: "E"),
//         Letter(id: 5, letter: "L"),
//         Letter(id: 6, letter: "L"),
//         Letter(id: 7, letter: "E")
//       ]),
//   Word(
//       word: "Dent",
//       category: "nom féminin",
//       previewImage: "assets/img/dent/dent_1.png",
//       images: const [
//         "assets/img/dent/dent_1.png",
//         "assets/img/dent/dent_2.png",
//         "assets/img/dent/dent_3.png",
//         "assets/img/dent/dent_4.png"
//       ],
//       definitions: const [
//         "Organe dur, blanchâtre, implanté sur le bord des mâchoires de la plupart des vertébrés, qui sert à la prise de nourriture et, parfois, à la mastication ou à la défense.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "D"),
//         Letter(id: 1, letter: "E"),
//         Letter(id: 2, letter: "N"),
//         Letter(id: 3, letter: "T"),
//       ]),
//   Word(
//       word: "Neige",
//       category: "nom féminin",
//       previewImage: "assets/img/neige/neige_1.png",
//       images: const [
//         "assets/img/neige/neige_1.png",
//         "assets/img/neige/neige_2.png",
//         "assets/img/neige/neige_3.png",
//         "assets/img/neige/neige_4.png"
//       ],
//       definitions: const [
//         "Eau congelée qui tombe des nuages en flocons blancs et légers.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "N"),
//         Letter(id: 1, letter: "E"),
//         Letter(id: 2, letter: "I"),
//         Letter(id: 3, letter: "G"),
//         Letter(id: 4, letter: "E"),
//       ]),
//   Word(
//       word: "Saisons",
//       category: "nom féminin",
//       previewImage: "assets/img/saisons/saisons_1.png",
//       images: const [
//         "assets/img/saisons/saisons_1.png",
//         "assets/img/saisons/saisons_2.png",
//         "assets/img/saisons/saisons_3.png",
//         "assets/img/saisons/saisons_4.png"
//       ],
//       definitions: const [
//         "Chacune des quatre parties en lesquelles l'année se trouve divisée par les équinoxes et les solstices.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "S"),
//         Letter(id: 1, letter: "A"),
//         Letter(id: 2, letter: "I"),
//         Letter(id: 3, letter: "S"),
//         Letter(id: 4, letter: "O"),
//         Letter(id: 5, letter: "N"),
//         Letter(id: 6, letter: "S"),
//       ]),
//   Word(
//       word: "Canard",
//       category: "nom masculin",
//       previewImage: "assets/img/canard/canard_2.png",
//       images: const [
//         "assets/img/canard/canard_1.png",
//         "assets/img/canard/canard_2.png",
//         "assets/img/canard/canard_3.png",
//         "assets/img/canard/canard_4.png"
//       ],
//       definitions: const [
//         "Oiseau aquatique ansériforme migrateur, au cou court, au bec aplati apte à filtrer la vase, aux pattes palmées, très courtes, et dont certaines espèces font l'objet d'un élevage important pour leur chair.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "C"),
//         Letter(id: 1, letter: "A"),
//         Letter(id: 2, letter: "N"),
//         Letter(id: 3, letter: "A"),
//         Letter(id: 4, letter: "R"),
//         Letter(id: 5, letter: "D"),
//       ]),
//   Word(
//       word: "Orchestre",
//       category: "nom masculin",
//       previewImage: "assets/img/orchestre/orchestre_2.png",
//       images: const [
//         "assets/img/orchestre/orchestre_1.png",
//         "assets/img/orchestre/orchestre_2.png",
//         "assets/img/orchestre/orchestre_3.png",
//         "assets/img/orchestre/orchestre_4.png"
//       ],
//       definitions: const [
//         "Groupe d'instrumentistes constitué en association de concerts symphoniques.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "O"),
//         Letter(id: 1, letter: "R"),
//         Letter(id: 2, letter: "C"),
//         Letter(id: 3, letter: "H"),
//         Letter(id: 4, letter: "E"),
//         Letter(id: 5, letter: "S"),
//         Letter(id: 6, letter: "T"),
//         Letter(id: 7, letter: "R"),
//         Letter(id: 8, letter: "E")
//       ]),
//   Word(
//       word: "Robinet",
//       category: "nom masculin",
//       previewImage: "assets/img/robinet/robinet_3.png",
//       images: const [
//         "assets/img/robinet/robinet_1.png",
//         "assets/img/robinet/robinet_2.png",
//         "assets/img/robinet/robinet_3.png",
//         "assets/img/robinet/robinet_4.png"
//       ],
//       definitions: const [
//         "Appareil servant à interrompre ou à rétablir la circulation d'un fluide dans une canalisation, à l'aide d'un obturateur commandé de l'extérieur",
//       ],
//       letters: [
//         Letter(id: 0, letter: "R"),
//         Letter(id: 1, letter: "O"),
//         Letter(id: 2, letter: "B"),
//         Letter(id: 3, letter: "I"),
//         Letter(id: 4, letter: "N"),
//         Letter(id: 5, letter: "E"),
//         Letter(id: 6, letter: "T"),
//       ]),
//   Word(
//       word: "Fromage",
//       category: "nom masculine",
//       previewImage: "assets/img/fromage/fromage_4.png",
//       images: const [
//         "assets/img/fromage/fromage_1.png",
//         "assets/img/fromage/fromage_2.png",
//         "assets/img/fromage/fromage_3.png",
//         "assets/img/fromage/fromage_4.png"
//       ],
//       definitions: const [
//         "Produit alimentaire obtenu par coagulation du lait, égouttage du caillé ainsi obtenu et, éventuellement, affinage.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "F"),
//         Letter(id: 1, letter: "R"),
//         Letter(id: 2, letter: "O"),
//         Letter(id: 3, letter: "M"),
//         Letter(id: 4, letter: "A"),
//         Letter(id: 5, letter: "G"),
//         Letter(id: 6, letter: "E"),
//       ]),
//   Word(
//       word: "Baignoire",
//       category: "nom féminin",
//       previewImage: "assets/img/baignoire/baignoire_2.png",
//       images: const [
//         "assets/img/baignoire/baignoire_1.png",
//         "assets/img/baignoire/baignoire_2.png",
//         "assets/img/baignoire/baignoire_3.png",
//         "assets/img/baignoire/baignoire_4.png"
//       ],
//       definitions: const [
//         "Appareil sanitaire individuel dans lequel on prend des bains.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "B"),
//         Letter(id: 1, letter: "A"),
//         Letter(id: 2, letter: "I"),
//         Letter(id: 3, letter: "G"),
//         Letter(id: 4, letter: "N"),
//         Letter(id: 5, letter: "O"),
//         Letter(id: 6, letter: "I"),
//         Letter(id: 7, letter: "R"),
//         Letter(id: 8, letter: "E")
//       ]),
//   Word(
//       word: "Chauffage",
//       category: "nom masculin",
//       previewImage: "assets/img/chauffage/chauffage_4.png",
//       images: const [
//         "assets/img/chauffage/chauffage_1.png",
//         "assets/img/chauffage/chauffage_2.png",
//         "assets/img/chauffage/chauffage_3.png",
//         "assets/img/chauffage/chauffage_4.png"
//       ],
//       definitions: const [
//         "Installation servant à chauffer un local.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "C"),
//         Letter(id: 1, letter: "H"),
//         Letter(id: 2, letter: "A"),
//         Letter(id: 3, letter: "U"),
//         Letter(id: 4, letter: "F"),
//         Letter(id: 5, letter: "F"),
//         Letter(id: 6, letter: "A"),
//         Letter(id: 7, letter: "G"),
//         Letter(id: 8, letter: "E")
//       ]),
//   Word(
//       word: "Cru",
//       category: "adjectif",
//       previewImage: "assets/img/cru/cru_2.png",
//       images: const [
//         "assets/img/cru/cru_1.png",
//         "assets/img/cru/cru_2.png",
//         "assets/img/cru/cru_3.png",
//         "assets/img/cru/cru_4.png"
//       ],
//       definitions: const [
//         "Qui n'est pas cuit.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "C"),
//         Letter(id: 1, letter: "R"),
//         Letter(id: 2, letter: "U"),
//       ]),
//   Word(
//       word: "Sec",
//       category: "adjectif",
//       previewImage: "assets/img/sec/sec_1.png",
//       images: const [
//         "assets/img/sec/sec_1.png",
//         "assets/img/sec/sec_2.png",
//         "assets/img/sec/sec_3.png",
//         "assets/img/sec/sec_4.png"
//       ],
//       definitions: const [
//         "Qui ne renferme pas d'eau, qui n'est pas mouillé, qui a perdu son élément liquide.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "S"),
//         Letter(id: 1, letter: "E"),
//         Letter(id: 2, letter: "C"),
//       ]),
//   Word(
//       word: "Jeu",
//       category: "nom masculin",
//       previewImage: "assets/img/jeu/jeu_4.png",
//       images: const [
//         "assets/img/jeu/jeu_1.png",
//         "assets/img/jeu/jeu_2.png",
//         "assets/img/jeu/jeu_3.png",
//         "assets/img/jeu/jeu_4.png"
//       ],
//       definitions: const [
//         "Activité d'ordre physique ou mental, non imposée, ne visant à aucune fin utilitaire, et à laquelle on s'adonne pour se divertir, en tirer un plaisir.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "J"),
//         Letter(id: 1, letter: "E"),
//         Letter(id: 2, letter: "U"),
//       ]),
//   Word(
//       word: "Or",
//       category: "nom masculin",
//       previewImage: "assets/img/or/or_4.png",
//       images: const [
//         "assets/img/or/or_1.png",
//         "assets/img/or/or_2.png",
//         "assets/img/or/or_3.png",
//         "assets/img/or/or_4.png"
//       ],
//       definitions: const [
//         "Métal d'un jaune brillant, dense, très ductile, inaltérable à l'air et à l'eau et qui a une très grande valeur commerciale.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "O"),
//         Letter(id: 1, letter: "R"),
//       ]),
//   Word(
//       word: "Toit",
//       category: "nom masculin",
//       previewImage: "assets/img/toit/toit_2.png",
//       images: const [
//         "assets/img/toit/toit_1.png",
//         "assets/img/toit/toit_2.png",
//         "assets/img/toit/toit_3.png",
//         "assets/img/toit/toit_4.png"
//       ],
//       definitions: const [
//         "Couverture, ouvrage isolant un bâtiment par le haut, notamment fait d'un ou plusieurs versants pentus soutenus par une charpente.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "T"),
//         Letter(id: 1, letter: "O"),
//         Letter(id: 2, letter: "I"),
//         Letter(id: 3, letter: "T"),
//       ]),
//   Word(
//       word: "Nuage",
//       category: "nom masculin",
//       previewImage: "assets/img/nuage/nuage_1.png",
//       images: const [
//         "assets/img/nuage/nuage_1.png",
//         "assets/img/nuage/nuage_2.png",
//         "assets/img/nuage/nuage_3.png",
//         "assets/img/nuage/nuage_4.png"
//       ],
//       definitions: const [
//         "Ensemble visible de particules d’eau très fines, liquides ou solides, maintenues en suspension dans l’atmosphère par les mouvements verticaux de l’air.",
//       ],
//       letters: [
//         Letter(id: 0, letter: "N"),
//         Letter(id: 1, letter: "U"),
//         Letter(id: 2, letter: "A"),
//         Letter(id: 3, letter: "G"),
//         Letter(id: 4, letter: "E"),
//       ]),
// ];
