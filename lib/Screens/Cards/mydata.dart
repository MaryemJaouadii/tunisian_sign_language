import 'package:tunisian_sign_language/Screens/Cards/model.dart';

//test
class mydata {
  var monthsData = model([
    'جانفي',
    'فيفري',
    'مارس',
    'أفريل',
    'ماي',
    'جوان',
    'جويلية',
    'أوت',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر'
  ], [
    'assets/months/january.gif',
    'assets/months/february.gif',
    'assets/months/march.gif',
    'assets/months/april.gif',
    'assets/months/may.gif',
    'assets/months/june.gif',
    'assets/months/july.gif',
    'assets/months/august.gif',
    'assets/months/september.gif',
    'assets/months/october.gif',
    'assets/months/november.gif',
    'assets/months/december.gif',
  ]);
  var familyData = model([
    'بنت',
    'ولد',
    'ابن',
    'ابنة',
    'أخ',
    'أخت',
    'خال',
    'خالة',
    'عمي',
    'عمتي',
    'عائلة',
  ], [
    'assets/family/بنت.gif',
    'assets/family/ولد.gif',
    'assets/family/ابن.gif',
    'assets/family/ابنة.gif',
    'assets/family/اخ.gif',
    'assets/family/اخت.gif',
    'assets/family/خال.gif',
    'assets/family/خالة.gif',
    'assets/family/عمي.gif',
    'assets/family/عمتي.gif',
    'assets/family/عائلة.gif',
  ]);
  var seasonsData = model([
    'شتاء',
    'ربيع',
    'صيف',
    'خريف',

  ], [
    'assets/seasons/chte.gif',
    'assets/seasons/rbi3.gif',
    'assets/seasons/sif.gif',
    'assets/seasons/khrif.gif',

  ]);
  var daysData = model([
    'يوم',
    'أسبوع',
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت'
  ], [
    'assets/days/day.gif',
    'assets/days/week.gif',
    'assets/days/sunday.gif',
    'assets/days/monday.gif',
    'assets/days/tuesday.gif',
    'assets/days/wednesday.gif',
    'assets/days/thursday.gif',
    'assets/days/friday.gif',
    'assets/days/saturday.gif',


  ]);
  var govsData = model([
    'أريانة',
    'باجة',
    'بنزرت',
    'بن عروس',
    'تطاوين',
    'توزر',
    'تونس',
    'جندوبة',
    'زغوان',
    'سليانة',
    'سوسة',
    'سيدي بوزيد',
    '	صفاقس',
    'قابس',
    'قبلي',
    'القصرين',
    'قفصة',
    'القيروان',
    'الكاف',
    'مدنين',
    'المنستير',
    'منوبة',
    'المهدية',
    '	نابل',
  ], [
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',
    'assets/governorats/.gif',

  ]);

  /*
  var foodData = model([
    'PIZZA ',
    'HAMBURGER',
    'HOTDOG ',
    'EGG',
    'APPLE',
    'CHEESE',
    'DRINK',
    'CUP',
    'WATER',
    'HUNGRY',
  ], [
    'http://asluniversity.com/asl101/gifs/p/pizza.gif',
    'http://asluniversity.com/asl101/gifs/h/hamburger-2.gif',
    'http://asluniversity.com/asl101/gifs/h/hotdog.gif',
    'http://asluniversity.com/asl101/gifs/e/egg.gif',
    'http://asluniversity.com/asl101/gifs/a/apple.gif',
    'http://asluniversity.com/asl101/gifs/c/cheese.gif',
    'http://asluniversity.com/asl101/gifs/d/drink-c.gif',
    'http://asluniversity.com/asl101/gifs/c/cup.gif',
    'http://asluniversity.com/asl101/gifs/w/water-2.gif',
    'http://asluniversity.com/asl101/gifs/h/hungry-wish.gif',
  ]);
  var feelingDate = model([
    'HAPPY',
    'ANGRY',
    'SAD',
    'CRY',
    'LIKE ',
    'GOOD',
    'LOVE',
  ], [
    'http://asluniversity.com/asl101/gifs/h/happy.gif',
    'http://asluniversity.com/asl101/gifs/a/angry-2.gif',
    'http://asluniversity.com/asl101/gifs/s/sad.gif',
    'http://asluniversity.com/asl101/gifs/c/cry-tears.gif',
    'http://asluniversity.com/asl101/gifs/l/like.gif',
    'http://asluniversity.com/asl101/gifs/g/good.gif',
    'http://asluniversity.com/asl101/gifs/l/love.gif',
  ]);
  var clothesDate = model([
    'SHIRT',
    'SOCKS',
    'Shoes',
    'COAT',
  ], [
    'http://asluniversity.com/asl101/gifs/s/shirt-volunteer.gif',
    'http://asluniversity.com/asl101/gifs/s/socks.gif',
    'http://asluniversity.com/asl101/gifs/s/shoes.gif',
    'http://asluniversity.com/asl101/gifs/c/coat.gif',
  ]);
  var colorsDate = model([
    'BLUE',
    'GREEN',
    'YELLOW',
    'RED',
    'BROWN',
    'ORANGE',
  ], [
    'http://asluniversity.com/asl101/gifs/b/blue-1.gif',
    'http://asluniversity.com/asl101/gifs-animated/green.gif',
    'http://asluniversity.com/asl101/gifs/y/yellow.gif',
    'http://asluniversity.com/asl101/gifs-animated/red.gif',
    'http://asluniversity.com/asl101/gifs/b/brown.gif',
    'http://asluniversity.com/asl101/gifs/o/orange.gif',
  ]);
  var numbersData = model([
    'ONE',
    'TWO',
    'THREE',
    'FOUR',
    'FIVE',
    'SIX',
    'SEVEN',
    'EIGHT',
    'NINE',
    'TEN',
  ], [
    'http://asluniversity.com/asl101/signjpegs/numbers/number01.jpg',
    'http://asluniversity.com/asl101/signjpegs/numbers/number02.jpg',
    'http://asluniversity.com/asl101/signjpegs/numbers/number03.jpg',
    'http://asluniversity.com/asl101/signjpegs/numbers/number04.jpg',
    'http://asluniversity.com/asl101/signjpegs/numbers/number05.jpg',
    'http://asluniversity.com/asl101/signjpegs/numbers/number06.jpg',
    'http://asluniversity.com/asl101/signjpegs/numbers/number07.jpg',
    'http://asluniversity.com/asl101/signjpegs/numbers/number08.jpg',
    'http://asluniversity.com/asl101/signjpegs/numbers/number09.jpg',
    'http://asluniversity.com/asl101/gifs-animated/10.gif',
  ]);*/
}
