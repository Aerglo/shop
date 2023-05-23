import 'package:hive/hive.dart';
part 'product.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  String name;
  @HiveField(1)
  int price;
  @HiveField(2)
  List<String> description;
  @HiveField(3)
  String category;
  @HiveField(4)
  bool isSelected = false;
  @HiveField(5)
  bool isFavourited = false;
  @HiveField(6)
  int sellCounts = 0;
  @HiveField(7)
  int productId;
  @HiveField(8)
  String? imageAsset;
  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.productId,
    this.imageAsset,
    this.sellCounts = 0,
  });

  static List<Product> productList = [
    Product(
      name: 'پنیر سبزیجات آلیما 250 گرمی',
      price: 44900,
      description: [
        'تهیه شده از سبزیجات مختلف',
        'مناسب برای افراد وگان و گیاهخوار',
        'ضد سرطان',
        'تقویت سیستم ایمنی بدن',
        'هضم راحت'
      ],
      sellCounts: 10,
      category: 'لبنیات',
      productId: 100,
      imageAsset: 'assets/images/vegCheese250gAlima.png',
    ),
    Product(
      name: 'پنیر سویا زیره ( توفو ) 450 گرمی بکر',
      category: 'لبنیات',
      price: 85000,
      productId: 101,
      description: [
        'مناسب برای افراد وگان و گیاهخواران',
        'غیر لبنی',
        'فاقد لاکتوز و کلسترول',
        'استحکام استخوان ها',
        'کاهش علائم یائسگی'
      ],
      sellCounts: 0,
      imageAsset: 'assets/images/soyZireCheese450gBekr.png',
    ),
    Product(
      name: 'پنیر سویا شوید ( توفو ) 450 گرمی بکر',
      price: 85000,
      description: [
        'تهیه شده به صورت غیر لبنی',
        'مناسب برای استفاده افراد وگان',
        'بدون لاکتوز و کلسترول',
        'کاهش وزن',
        'حفظ سلامت قلب'
      ],
      category: 'لبنیات',
      productId: 102,
      imageAsset: 'assets/images/soyZireCheese450gBekr.png',
      sellCounts: 7,
    ),
    Product(
      name: 'پنیر یونانی آلیما 300 گرمی',
      price: 52900,
      productId: 103,
      category: 'لبنیات',
      description: [
        'سرشار از پروتئین',
        'منبع غنی از مواد معدنی',
        'تقویت سیستم گوارش بدن',
        'ضد حساسیت'
      ],
      imageAsset: 'assets/images/greekCheese300gAlima.png',
      sellCounts: 10,
    ),
    Product(
      name: 'پنیر فتا دوشه کم نمک و کم چرب 300 گرمی هراز',
      price: 37000,
      category: 'لبنیات',
      description: ['کم نمک', 'کم چرب', 'بدون اسیدهای چرب ترانس', 'بدون قند'],
      productId: 104,
      sellCounts: 19,
      imageAsset: 'assets/images/fataDooshe.png',
    ),
    Product(
        name: 'شیر بدون لاکتوز بدون چربی کاله 1 لیتری',
        price: 31000,
        category: 'لبنیات',
        productId: 105,
        description: [
          'تهیه شده به صورت فرادما برای ماندگاری بالا',
          'سرشار از مواد مغذی',
          'کمک به تقویت استخوان ها',
          'جلوگیری از کم خونی',
          'کاهش وزن',
          'حفظ سلامت قلب و عروق'
        ],
        sellCounts: 15,
        imageAsset: 'assets/images/milkWithoutFatKaleh1L.png'),
    Product(
      name: 'شیر غنی شده مادران ماجان 1 لیتری',
      price: 55000,
      category: 'لبنیات',
      productId: 106,
      description: [
        'سرشار از مواد معدنی و مواد مغذی',
        'غنی شده با کلسیم، پروتئین و ویتامین های A ،C ،D',
        'تقویت سیستم ایمنی بدن',
        'جلوگیری از کم خونی',
        'استحکام استخوان ها',
        'حفظ سلامت قلب و عروق'
      ],
      sellCounts: 12,
      imageAsset: 'assets/images/milkForMothers1LMajan.png',
    ),
    Product(
      name: 'کشک درشت هایپرارگانو 250 گرمی',
      category: 'لبنیات',
      price: 110000,
      productId: 107,
      description: [
        'سرشار از کلسیم',
        'کاهش وزن',
        'بهبود اعصاب و کاهش استرس',
        'جلوگیری از پوکی استخوان',
        'رفع مشکل سو هاضمه',
      ],
      sellCounts: 7,
      imageAsset: 'assets/images/hugeCurd250gHyperOrgano.png',
    ),
    Product(
      name: 'کشک رشته ای 400 گرمی نفس',
      price: 85000,
      category: 'لبنیات',
      productId: 108,
      description: [
        'بدون مواد نگهدارنده',
        'سرشار از کلسیم',
        'پیشگیری از پوکی استخوان',
      ],
      sellCounts: 16,
      imageAsset: 'assets/images/curd400gNafas.png',
    ),
    Product(
      name: 'کشک ریز هایپرارگانو 250 گرمی',
      category: 'لبنیات',
      price: 110000,
      productId: 109,
      description: [
        'رفع مشکل سو هاضمه',
        'سرشار از پروتئین و کلسیم',
        'نرم کننده پوست و مو',
        'جلوگیری از پوکی استخوان',
      ],
      sellCounts: 11,
      imageAsset: 'assets/images/smallCurd250gHyperOrgano.png',
    ),
    Product(
      name: 'کشک سنتی هایپرارگانو 250 گرمی',
      price: 110000,
      description: [
        'کاهش وزن',
        'بهبود اعصاب و کاهش استرس',
        'رفع مشکل سو هاضمه',
        'نرم کننده مو و پوست',
        'جلوگیری از پوکی استخوان ها',
        'کاهش سطح کلسترول'
      ],
      category: 'لبنیات',
      productId: 110,
      sellCounts: 11,
      imageAsset: 'assets/images/nativeCurd250gHyperOrgano.png',
    ),
    Product(
      name: 'ماست ايسلندی 900 گرمی کاله',
      price: 69000,
      productId: 111,
      sellCounts: 13,
      category: 'لبنیات',
      description: [
        'حاوی 90 گرم پروتئین',
        'بدون چربی',
        'پاستوریزه',
      ],
      imageAsset: 'assets/images/icelandishYoghourt900gKaleh.png',
    ),
    Product(
      name: 'آجيل پروتئين 200 گرمی هایوا',
      price: 92000,
      productId: 200,
      category: 'پروتئین',
      description: [
        'ترکیب کینوا، کنجد، عدس، شاهدانه و تخم کتان',
        'قابل استفاده در سالاد، کینوا، اسموتی و…',
        'وگان'
      ],
      sellCounts: 12,
      imageAsset: 'assets/images/proteinNuts200gHayva.png',
    ),
    Product(
      name: 'تنقلات سالم',
      productId: 201,
      price: 130000,
      description: ['تنقلات سالم', 'وگان', 'مغذی'],
      category: 'پروتئین',
      imageAsset: 'assets/images/fatBurnerNuts200gHayva.png',
      sellCounts: 13,
    ),
    Product(
      name: 'آرد جادویی پروتئینه کتووانیلا 150 گرمی',
      productId: 202,
      price: 140000,
      category: 'پروتئین',
      description: [
        'بدون لاکتوز',
        'بدون گلوتن',
        'بدون شکر',
        'سرشار از پروتئین'
      ],
      imageAsset: 'assets/images/magicalProteinFlour150gKetovanila.png',
      sellCounts: 15,
    ),
    Product(
      name: 'اسپاگتی وگن سمولینا پلاس زرماکارون 400 گرمی',
      productId: 203,
      price: 46000,
      category: 'پروتئین',
      description: [
        'سرشار از امگا3',
        'دارای ویتامین ب12',
        'تامین مواد مغذی مورد نیاز گیاهخواران'
      ],
      sellCounts: 13,
      imageAsset: 'assets/images/veganSpaghetti400gZarMakaron.png',
    ),
    Product(
      name: 'اسنک برنجی زیره سیاه 120 گرمی سيس رايس',
      price: 31650,
      productId: 204,
      category: 'پروتئین',
      description: [
        'فاقد گلوتن',
        'منبع فیبر و کربوهیدرات',
        'بدون قند، بدون نمک، بدون چربی'
      ],
      sellCounts: 8,
      imageAsset: 'assets/images/zireSiahRiceSnack120gSisRice.png',
    ),
    Product(
      name: 'اسنک برنجی شوید 120 گرمی سيس رايس',
      productId: 205,
      price: 31650,
      description: ['رژیمی', 'بدون قند', 'بدون گلوتن', 'منبع فیبر و پروتئین'],
      category: 'پروتئین',
      sellCounts: 10,
      imageAsset: 'assets/images/shividRiceSnack120gSisRice.png',
    ),
    Product(
      name: 'پودر جلبک اسپرولینا با طعم انبه آلگوتب',
      productId: 206,
      price: 270000,
      category: 'پروتئین',
      description: [
        'سرشاز از مواد مغذی',
        'افزایش سوخت و ساز بدن',
        'ارزش غذایی بالا'
      ],
      sellCounts: 2,
      imageAsset: 'assets/images/algaePowderWithMangoTasteAlgotab.png',
    ),
    Product(
      category: 'پروتئین',
      productId: 207,
      name: 'پودر جلبک اسپرولینا با طعم طالبی آلگوتب 100 گرمی',
      price: 270000,
      description: [
        'ضد پیری',
        'شادابی پوست',
        'مناسب برای ورزشکاران',
        'انرژی زا'
      ],
      imageAsset: 'assets/images/algaePowderWithCantaloupeTaste100gAlgotab.png',
      sellCounts: 1,
    ),
    Product(
      name: 'پودر جلبک اسپرولینا با طعم موز آلگوتب',
      price: 270000,
      productId: 208,
      category: 'پروتئین',
      description: [
        'سرشار از مواد معدنی و مغذی',
        'دارای امگا 3، EPA و DHA',
        'چربی سوز طبیعی',
        'حاوی شیرین کننده ارگانیک و طبیعی'
      ],
      imageAsset: 'assets/images/algaePowderWithBananaTaste100gAlgotab.png',
      sellCounts: 4,
    ),
    Product(
      name: 'جو دوسر پرک صبحانه 300 گرمی میلز',
      price: 75000,
      productId: 209,
      category: 'پروتئین',
      description: [
        'سرشار از پروتئین و فیبر (مخصوص رژیم غذایی و ورزشکاران)',
        'مخصوص صبحانه و پرک شده',
        'استفاده به دو روش سرد و گرم'
      ],
      sellCounts: 20,
      imageAsset: 'assets/images/oatMeal300gMealz.png',
    ),
    Product(
        name: 'دانه آمارانت 220 گرمی هانی فود',
        price: 180000,
        productId: 210,
        category: 'پروتئین',
        description: [
          'جلوگیری از سنگ کلیه',
          'کاهش قند خون',
          'کاهش وزن',
          'تقویت سیستم گوارش'
        ],
        sellCounts: 14,
        imageAsset: 'assets/images/amaranthSeed220gHoneyFood.png'),
    Product(
      name: 'سوی برگر 500 گرمی بکر',
      price: 75000,
      productId: 211,
      category: 'پروتئین',
      description: [
        'مناسب افراد وگان',
        'فیبر بالا',
        'تشکیل شده از سویا و آرد',
        'بدون نگهدارنده و مواد مضر'
      ],
      sellCounts: 0,
      imageAsset: 'assets/images/soyBurger500gBekr.png',
    ),
    Product(
      name: 'روغن سرخ کردنی حاوی روغن کنجد عقاب 780 گرمی',
      price: 119500,
      productId: 300,
      category: 'روغن',
      description: ['روغن آفتابگردان', 'روغن کنجد', 'روغن کلزا', 'روغن ذرت'],
      sellCounts: 13,
      imageAsset: 'assets/images/roastOil780gOghab.png',
    ),
    Product(
      name: 'روغن حیوانی نیک منش 450 گرمی',
      price: 252000,
      productId: 301,
      category: 'روغن',
      description: [
        'حاوی عطر و طعم طبیعی',
        'ماندگاری طولانی مدت',
        'بسته بندی بهداشتی'
      ],
      sellCounts: 13,
      imageAsset: 'assets/images/animalOil450gNikManesh.png',
    ),
    Product(
      name: 'روغن حیوانی نیک منش 900 گرمی',
      price: 485000,
      productId: 302,
      category: 'روغن',
      description: [
        'حاوی عطر و طعم طبیعی',
        'ماندگاری طولانی مدت',
        'بسته بندی بهداشتی'
      ],
      imageAsset: 'assets/images/animalOil900gNikManesh.png',
    ),
    Product(
        name: 'روغن زیتون اسپری 250 میلی لیتر اسکارلت',
        price: 180000,
        productId: 303,
        category: 'روغن',
        description: [
          'ضد سرطان',
          'ضد التهاب',
          'کمک به سلامت قلب',
          'جلوگیری از سکته قلبی'
        ],
        sellCounts: 12,
        imageAsset: 'assets/images/oliveSprayOil250mlScarlet.png'),
    Product(
      name: 'روغن زیتون بدون بو اسکارلت 500 میلی لیتری',
      price: 299000,
      productId: 304,
      category: 'روغن',
      description: ['روغن زیتون اسپانیایی', 'بدون بو', 'تصفیه شده', 'ضد سرطان'],
      sellCounts: 12,
      imageAsset: 'assets/images/oliveOil500mlScarlet.png',
    ),
    Product(
      name: 'روغن زیتون بکر میلانو 500 میلی لیتری',
      price: 270000,
      productId: 305,
      category: 'روغن',
      description: [
        'روغن زیتون بکر درجه یک پالایش شده بی بو',
        'مناسب برای سرخ کردنی، پخت و پز و سالاد',
        'محصول ایتالیا'
      ],
      sellCounts: 12,
      imageAsset: 'assets/images/oliveOil500mlMilano.png',
    ),
    Product(
      name: 'روغن زیتون بکر میلانو 750 میلی لیتری',
      price: 395000,
      productId: 306,
      category: 'روغن',
      description: [
        'روغن زیتون بکر درجه یک پالایش شده بی بو',
        'مناسب برای سرخ کردنی، پخت و پز و سالاد',
        'محصول ایتالیا'
      ],
      sellCounts: 13,
      imageAsset: 'assets/images/oliveOil750mlMilano.png',
    ),
    Product(
      name: 'روغن زیتون سرخ کردنی 1.8 لیتری اسکارلت',
      price: 329200,
      productId: 307,
      category: 'روغن',
      description: [
        'بدون پالم',
        'حاوی روغن زیتون، ذرت، کانولا و آفتابگردان',
        'سلامت قلب و عروق'
      ],
      sellCounts: 10,
      imageAsset: 'assets/images/oliveOil1.8LScarlet.png',
    ),
    Product(
      name: 'روغن زیتون فرابکر 3 لیتری ارگانیک اکسیر',
      price: 938000,
      productId: 308,
      category: 'روغن',
      description: ['تهیه شده با پرس سرد', 'گواهی ارگانیک اروپا'],
      sellCounts: 10,
      imageAsset: 'assets/images/oliveOil3LExir.png',
    ),
    Product(
        name: 'روغن زیتون فرابکر 450 میلی لیتر فدک',
        productId: 309,
        category: 'روغن',
        price: 175000,
        description: [
          'روغن ارگانیک',
          'منبع غنی آنتی اکسیدان',
          'ضد سرطان',
          'ضد التهاب'
        ],
        sellCounts: 11,
        imageAsset: 'assets/images/oliveOil450mlFadak.png'),
    Product(
      name: 'روغن زیتون فرابکر زیدوی زیدشت 1 لیتری',
      productId: 310,
      category: 'روغن',
      price: 367991,
      description: [
        '100% خالص و فرابکر + با بو',
        'تهیه شده به روش پرس سرد',
        'ساخت ایران'
      ],
      sellCounts: 20,
      imageAsset: 'assets/images/oliveOil1LZiDoi.png',
    ),
    Product(
      name: 'روغن زیتون فرابکر زیدوی زیدشت 250 میلی لیتری',
      productId: 311,
      category: 'روغن',
      price: 102500,
      description: [
        '100% خالص و فرابکر + با بو',
        'تهیه شده به روش پرس سرد',
        'ساخت ایران'
      ],
      sellCounts: 32,
      imageAsset: 'assets/images/oliveOil250mlZiDoi.png',
    ),
    Product(
      name: 'لوبیا عروس ارگانیک کلان آذر 900 گرمی',
      productId: 400,
      category: 'حبوبات',
      price: 62000,
      description: [
        'ارگانیک',
        'تهیه شده بدون استفاده از کود و سموم شیمیایی',
        'بهبود سلامت قلب',
        'تقویت سیستم ایمنی'
      ],
      sellCounts: 10,
      imageAsset: 'assets/images/beans900gKalanAzar.png',
    ),
    Product(
      name: 'ماش ارگانیک دارامان 600 گرمی',
      productId: 401,
      category: 'حبوبات',
      price: 90000,
      description: [
        'سرشار از آنتی اکسیدان',
        'فاقد مواد نگهدارنده',
        'ضد سرطان',
        'کاهش فشار خون',
        'تقویت سیستم ایمنی بدن'
      ],
      sellCounts: 12,
      imageAsset: 'assets/images/mush600gDaraman.png',
    ),
    Product(
        name: 'عدس ارگانیک 900 گرمی آبگینه',
        price: 115000,
        productId: 402,
        category: 'حبوبات',
        description: [
          'ارگانیک و فاقد هر گونه سم',
          'سرشار از پروتئین',
          'مناسب انواع سبک و رژیم غذایی'
        ],
        sellCounts: 13,
        imageAsset: 'assets/images/lentils900gAbgine.png'),
    Product(
      name: 'عدس ارگانیک 900 گرمی دارامان',
      price: 102000,
      productId: 403,
      category: 'حبوبات',
      sellCounts: 14,
      description: [
        'ارگانیک',
        'عدم استفاده از نهادهای شیمیایی',
        'سرشار از فیبر و پروتئین'
      ],
      imageAsset: 'assets/images/lentils900gDaraman.png',
    ),
    Product(
      name: 'لپه ارگانيک 600 گرمی نفس',
      price: 85000,
      productId: 404,
      category: 'حبوبات',
      sellCounts: 12,
      description: ['گذار به ارگانیک'],
      imageAsset: 'assets/images/legumes600gNafas.png',
    ),
    Product(
      name: 'لپه ارگانیک 900 گرمی آبگینه',
      price: 110000,
      productId: 405,
      category: 'حبوبات',
      sellCounts: 17,
      description: [
        'ارگانیک',
        'فاقد هر گونه سم',
        'سرشار از پروتئین',
        'کمک به کنترل قند خون'
      ],
      imageAsset: 'assets/images/legumes900gAbgine.png',
    ),
    Product(
      name: 'لپه ارگانیک 900 گرمی دارامان',
      price: 87300,
      productId: 406,
      category: 'حبوبات',
      description: [
        'ارگانیک',
        'عدم استفاده از نهادهای شیمیایی',
        'دارای گواهی ارگانیک از اروپا و ایران'
      ],
      sellCounts: 15,
      imageAsset: 'assets/images/legumes900gDaraman.png',
    ),
    Product(
      name: 'لوبیا چشم بلبلی 900 گرمی دارامان',
      price: 86000,
      productId: 407,
      category: 'حبوبات',
      description: ['ارگانیک', 'عدم استفاده از نهادهای شیمیایی'],
      sellCounts: 11,
      imageAsset: 'assets/images/cowpea900gDaraman.png',
    ),
    Product(
      name: 'لوبیا چشم بلبلی ارگانیک 900 گرمی آبگینه',
      price: 110000,
      productId: 408,
      category: 'حبوبات',
      description: [
        'ارگانیک و فاقد هر گونه کود و سم شیمیایی',
        'سرشار از آنتی اکسیدان',
        'سرشار از پروتئین، فیبر، ویتامین ها'
      ],
      sellCounts: 10,
      imageAsset: 'assets/images/cowpea900gAbgine.png',
    ),
    Product(
      name: 'لوبیا چیتی ارگانیک 900 گرمی آبگینه',
      price: 148000,
      productId: 409,
      category: 'حبوبات',
      description: ['ارگانیک و فاقد هر گونه سم', 'سرشار از پروتئین و فیبر'],
      sellCounts: 11,
      imageAsset: 'assets/images/pintoBeans900gAbgine.png',
    ),
    Product(
      name: 'لوبیا چیتی ارگانیک 900 گرمی دارامان',
      price: 126200,
      productId: 410,
      category: 'حبوبات',
      description: [
        'ارگانیک',
        'عدم استفاده از نهادهای شیمیایی',
        'منبع پروتئین، فیبر و آهن'
      ],
      sellCounts: 10,
      imageAsset: 'assets/images/pintoBeans900gDaraman.png',
    ),
    Product(
      name: 'لوبیا سفید ارگانیک 900 گرمی آبگینه',
      price: 135000,
      productId: 411,
      category: 'حبوبات',
      description: [
        'ارگانیک و فاقد هر گونه سم شیمیایی',
        'سرشار از فیبر و ویتامین'
      ],
      sellCounts: 9,
      imageAsset: 'assets/images/whiteBeans900gAbgine.png',
    ),
    Product(
      name: 'نان تافتون گندم با آرد کامل کنجدی کدخدا 500 گرمی',
      price: 38000,
      productId: 500,
      category: 'نان',
      description: [
        'دارای ارزش غذایی بالا',
        'مفید برای استخوان',
        'موثر در سلامت گوارش'
      ],
      sellCounts: 19,
      imageAsset: 'assets/images/taftoonGandom500gKadkhoda.png',
    ),
    Product(
      name: 'نان هات داگ بدون گلوتن سحر',
      price: 9500,
      productId: 501,
      category: 'نان',
      description: [
        'مناسب افراد حساس به گلوتن و سلیاکی',
        'دارای تاییده از انجمن سلیاک ایران',
        'محتوی آرد ذرت، برنج و سیب زمینی'
      ],
      sellCounts: 15,
      imageAsset: 'assets/images/hotdogBreadSahar.png',
    ),
    Product(
      name: 'پودر نان برانچی 300 گرمی آردینوفر',
      price: 189000,
      productId: 502,
      category: 'نان',
      description: [
        'پودر نیمه آماده نان بادام',
        '100% طبیعی',
        'کربوهیدارت کم',
        'بدون گلوتن'
      ],
      sellCounts: 13,
      imageAsset: 'assets/images/poodreNan300gArdinofar.png',
    ),
    Product(
      name: 'نان تست هفت غله سه نان',
      price: 38000,
      productId: 503,
      category: 'نان',
      description: [
        'تهیه شده با آرد چاودار',
        'حاوی مغز تخمه کدو، آفتابگردان و تخم کتان',
        'منبع فیبر'
      ],
      sellCounts: 12,
      imageAsset: 'assets/images/tostBreadSeNan.png',
    ),
    Product(
      name: 'نان جو با طعم پیاز و جعفری 300 گرمی شنتیا',
      price: 39500,
      productId: 504,
      category: 'نان',
      description: [
        '100 در 100 خالص',
        'ترد',
        'کاهش پوکی استخوان',
        'ضد باکتری و ضد التهاب'
      ],
      sellCounts: 7,
      imageAsset: 'assets/images/oatBreadOnionShentia.png',
    ),
    Product(
      name: 'نان جو با طعم ماست و موسیر 300 گرمی شنتیا',
      price: 39500,
      productId: 505,
      category: 'نان',
      description: [
        'سرشار از ویتامین C و پروتئین تقویت استخوان ها و جلوگیری از پوکی استخوان',
        'کاهش افسردگی',
        'ضد ویروس',
        'جلوگیری از سرما خوردگی و آلرژی',
        'کمک به سلامت مادر و جنین'
      ],
      sellCounts: 12,
      imageAsset: 'assets/images/oatBreadYoghourt300gShentia.png',
    ),
    Product(
      name: 'نان خشک جو سبزیجات 500 گرمی هباد',
      price: 50000,
      productId: 506,
      category: 'نان',
      description: [
        'تهیه شده با آرد بومی',
        'انرژی زا',
        'کاهش کلسترول خون',
        'جلوگیری از یبوست',
        'کاهش قند خون'
      ],
      sellCounts: 15,
      imageAsset: 'assets/images/oatBreadVeg500gHabad.png',
    ),
    Product(
        name: 'نان خشک جو کنجد و سیاهدانه 500 گرمی هباد',
        price: 50000,
        productId: 507,
        category: 'نان',
        description: [
          'تهیه شده با آرد بومی',
          'بدون مواد نگهدارنده',
          'تقویت سیستم ایمنی بدن'
        ],
        sellCounts: 13,
        imageAsset: 'assets/images/oatBreadSesameAndSiahdane500gHabad.png'),
    Product(
      name: 'نان خشک جو کنجدی 500 گرمی هباد',
      price: 45000,
      productId: 508,
      category: 'نان',
      description: [
        'تهیه شده با آرد بومی',
        'فاقد مواد نگهدارنده',
        'فاقد جوش شیرین',
        'کمک به درمان کم خونی',
        'طبع سرد و خشک'
      ],
      sellCounts: 12,
      imageAsset: 'assets/images/oatBreadSesame500gHabad.png',
    ),
    Product(
      name: 'نان خشک گندم پیاز و جعفری 500 گرمی هباد',
      price: 50000,
      productId: 509,
      category: 'نان',
      description: [
        'تهیه شده با آرد بومی',
        'ترکیبات اصلی : آرد گندم، نمک و آب'
      ],
      sellCounts: 17,
      imageAsset: 'assets/images/wheatBreadOnion500gHabad.png',
    ),
    Product(
        name: 'نان خشک گندم دانه چیا 500 گرمی هباد',
        price: 50000,
        productId: 510,
        category: 'نان',
        description: [
          'تهیه شده با آرد بومی',
          'بدون مواد نگهدارنده',
          'بدون جوش شیرین',
          'جلوگیری از یبوست',
          'خون ساز'
        ],
        sellCounts: 15,
        imageAsset: 'assets/images/wheatbreadChia500gHabad.png'),
    Product(
      name: 'نان خشک گندم سبزیجات 500 گرمی هباد',
      price: 50000,
      productId: 511,
      category: 'نان',
      description: ['تهیه شده با آرد بومی'],
      sellCounts: 13,
      imageAsset: 'assets/images/wheatBreadVeg500gHabad.png',
    ),
    Product(
      name: 'عسل آویشن ارگانیک 900 گرمی هاکان',
      price: 488000,
      productId: 600,
      category: 'عسل',
      description: [
        'عسل طبیعی',
        'عسل ارگانیک',
        'ضد باکتری',
        'انرژی زا',
        'آنتی اکسیدان قوی'
      ],
      sellCounts: 12,
      imageAsset: 'assets/images/900gHakan.png',
    ),
    Product(
      name: 'عسل ارگانیک هفت اقلیم 300 گرمی هاکان',
      price: 148000,
      productId: 601,
      category: 'عسل',
      description: [
        'عسل طبیعی',
        'ارگانیک',
        'طبع معتدل',
        'تقویت قوای جنسی',
        'مناسب برای افراد دیابتی'
      ],
      sellCounts: 10,
      imageAsset: 'assets/images/organic300gHakan.png',
    ),
    Product(
      name: 'عسل ارگانیک هفت اقلیم 600 گرمی هاکان',
      price: 278000,
      productId: 602,
      category: 'عسل',
      description: [
        'تهیه شده از 7 نوع عسل مختلف',
        'دارای طبع متعدل',
        'تقویت قوای جنسی'
      ],
      sellCounts: 12,
      imageAsset: 'assets/images/organic600gHakan.png',
    ),
    Product(
      name: 'عسل ارگانیک هفت اقلیم 900 گرمی هاکان',
      price: 398000,
      productId: 603,
      category: 'عسل',
      description: [
        'تهیه شده از 7 عسل کوهستانی',
        'مناسب برای دیابتی ها',
        'دارای طبع معتدل',
        'صد در صد ارگانیک'
      ],
      sellCounts: 11,
      imageAsset: 'assets/images/organic900gHakan.png',
    ),
    Product(
      name: 'عسل اقلیم کردستان 600 گرمی هاکان',
      price: 328000,
      productId: 604,
      category: 'عسل',
      description: [
        'عسل طبیعی و خالص',
        'عسل ارگانیک',
        'برداشت شده از سردشت',
        'انرژی زا'
      ],
      sellCounts: 9,
      imageAsset: 'assets/images/kurdistan600gHakan.png',
    ),
    Product(
      name: 'عسل بکر کوهستان (آذربایجان غربی) هاکان 600 گرمی',
      price: 558000,
      productId: 605,
      category: 'عسل',
      description: [
        'مناطق بکر و کاملا طبیعی',
        'خام و صاف نشده',
        'طعم و عطر جادویی'
      ],
      sellCounts: 9,
      imageAsset: 'assets/images/bekrSouthAzerbaijan600gHakan.png',
    ),
    Product(
      name: 'عسل بکر کوهستان 600 گرمی هاکان',
      price: 558000,
      productId: 606,
      category: 'عسل',
      description: [
        'دارای ضمانت نامه',
        'کندو در مناطق بکر',
        'عطر و طعم جادویی'
      ],
      sellCounts: 11,
      imageAsset: 'assets/images/bekr600gHakan.png',
    ),
    Product(
      name: 'عسل بکر کوهستان کبودرآهنگ هاکان 600 گرمی',
      price: 398000,
      productId: 607,
      category: 'عسل',
      description: [
        'ساکاروز زیر 3 درصد',
        'برداشت : ارتفاعات اشنویه (آذربایجان غربی)'
      ],
      sellCounts: 12,
      imageAsset: 'assets/images/bekrKabudarAhang600gHakan.png',
    ),
    Product(
      name: 'عسل بهارنارنج ارگانیک 600 گرمی هاکان',
      price: 318000,
      productId: 608,
      category: 'عسل',
      description: ['عسل ارگانیک طبیعی', 'آرام بخش', 'تقویت حافظه'],
      sellCounts: 11,
      imageAsset: 'assets/images/baharNarenj600gHakan.png',
    ),
    Product(
      name: 'عسل بهارنارنج ارگانیک یک کیلوگرمی مدا',
      price: 250000,
      productId: 609,
      category: 'عسل',
      description: ['ارگانیک', 'طبیعی', 'دارای طبع گرم'],
      sellCounts: 10,
      imageAsset: 'assets/images/baharNarenj1kgMeda.png',
    ),
    Product(
      name: 'عسل جاوشیر ممتاز هاکان 600 گرمی',
      price: 358000,
      productId: 610,
      category: 'عسل',
      description: [
        'سرشار از آنتی اکسیدان',
        'تقویت سیستم ایمنی',
        'جلوگیری از بیماری های قلبی'
      ],
      sellCounts: 11,
      imageAsset: 'assets/images/jaushir600gHakan.png',
    ),
    Product(
      name: 'عسل پونه کوهی 600 گرمی هاکان',
      price: 358000,
      productId: 611,
      category: 'عسل',
      description: ['عسل طبیعی', 'ضد نفخ', 'ضد انگل', 'آنتی بیوتیک قوی'],
      sellCounts: 11,
      imageAsset: 'assets/images/pooneKoohi600gHakan.png',
    ),
  ];

  static List<Product> getFavouriteProducts() {
    List<Product> favouriteList = Product.productList;
    return favouriteList
        .where((element) => element.isFavourited == true)
        .toList();
  }

  static List<Product> addToCartProducts() {
    List<Product> favouriteList = Product.productList;
    return favouriteList
        .where((element) => element.isSelected == true)
        .toList();
  }

  static Map<Product, int> shoppingCartMap = {};
}
