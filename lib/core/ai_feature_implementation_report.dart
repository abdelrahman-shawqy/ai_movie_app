// ============================================================================
// تقرير تنفيذ ميزة الشات بوت (AI Chatbot) - Gemini Interactions API
// ============================================================================
// الملف ده كله تعليقات بس (مفيش كود يتنفذ). الهدف إنك تفهم اللي اتعمل بالظبط
// وتقدر تعيده لوحدك بعدين.
//
// ملحوظة مهمة عن اللي اتفحص:
//  - اتبعتلي فولدر lib (النسخة القديمة اللي فيها features/ai) + pubspec.yaml
//    + .env + firebase.json. مبعتش لي lib/env/env.dart ولا env.g.dart ولا الفولدر
//    features/ai_chat_bot بتاعك، فاشتغلت على نسختي وسميت الفولدر ai_chat_bot،
//    وافترضت إن Env.geminiApiKey موجود زي ما قلت (راجع الجزء 6 و 10).
//  - pubspec.yaml اتقرا فعلاً: dio ^5.11.1, get_it ^9.3.0, bloc ^9.2.1,
//    flutter_bloc ^9.1.1, equatable ^3.0.0, fpdart ^1.2.0, envied ^1.3.10,
//    envied_generator ^1.3.10, build_runner ^2.15.1 (dev). مفيش حزم اتضافت.
//  - كمان من الكود نفسه المشروع بيستخدم: dio, get_it, bloc/flutter_bloc,
//    equatable, fpdart, meta, google_fonts (من الـ imports الموجودة في الكود).
//
// ============================================================================
// الجزء 1 - فهم المعمارية الموجودة
// ============================================================================
// المشروع بيستخدم Clean Architecture بتلات طبقات جوه كل feature:
//
//  1) presentation: الشاشات (screens) + الودجتس (widgets) + الـ Cubit والـ State
//     (controller). دي الطبقة الوحيدة اللي بتعرف Flutter. شغلها تعرض الداتا
//     وتستقبل ضغطات المستخدم.
//  2) domain: الطبقة الوسطى. فيها الـ Repository (abstract class) والـ UseCase.
//     مش بتعرف حاجة عن Dio ولا الـ API، بتقول "إيه المطلوب" مش "إزاي".
//  3) data: التنفيذ الفعلي. الـ RemoteDataSource (بيكلم الـ API) + الـ Models
//     (بتحول JSON لكائنات Dart) + RepositoryImpl (بينفذ الـ Repository).
//
// مثال من Home: HomeUseCase -> RemoteHomeRepository (interface) ->
// RemoteHomeRepositoryImpl -> RemoteHomeDataSourceImpl -> ApiHelper -> Dio.
// الـ Cubit (مثلاً TrendingMoviesCubit) بينادي الـ UseCase ويعمل emit للـ State،
// والشاشة بتتغير بـ BlocBuilder.
//
// Either<Failure, T> (من fpdart): نتيجة أي عملية فيها حاجتين بس:
//  - Right(قيمة) لو نجحت.
//  - Left(Failure(رسالة)) لو فشلت.
// ده بيخلي الـ Cubit يعمل fold ويتعامل مع الحالتين من غير try/catch.
// ميزة الـ AI اتبنت على نفس الشكل بالظبط عشان تكون متناسقة مع باقي المشروع.
//
// ============================================================================
// الجزء 2 - تغييرات طبقة الـ presentation
// ============================================================================
// أ) ai_state.dart (ملف جديد)
//   - ChatMessage: رسالة واحدة (text + isUser) عشان نفرق رسالة المستخدم عن
//     رد المساعد.
//   - AiState: sealed class بتشيل قايمة messages. كل حالة (AiInitial, AiLoading,
//     AiSuccess, AiError) بتشيل المحادثة كلها، فمفيش رسايل بتضيع وقت التحميل
//     أو الخطأ. AiError زيادة عليها errorMessage.
//   - استخدمت Equatable زي باقي الـ states في المشروع.
//
// ب) ai_cubit.dart (ملف جديد) - AiCubit(SendMessageUseCase)
//   sendMessage(text):
//     1. trim للنص، ولو فاضي يرجع من غير ما يعمل حاجة.
//     2. لو الحالة الحالية AiLoading يرجع (منع الضغط المتكرر).
//     3. يضيف رسالة المستخدم للقايمة ويعمل emit(AiLoading(...)).
//     4. يستنى الـ UseCase.
//     5. لو الـ Cubit اتقفل (isClosed) يرجع من غير emit.
//     6. fold: نجاح -> AiSuccess بالرد مضاف. فشل -> AiError بنفس الرسايل
//        القديمة + رسالة الخطأ.
//   الـ Cubit مش بيعرف Dio ولا ApiHelper خالص.
//
// ج) chat_message_bubble.dart (ملف جديد) - ChatMessageBubble(text, isUser)
//   - رسالة المستخدم يمين بلون AppColors.dotColor، ورد المساعد شمال بلون
//     AppColors.PrimarySoft.
//   - ConstrainedBox بعرض أقصى 80% من الشاشة، والـ Text بيعمل wrap تلقائي
//     وبيحافظ على أسطر الرد (\n).
//   - الستايل من AppTextStyle.h5Medium500S14 مع copyWith للون الأبيض (مفيش
//     ستايل أبيض بنفس الحجم، فمعملتش ستايل جديد).
//   - مفيش أي API أو منطق جواه.
//
// د) ai_screen.dart (معدل)
//   - كان فيه Expanded مباشرة في body الـ Scaffold، وده غلط (Expanded لازم
//     يكون ابن Column/Row). اتصلح: Scaffold > SafeArea > Padding > Column.
//   - اتضاف BlocProvider(create: getIt<AiCubit>()) زي ما بيتعمل في
//     search_actor_result.dart. الـ Provider هو اللي بيقفل الـ Cubit.
//   - BlocConsumer: الـ builder بيرسم ListView.builder بالرسايل، وفي آخرها صف
//     زيادة: دايرة تحميل (AiLoading) أو رسالة الخطأ بلون secondaryOrange
//     (AiError). الـ listener بينزل بالـ scroll لآخر رسالة.
//   - ScreenHeader فضل زي ما هو. CustomTextFieldChat اتعدل (هـ تحت).
//
// هـ) CustomTextFieldChat (معدل، نفس الـ API + باراميتر اختياري isSending):
//   - كان الـ TextFormField جوه SizedBox بارتفاع ثابت (0.055 من الشاشة)، فالنص
//     الطويل كان بيتقص. اتشال الارتفاع الثابت وبقى minLines: 1 و maxLines: 5
//     (يكبر لحد 5 أسطر وبعدها يعمل scroll جواه) مع keyboardType multiline.
//   - الـ hint بقى hintText + hintStyle (نفس الشكل واللون)، والـ contentPadding
//     بقى بسيط لأن القديم كان معمول عشان الارتفاع الثابت.
//   - الزرار صغرته من 70 لـ 56 عشان الشاشات الصغيرة والكيبورد.
//   - الزرار بيتعطل (opacity 0.4 ومفيش onTap) لو النص فاضي أو isSending=true.
//     ValueListenableBuilder على الـ controller بيحدّث الزرار بس من غير setState.
//   - الـ controller مملوك للشاشة (الأب) وهي اللي بتعمله dispose، الودجت مبتعملش.
//   - بما إن الـ constructor بقى const اتشالت الـ non-const القديمة؛ الاستخدام
//     القديم (controller, send) لسه شغال.
//   زرار الإرسال: في الشاشة بقى
//   send: () { ... } بيقرأ controller.text، يعمل trim، لو فاضي أو AiLoading
//   يتجاهل، وإلا controller.clear() وبعدين context.read<AiCubit>().sendMessage.
//   مسح النص بيحصل بعد ما نتأكد إن الرسالة اتقبلت.
//
// و) ليه الـ Controllers لازم تتقفل؟ TextEditingController و ScrollController
//   بيحجزوا listeners وذاكرة. لو متعملهمش dispose بيحصل memory leak. اتعمل
//   dispose للاتنين في dispose() بتاعة الـ State. وفي _scrollToBottom بنتأكد
//   mounted و hasClients قبل الـ animateTo عشان نتجنب أخطاء async.
//
// ز) إزاي الرد بيظهر؟ الـ Cubit يعمل emit(AiSuccess(messages + الرد)) ->
//   BlocConsumer يعيد البناء -> ListView يعرض رسالة جديدة بـ ChatMessageBubble.
//
// ============================================================================
// الجزء 3 - تغييرات طبقة الـ data
// ============================================================================
// أ) gemini_interaction_model.dart (ملف جديد)
//   ليه محتاجين model؟ الرد JSON متداخل، ومينفعش نقرأه بـ response['steps'][0]
//   مباشرة لأنه ممكن يتغير أو ينقص. الموديل بيحوله لكائنات آمنة (null-safe).
//   - GeminiContentModel: type + text.
//   - GeminiStepModel: type + قايمة content (لو content مش List بتبقى فاضية).
//   - GeminiInteractionModel.fromJson: لو الـ body مش Map يرمي FormatException.
//     بيقرأ id/status/model و steps (whereType<Map> بيتخطى أي عنصر غريب).
//   - assistantText: بيلف على الـ steps، يتخطى أي step نوعه مش model_output
//     (يعني thought بيتجاهل)، وفي الـ content ياخد العناصر اللي type بتاعها
//     text ويضم نصوصها بالترتيب، وفي الآخر trim.
//   - isCompleted: status == 'completed'.
//
//   مثال على مسار الـ parsing (من غير أي أسرار):
//     {
//       "status": "completed",
//       "steps": [
//         {"type": "thought"},                                  <- بيتتخطى
//         {"type": "model_output",
//          "content": [{"type": "text", "text": "أهلاً"}]}      <- منه بنطلع "أهلاً"
//       ]
//     }
//     assistantText ترجع "أهلاً".
//
// ب) ai_remote_data_source.dart + ai_remote_data_source_impl.dart (جداد)
//   - الـ abstract فيه sendMessage({required String message}) بترجع Response.
//   - الـ Impl بياخد ApiHelper في الـ constructor (لازم يكون بتاع Gemini) وينادي
//     apiHelper.postData(endPoint: 'interactions',
//     data: {'model': 'gemini-3.5-flash-lite', 'input': message}).
//     الـ base URL الفعلي هو https://generativelanguage.googleapis.com/v1beta/
//     (بشرطة في الآخر) فالـ URL النهائي هو .../v1beta/interactions. ده نفس الـ endpoint المطلوب.
//   - عمداً مفيش try/catch ولا print هنا: الـ DioException بتطلع للـ
//     repository، ومفيش حاجة بتتطبع فمفيش خطر تسريب المفتاح.
//   - اسم الموديل اتساب زي ما هو. أنا ماقدرتش أتحقق إنه موجود فعلاً عند Google
//     (مفيش إنترنت للـ API من بيئتي). لو رجع 400 أو 404 راجع اسم الموديل.
//
// ج) ai_repository_impl.dart (جديد)
//   sendMessage:
//     1. ينادي الـ data source.
//     2. GeminiInteractionModel.fromJson(response.data).
//     3. لو status مش completed -> Left(Failure(...)).
//     4. لو النص فاضي -> Left(Failure('empty response')).
//     5. غير كده Right(answer) (String بس، الـ Dio Response مبيوصلش للـ UI).
//   catch: DioException -> رسالة مفهومة حسب النوع/الكود (timeout, مفيش نت،
//   400, 401/403 مفتاح غلط، 404, 429, 5xx). FormatException -> رد غير متوقع.
//   أي حاجة تانية -> رسالة عامة. الرسايل مفيهاش headers ولا المفتاح ولا stack
//   trace. وكمان معملتش print زي ما بيعمل Home، عشان ما نخاطرش بالتسريب.
//
// ============================================================================
// الجزء 4 - طبقة الـ domain
// ============================================================================
// - AiRepository (abstract): Future<Either<Failure, String>> sendMessage(String).
//   بتحدد "المطلوب" من غير تفاصيل الشبكة. ده بيخلي الـ UseCase والـ Cubit
//   ميتأثروش لو غيرنا مزود الـ AI، وبيسهل عمل mock في الاختبارات.
// - AiRepositoryImpl في طبقة الـ data لأنه بيعرف Dio والـ JSON (تفاصيل تنفيذ).
// - SendMessageUseCase: بياخد AiRepository وبيعرض sendMessage(message) اللي
//   بتنادي الـ repository بس. الـ Cubit بيكلمه هو فقط فمبيشوفش أي تفاصيل شبكة.
//   معملتش قواعد بيزنس زيادة (زي ما طلبت).
//
// ============================================================================
// الجزء 5 - تعديلات ApiHelper
// ============================================================================
// - الأصلي: postDat(){ _dio.post('',); } -> اسمه غلط، مفيش parameters، بيبعت
//   لـ endpoint فاضي، مفيش body ولا headers، ومبيرجعش Response ولا بيستنى
//   النتيجة (fire and forget). يعني مكانش ينفع يتستخدم.
// - اتبدل بـ postData({required endPoint, data, queryParameters, options}):
//     * data: الـ body (الـ Map بيتبعت JSON تلقائي).
//     * queryParameters: اختياري (بيتحول لـ null لو فاضي زي getData).
//     * options: Options? اختياري (مثلاً headers لطلب واحد بس).
//     * بترجع Future<Response>.
// - الـ helper فضل reusable: مفيهوش أي URL ولا مفتاح Gemini.
// - getData معدّلتهوش، فطلبات TMDB زي ما هي. وجريت على كل المشروع ملقتش أي
//   مكان بينادي postDat القديمة، فمحدش اتكسر بالاسم الجديد.
// - اخترت إن مفتاح Gemini يتحط في الـ BaseOptions بتاعة Gemini Dio (جزء 6)
//   بدل ما يتبعت مع كل طلب؛ بيفضل معزول عن TMDB ومش محتاج headers لكل نداء.
//   باراميتر options لسه متاح لو عايز تبعت header لطلب واحد.
//
// ============================================================================
// الجزء 6 - تغييرات Dependency Injection (di.dart)
// ============================================================================
// اتضاف في configureDependencies() بعد تسجيلات Search، وتسجيلات TMDB كلها
// فضلت زي ما هي (Dio و ApiHelper من غير اسم):
//
// 1) Dio باسم 'geminiDio' (LazySingleton): baseUrl = .../v1beta، headers فيها
//    x-goog-api-key (من Env.geminiApiKey في lib/env/env.dart، مش من constant.dart)
//    و
//    Content-Type: application/json، وtimeouts 60 ثانية للإرسال والاستقبال.
//    لازم يكون منفصل لأن Dio بتاع TMDB عنده base URL مختلف وفيه Authorization
//    Bearer بتاع TMDB؛ لو استخدمناه كنا هنبعت توكن TMDB لـ Google ومفتاح Google
//    لـ TMDB. الاسم (instanceName) بيمنع تعارض مع الـ Dio الأصلي.
// 2) ApiHelper باسم 'geminiApiHelper' (LazySingleton): بياخد
//    getIt<Dio>(instanceName: 'geminiDio').
// 3) AiRemoteDataSource -> AiRemoteDataSourceImpl(getIt<ApiHelper>(
//    instanceName: 'geminiApiHelper')) (LazySingleton). لو نسيت instanceName
//    كان هياخد ApiHelper بتاع TMDB وده غلط.
// 4) AiRepository -> AiRepositoryImpl(getIt<AiRemoteDataSource>()) (LazySingleton).
// 5) SendMessageUseCase(getIt<AiRepository>()) (LazySingleton).
// 6) AiCubit(getIt<SendMessageUseCase>()) بـ registerFactory: كل شاشة تاخد Cubit
//    جديد بمحادثة جديدة، والـ BlocProvider بيقفله لما الشاشة تتقفل.
// ترتيب التسجيل مش بيفرق مع Lazy (GetIt بيبني عند أول طلب) لكن كتبتهم بترتيب
// السلسلة: Dio -> ApiHelper -> DataSource -> Repository -> UseCase -> Cubit.
// وكمان اتضافت imports لملفات الـ AI في أول الملف. (ملحوظة: لو حد غير
// registerFactory بـ singleton فالمحادثة هتفضل بين فتح وغلق الشاشة.)
//
// ============================================================================
// الجزء 7 - تغييرات خارج features/ai_chat_bot
// ============================================================================
// 1) lib/core/network/api_helper.dart (معدل)
//    - المسؤولية الأصلية: غلاف حوالين Dio لـ GET.
//    - التغيير: استبدال postDat الناقصة بـ postData كاملة.
//    - السبب: الميزة محتاجة POST بـ body.
//    - التأثير: الـ data source بتاع AI بيستخدمها.
//    - باقي الميزات: متأثرتش (getData كما هو ولا حد كان بينادي postDat).
// 2) lib/core/dependency _injection/di.dart (معدل)
//    - المسؤولية: تسجيل كل الـ dependencies يدوياً بـ GetIt.
//    - التغيير: 6 تسجيلات جديدة (جزء 6) + 6 imports لملفات الـ AI + import لـ
//      lib/env/env.dart (عشان Env.geminiApiKey).
//    - السبب: عشان AiScreen تقدر تعمل getIt<AiCubit>().
//    - باقي الميزات: متأثرتش، التسجيلات القديمة ما اتلمستش.
//    - تعديلات الجولة التانية: المفتاح من Env بدل constant.dart، والـ baseUrl
//      بقى بشرطة في الآخر.
// 3) docs/ai_feature_implementation_report.dart (جديد): التقرير ده.
// ملفات معدّلتهاش (غير تغيير مسار الـ import في app_routes.dart لـ ai_chat_bot): main.dart, route.dart, constant.dart,
// failure.dart, colors.dart, app_text_styles.dart, screen_header.dart.
// الراوت aiScreen كان موجود وبيفتح AiScreen، والـ BlocProvider جوه الشاشة
// نفسها (زي Search) فمحتاجش تعديل. والـ Cubit متسجل مرة واحدة بس.
// تغيير صغير في ai_screen.dart: شلت import لـ profile_header_card لأنه مكانش
// مستخدم.
//
// ============================================================================
// الجزء 8 - مسار الطلب كامل (من الكتابة للشاشة)
// ============================================================================
// 1. المستخدم بيكتب في TextFormField جوه CustomTextFieldChat والنص بيتخزن في
//    الـ controller.
// 2. بيدوس على زرار الإرسال -> بينادي الـ callback send.
// 3. AiScreen بتقرأ النص، تعمل trim، وتنادي context.read<AiCubit>().sendMessage.
// 4. الـ Cubit بيتأكد إن النص مش فاضي ومفيش طلب شغال، يضيف رسالة المستخدم
//    ويعمل emit(AiLoading).
// 5. الـ Cubit بينادي SendMessageUseCase.sendMessage اللي بينادي الـ repository.
// 6. AiRepositoryImpl بينادي AiRemoteDataSource.sendMessage.
// 7. الـ data source بيعمل POST على /interactions بـ Gemini ApiHelper
//    (body: model + input).
// 8. Dio بيبعت الطلب ويستلم Response (أو يرمي DioException).
// 9. GeminiInteractionModel.fromJson بيحلل الـ JSON، وassistantText بيطلع
//    نص model_output بس.
// 10. الـ repository بيرجع Right(النص) أو Left(Failure).
// 11. الـ Cubit بيعمل fold ويعمل emit(AiSuccess) أو emit(AiError) مع الاحتفاظ
//     بالرسايل القديمة.
// 12. BlocConsumer يعيد بناء الشاشة، الرد يظهر في ChatMessageBubble وتنزل لآخر
//     رسالة.
//
// ============================================================================
// الجزء 9 - الاختبار وحل المشاكل
// ============================================================================
// طريقة الاختبار يدوياً (شغّل التطبيق وافتح شاشة الـ AI من Home):
//  - طلب ناجح: اكتب "Hello" وادوس إرسال -> تظهر رسالتك ودايرة تحميل ثم الرد.
//  - رسالة فاضية: ادوس إرسال من غير كتابة أو بمسافات بس -> مفيش حاجة تحصل.
//  - فشل الشبكة: اقفل النت وابعت -> رسالة "No internet connection" وتفضل
//    الرسايل القديمة.
//  - مفتاح غلط: غير قيمة GEMINI_API_KEY في .env مؤقتاً لقيمة غلط وشغل build_runner -> "Access denied...".
//  - رد غير متوقع: اعمل mock للـ data source يرجع {} أو status مختلف -> رسالة
//    "unexpected response" أو "could not complete".
//  - التحميل: حط throttling أو اعمل Future.delayed مؤقتاً وشوف الدايرة.
//  - ضغط متكرر: ادوس إرسال بسرعة -> الطلب التاني بيتتجاهل أثناء AiLoading.
//  - رد طويل: اطلب "اكتب مقال طويل" -> لازم يعمل wrap وscroll من غير overflow.
//  - الاحتفاظ بالرسايل بعد فشل: ابعت رسالة ناجحة، اقفل النت، ابعت تانية ->
//    الرسايل القديمة + رسالتك + رسالة الخطأ.
//
// نتايج الفحص الفعلية (بصراحة):
//  - flutter analyze: ماتنفذش. مفيش Flutter/Dart SDK في بيئتي ومقدرتش أنزله
//    (الشبكة بتمنع التحميل).
//  - dart format: ماتنفذش لنفس السبب.
//  - flutter test / تشغيل التطبيق / استدعاء Gemini الحقيقي: ماتنفذوش.
//  - اللي اتعمل: مراجعة يدوية للـ imports وأسماء الـ classes والـ constructors
//    وتسجيلات GetIt، وتأكدت إن ملف التقرير تعليقات بس.
//  لازم تشغل عندك: dart format lib docs ثم flutter analyze ثم شغل التطبيق.
//
// ============================================================================
// الجزء 10 - ملخص التعلم النهائي
// ============================================================================
//  - Dio و POST: dio.post(path, data: Map) بيبعت JSON. الـ baseUrl والـ headers
//    الثابتة بتتحط في BaseOptions.
//  - JSON parsing: مبنفترضش إن الحقول موجودة؛ بنتحقق من النوع (is Map / is List).
//  - Remote data source: بيبعت الطلب ويرجع Response بس.
//  - Repository: interface في domain والتنفيذ في data؛ بيحول الاستثناءات لـ Failure.
//  - UseCase: نقطة دخول بسيطة بين الـ Cubit والـ repository.
//  - Cubit و State: الـ state بيشيل المحادثة كلها عشان ميضيعش حاجة.
//  - GetIt: registerLazySingleton للخدمات، registerFactory للـ Cubit، و
//    instanceName للتفريق بين نسختين من نفس النوع (Dio/ApiHelper).
//  - BlocBuilder/BlocConsumer: بيعيد رسم الـ UI لما الـ state يتغير.
//  - Either و Failure: Right للنجاح و Left للفشل، والـ Cubit يعمل fold.
//  - تدفق الداتا: UI -> Cubit -> UseCase -> Repository -> DataSource -> ApiHelper
//    -> Dio، وبيرجع عكس الاتجاه ده.
//
// ملاحظات مهمة:
//  1) المحادثة محفوظة محلياً في الـ State للعرض بس. الطلب بيبعت الرسالة
//     الحالية فقط كـ input، فالموديل ملوش ذاكرة للمحادثة السابقة. ماطبقتش آلية
//     الاستمرار (conversation continuation) ومتأكدتش منها.
//  2) الأمان: مفتاح الـ API جوه تطبيق موبايل ممكن يتستخرج من الـ APK/IPA، وحفظه
//     في ملف constants أو Envied (obfuscation) مش بيخليه سري. قيّد المفتاح من Google Cloud (Android
//     package / iOS bundle) وحط حد استخدام، وفي الإنتاج الأفضل backend proxy.
//  3) الحزم: اتأكدت من pubspec.yaml إن كل اللي محتاجه موجود (dio, get_it,
//     flutter_bloc/bloc, equatable, fpdart, envied, build_runner). meta مستخدمة
//     في الـ states زي باقي المشروع بس مش مكتوبة صراحة في pubspec (بتيجي مع
//     Flutter SDK/bloc)، لو الـ analyzer اشتكى ضيفها. مفيش تغيير في pubspec.
//     ملحوظة: envied_generator في dependencies بدل dev_dependencies؛ ماغيرتوش.
//  4) التوافق مع الـ API: شكل الرد (steps/model_output) متبني على المثال اللي
//     اديتهولي ومتجربتوش على API حقيقي.
//  5) Envied و ملف .env (مهم): الملف اللي بعتهولي شكله كده: KEY ='value'; يعني
//     فيه مسافة قبل = وعلامة ; في الآخر. الـ parser بتاع envied غالباً هيقرا
//     القيمة بالـ ; وعلامات الاقتباس كجزء من المفتاح، وساعتها Google هترجع
//     401/403. الصيغة الصح: GEMINI_API_KEY=القيمة (من غير quotes ولا ;).
//     ماقدرتش أجربها لأن مفيش Flutter عندي، فالتأكد عليك. بعد أي تعديل في .env:
//        dart run build_runner build --delete-conflicting-outputs
//     ومتعدلش env.g.dart بإيدك. وخلي .env في .gitignore.
//     كمان المفتاح اتبعت في الشات، فالأحسن تعمل له rotate من Google AI Studio.
//  6) الـ ZIP: فيه الملفات اللي اتعدلت/اتعملت بس (من غير lib/env ومن غير
//     constant.dart/main.dart) لأني ماعنديش نسختك الحالية منهم. فك الـ ZIP
//     فوق lib بتاعك (merge) ومتمسحش lib الأصلي.
