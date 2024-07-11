class OnboardingInfo {
  final String title;
  final String descriptions;
  final String image;

  OnboardingInfo(
      {required this.title, required this.descriptions, required this.image});
}

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Ehancing Childcare With Technology",
        descriptions:
            "When you seek truly compentionate, caring knowledgeable advocates for your child we peek to give tremendous support",
        image: "assets/images/childwithdoc.png"),
    OnboardingInfo(
        title: "Get Doctor Video Call Sitting At Home",
        descriptions:
            "Connect with your doctor via video call and get medical advice from home",
        image: "assets/images/OnlineDoctor.png"),
    OnboardingInfo(
        title: "Learn About Your Doctor",
        descriptions:
            "Browse through a selection of qualified doctors and choose the one that suits your needs",
        image: "assets/images/Doctors.png"),
    OnboardingInfo(
        title: "Effortless Appointment Booking",
        descriptions:
            "Book appointments with ease using our user-friendly appointment booking system.",
        image: "assets/images/Datepicker.png"),
  ];
}
