class Event {
  final String imagePath, title, description, location, duration, punchLine1, punchLine2;
  final List categoryIds, galleryImages;

  Event(
      {this.imagePath,
      this.title,
      this.description,
      this.location,
      this.duration,
      this.punchLine1,
      this.punchLine2,
      this.categoryIds,
      this.galleryImages});
}

final erciyesEvent = Event(
    imagePath: "assets/event_images/efe.jpg",
    title: "BEŞİKTAŞ JK VE BESA GRUP YÖNETİM KURULU ÜYESİ MEZUNUMUZ EFE BEZCİ İLE CANLI YAYINDAYDIK !",
    description: "Beşiktaş JK ve Besa Grup Yönetim Kurulu Üyesi,İç Mimarlık '13 Mezunumuz Efe BEZCİ ile canlı yayında bir araya geldik. Süper Lig'in unutulmaz sezonunda gelen Beşiktaş'ın çifte şampiyonluğunu,gelecek sezon hedefleri ve iş dünyası üzerinde konuştuk.Yayın sonunda yapılan çekiliş ile 6 kişiye İmzalı Beşiktaş forması hediye edildi.Katılan herkese teşekkürlerimizle..",
    location: "Erciyes Area",
    duration: "21/05/2021",
    punchLine1: "Efe Bezci ile Röportaj",
    //punchLine2: "You are invited to this special climbing event.",
    galleryImages: [],
    categoryIds: [0, 1]);

final halisahaEvent = Event(
    imagePath: "assets/event_images/halısaha.jpg",
    title: "Football Tournament ",
    description: "You can contact us to be registered via abc@gmail.com",
    location: "Kadir Has Area",
    duration: "1w",
    punchLine1: "Join us! ",
    punchLine2: "You think you have a talented squad? Let us see how competitive you are",
    categoryIds: [0, 2],
    galleryImages: ["assets/event_images/halısaha1.jpg", "assets/event_images/halısaha2.jpg", "assets/event_images/halısaha3.jpg"]);

final musicConcert = Event(
    imagePath: "assets/event_images/ilyas_buray_konser_etkinlik.jpg",
    title: "Erciyes Music Concert",
    description: "Listen to last popular singles, tickets can be bought from avm.",
    location: "Almer Avm",
    duration: "5h",
    punchLine1: "Music Lovers!",
    punchLine2: "The latest starts are coming for you!",
   galleryImages: ["assets/event_images/singer1.jpg", "assets/event_images/singer2.jpg", "assets/event_images/singer3.jpg","assets/event_images/singer4.jpg"],
    categoryIds: [0, 1]);

final golfCompetition = Event(
    imagePath: "assets/event_images/golf_competition.jpeg",
    title: "Season 2 Golf Estate",
    description: "Event is completely free.We are wating for you!",
    location: "Develi/ Kayseri",
    duration: "3d",
    punchLine1: "Golf!",
    punchLine2: "You like playing golf? Come join us",
    galleryImages: ["assets/event_images/golf1.jpg", "assets/event_images/golf2.jpg", "assets/event_images/golf3.jpg"],
    categoryIds: [0, 2 ]);

final seminar = Event(
    imagePath: "assets/event_images/peterson.jpg",
    title: "Jordan Peterson Seminar",
    description: "Jordan Bernt Peterson is a Canadian professor of psychology at the University of Toronto, a clinical psychologist, and YouTube personality. He began to receive widespread attention in the late 2010s for his views on cultural and political issues, often described as conservative",
    location: "Kadir Has/ Kayseri",
    duration: "5h",
    punchLine1: "Interested in 	psychology?",
    punchLine2: "One of the best psychology master meets his readers. ",
    galleryImages: [],
   // galleryImages: ["assets/event_images/golf1.jpg", "assets/event_images/golf2.jpg", "assets/event_images/golf3.jpg"],
    categoryIds: [0,1,3]);

final softwareengineer = Event(
    imagePath: "assets/event_images/software_engineer.jpg",
    title: "Seeking for data scientist",
    description: "",
    location: "Kayseri",
    duration: "Apply now",
    punchLine1: "Apply now!",
    punchLine2: "Wanna go deeper in data science?.",
    galleryImages: [],
    categoryIds: [4]);
final mathteacher= Event(
    imagePath: "assets/event_images/math_teacher.jpg",
    title: "Seeking for math teacher",
    description: "",
    location: "Denizli",
    duration: "Apply now",
    punchLine1: "Apply now!",
    punchLine2: "Educate best students at the college",
    galleryImages: [],
    categoryIds: [4]);


final socialmediamanager= Event(
    imagePath: "assets/event_images/sm_manager.jpg",
    title: "Seeking for social media manager",
    description: "",
    location: "İstanbul",
    duration: "Apply now",
    punchLine1: "Apply now!",
    punchLine2: "Help us to advertise our company! You'll enjoy!",
    galleryImages: [],
    categoryIds: [4]);
final scout= Event(
    imagePath: "assets/event_images/scout.jpg",
    title: "Seeking for scouts for our football academy",
    description: "",
    location: "İstanbul",
    duration: "Apply now",
    punchLine1: "Apply now!",
    punchLine2: "Help us to find young talents!",
    galleryImages: [],
    categoryIds: [4]);

final events = [
  erciyesEvent,
  halisahaEvent,
  musicConcert,
  golfCompetition,
  softwareengineer,
  mathteacher,
  socialmediamanager,
  scout,
  seminar

];
