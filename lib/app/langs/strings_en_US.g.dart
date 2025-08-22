///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEnUs = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.enUs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en-US>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAppEnUs app = TranslationsAppEnUs.internal(_root);
	Map<String, String> get bottomNav => {
		'casino': 'Casino',
		'live_casino': 'Live Casino',
		'crash_games': 'Crash Games',
		'promotions': 'Promotions',
		'sports': 'Sports',
		'live': 'Live',
		'coming_soon': 'Coming Soon',
		'betting': 'Betting',
		'explore': 'Explore',
	};
	Map<String, String> get locales => {
		'en-US': 'English (US)',
		'pt-BR': 'Portuguese (Brazil)',
	};
	late final TranslationsSportsEnUs sports = TranslationsSportsEnUs.internal(_root);
	late final TranslationsBetslipEnUs betslip = TranslationsBetslipEnUs.internal(_root);
	late final TranslationsBetslipErrorsEnUs betslipErrors = TranslationsBetslipErrorsEnUs.internal(_root);
}

// Path: app
class TranslationsAppEnUs {
	TranslationsAppEnUs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en-US: 'KTO'
	String get title => 'KTO';

	/// en-US: 'Login'
	String get login => 'Login';

	/// en-US: 'Register'
	String get register => 'Register';

	/// en-US: 'or'
	String get or => 'or';
}

// Path: sports
class TranslationsSportsEnUs {
	TranslationsSportsEnUs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en-US: 'Start time: '
	String get startTimePrefix => 'Start time: ';

	/// en-US: 'Today'
	String get today => 'Today';

	/// en-US: 'Tomorrow'
	String get tomorrow => 'Tomorrow';

	/// en-US: 'Day after tomorrow'
	String get dayAfterTomorrow => 'Day after tomorrow';
}

// Path: betslip
class TranslationsBetslipEnUs {
	TranslationsBetslipEnUs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	Map<String, String> get combination => {
		'sizeCombination': 'Parlay',
		'sizeDouble': 'Parlay (2 Picks)',
		'sizeDoubles': '2 Pick Round Robin',
		'sizeEight': 'Parlay (8 Picks)',
		'sizeEighteen': 'Parlay (18 Picks)',
		'sizeEights': '8 Pick Round Robin',
		'sizeEleven': 'Parlay (11 Picks)',
		'sizeElevens': '11 Pick Round Robin',
		'sizeFifteen': 'Parlay (15 Picks)',
		'sizeFifty': 'Fiftyfold',
		'sizeFive': 'Parlay (5 Picks)',
		'sizeFives': '5 Pick Round Robin',
		'sizeForty': 'Fortyfold',
		'sizeFortyEight': 'Fortyeightfold',
		'sizeFortyFive': 'Fortyfivefold',
		'sizeFortyFour': 'Fortyfourfold',
		'sizeFortyNine': 'Fortyninefold',
		'sizeFortyOne': 'Fortyonefold',
		'sizeFortySeven': 'Fortysevenfold',
		'sizeFortySix': 'Fortysixfold',
		'sizeFortyThree': 'Fortythreefold',
		'sizeFortyTwo': 'Fortytwofold',
		'sizeFour': 'Parlay (4 Picks)',
		'sizeFours': '4 Pick Round Robin',
		'sizeFourteen': 'Parlay (14 Picks)',
		'sizeNine': 'Parlay (9 Picks)',
		'sizeNines': '9 Pick Round Robin',
		'sizeNineteen': 'Parlay (19 Picks)',
		'sizeSeven': 'Parlay (7 Picks)',
		'sizeSevens': '7 Pick Round Robin',
		'sizeSeventeen': 'Parlay (17 Picks)',
		'sizeSingle': 'Single',
		'sizeSingles': 'Singles',
		'sizeSix': 'Parlay (6 Picks)',
		'sizeSixs': '6 Pick Round Robin',
		'sizeSixteen': 'Parlay (16 Picks)',
		'sizeSystem': 'Round Robins',
		'sizeTen': 'Parlay (10 Picks)',
		'sizeTens': '10 Pick Round Robin',
		'sizeThirtheen': 'Parlay (13 Picks)',
		'sizeThirty': 'Thirtyfold',
		'sizeThirtyEight': 'Thirtyeightfold',
		'sizeThirtyFive': 'Thirtyfivefold',
		'sizeThirtyFour': 'Thirtyfourfold',
		'sizeThirtyNine': 'Thirtyninefold',
		'sizeThirtyOne': 'Thirtyonefold',
		'sizeThirtySeven': 'Thirtysevenfold',
		'sizeThirtySix': 'Thirtysixfold',
		'sizeThirtyThree': 'Thirtythreefold',
		'sizeThirtyTwo': 'Thirtytwofold',
		'sizeTriple': 'Parlay (3 Picks)',
		'sizeTriples': '3 Pick Round Robin',
		'sizeTwelve': 'Parlay (12 Picks)',
		'sizeTwelves': '12 Pick Round Robin',
		'sizeTwenty': 'Twentyfold',
		'sizeTwentyEight': 'Twentyeightfold',
		'sizeTwentyFive': 'Twentyfivefold',
		'sizeTwentyFour': 'Twentyfourfold',
		'sizeTwentyNine': 'Twentyninefold',
		'sizeTwentyOne': 'Twentyonefold',
		'sizeTwentySeven': 'Twentysevenfold',
		'sizeTwentySix': 'Twentysixfold',
		'sizeTwentyThree': 'Twentythreefold',
		'sizeTwentyTwo': 'Twentytwofold',
	};
	late final TranslationsBetslipSystemsEnUs systems = TranslationsBetslipSystemsEnUs.internal(_root);
}

// Path: betslipErrors
class TranslationsBetslipErrorsEnUs {
	TranslationsBetslipErrorsEnUs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en-US: 'Approve E/W terms change?'
	String get eachWayChangeApprove => 'Approve E/W terms change?';

	/// en-US: 'Live betting not available in your region due to current regulations.'
	String get liveBettingNotAvailable => 'Live betting not available in your region due to current regulations.';

	/// en-US: 'Please note that you will not get Best Odds Guaranteed payouts for parlays larger than a {0}.'
	String get maxCombinationSizeRestrictionForBOG => 'Please note that you will not get Best Odds Guaranteed payouts for parlays larger than a {0}.';

	/// en-US: 'A maximum of {0} outcomes are allowed on the betslip'
	String get maximumOutcomes => 'A maximum of {0} outcomes are allowed on the betslip';

	/// en-US: 'Max Picks'
	String get maximumOutcomesHeader => 'Max Picks';

	/// en-US: 'You have exceeded the Maximum allowed outcomes on your betslip'
	String get maximumOutcomesInBetslip => 'You have exceeded the Maximum allowed outcomes on your betslip';

	/// en-US: 'Max Picks'
	String get maximumOutcomesTitle => 'Max Picks';

	/// en-US: 'Please note that Best Odds Guaranteed will not be applied when other rewards are used on the coupon.'
	String get mixedBestOddsAndOtherReward => 'Please note that Best Odds Guaranteed will not be applied when other rewards are used on the coupon.';

	/// en-US: 'One of the added bets can't be combined with one or several of the other bets.'
	String get notCombinableAny => 'One of the added bets can\'t be combined with one or several of the other bets.';

	/// en-US: 'Please note that some of the outcomes are related and cannot be combined. Parlays including the related outcomes have been removed.'
	String get notCombinable => 'Please note that some of the outcomes are related and cannot be combined. Parlays including the related outcomes have been removed.';

	/// en-US: 'Sorry, the selected outcomes cannot be combined or you have exceeded the max number of outcomes'
	String get notCombinableOutcomesNotRemoved => 'Sorry, the selected outcomes cannot be combined or you have exceeded the max number of outcomes';

	/// en-US: 'Approve E/W terms and odds change?'
	String get oddsAndEachWayChangeApprove => 'Approve E/W terms and odds change?';

	/// en-US: 'Approve odds change'
	String get oddsChangeApprove => 'Approve odds change';

	/// en-US: 'The potential payout exceeds the maximum allowed winnings for the reward you selected.'
	String get potentialPayoutHigherThanMaxExtraWinnings => 'The potential payout exceeds the maximum allowed winnings for the reward you selected.';

	/// en-US: 'Sorry, currently it is not possible to combine live and non-live bets.'
	String get prematchAndLiveEventsMixed => 'Sorry, currently it is not possible to combine live and non-live bets.';

	/// en-US: 'The stake you added exceeds the maximum allowed stake for the reward you selected.'
	String get stakeHigherThanMaxStake => 'The stake you added exceeds the maximum allowed stake for the reward you selected.';

	/// en-US: 'Your to win amount requires a stake that is too low.'
	String get stakeTooLowForToWin => 'Your to win amount requires a stake that is too low.';
}

// Path: betslip.systems
class TranslationsBetslipSystemsEnUs {
	TranslationsBetslipSystemsEnUs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	Map<String, String> get betPackage => {
		'canadian': 'Canadian',
		'heinz': 'Heinz',
		'lucky15': 'Lucky 15',
		'lucky31': 'Lucky 31',
		'lucky63': 'Lucky 63',
		'patent': 'Patent',
		'superheinz': 'Super Heinz',
		'trixie': 'Trixie',
		'yankee': 'Yankee',
	};

	/// en-US: 'Bets'
	String get bets => 'Bets';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app.title': return 'KTO';
			case 'app.login': return 'Login';
			case 'app.register': return 'Register';
			case 'app.or': return 'or';
			case 'bottomNav.casino': return 'Casino';
			case 'bottomNav.live_casino': return 'Live Casino';
			case 'bottomNav.crash_games': return 'Crash Games';
			case 'bottomNav.promotions': return 'Promotions';
			case 'bottomNav.sports': return 'Sports';
			case 'bottomNav.live': return 'Live';
			case 'bottomNav.coming_soon': return 'Coming Soon';
			case 'bottomNav.betting': return 'Betting';
			case 'bottomNav.explore': return 'Explore';
			case 'locales.en-US': return 'English (US)';
			case 'locales.pt-BR': return 'Portuguese (Brazil)';
			case 'sports.startTimePrefix': return 'Start time: ';
			case 'sports.today': return 'Today';
			case 'sports.tomorrow': return 'Tomorrow';
			case 'sports.dayAfterTomorrow': return 'Day after tomorrow';
			case 'betslip.combination.sizeCombination': return 'Parlay';
			case 'betslip.combination.sizeDouble': return 'Parlay (2 Picks)';
			case 'betslip.combination.sizeDoubles': return '2 Pick Round Robin';
			case 'betslip.combination.sizeEight': return 'Parlay (8 Picks)';
			case 'betslip.combination.sizeEighteen': return 'Parlay (18 Picks)';
			case 'betslip.combination.sizeEights': return '8 Pick Round Robin';
			case 'betslip.combination.sizeEleven': return 'Parlay (11 Picks)';
			case 'betslip.combination.sizeElevens': return '11 Pick Round Robin';
			case 'betslip.combination.sizeFifteen': return 'Parlay (15 Picks)';
			case 'betslip.combination.sizeFifty': return 'Fiftyfold';
			case 'betslip.combination.sizeFive': return 'Parlay (5 Picks)';
			case 'betslip.combination.sizeFives': return '5 Pick Round Robin';
			case 'betslip.combination.sizeForty': return 'Fortyfold';
			case 'betslip.combination.sizeFortyEight': return 'Fortyeightfold';
			case 'betslip.combination.sizeFortyFive': return 'Fortyfivefold';
			case 'betslip.combination.sizeFortyFour': return 'Fortyfourfold';
			case 'betslip.combination.sizeFortyNine': return 'Fortyninefold';
			case 'betslip.combination.sizeFortyOne': return 'Fortyonefold';
			case 'betslip.combination.sizeFortySeven': return 'Fortysevenfold';
			case 'betslip.combination.sizeFortySix': return 'Fortysixfold';
			case 'betslip.combination.sizeFortyThree': return 'Fortythreefold';
			case 'betslip.combination.sizeFortyTwo': return 'Fortytwofold';
			case 'betslip.combination.sizeFour': return 'Parlay (4 Picks)';
			case 'betslip.combination.sizeFours': return '4 Pick Round Robin';
			case 'betslip.combination.sizeFourteen': return 'Parlay (14 Picks)';
			case 'betslip.combination.sizeNine': return 'Parlay (9 Picks)';
			case 'betslip.combination.sizeNines': return '9 Pick Round Robin';
			case 'betslip.combination.sizeNineteen': return 'Parlay (19 Picks)';
			case 'betslip.combination.sizeSeven': return 'Parlay (7 Picks)';
			case 'betslip.combination.sizeSevens': return '7 Pick Round Robin';
			case 'betslip.combination.sizeSeventeen': return 'Parlay (17 Picks)';
			case 'betslip.combination.sizeSingle': return 'Single';
			case 'betslip.combination.sizeSingles': return 'Singles';
			case 'betslip.combination.sizeSix': return 'Parlay (6 Picks)';
			case 'betslip.combination.sizeSixs': return '6 Pick Round Robin';
			case 'betslip.combination.sizeSixteen': return 'Parlay (16 Picks)';
			case 'betslip.combination.sizeSystem': return 'Round Robins';
			case 'betslip.combination.sizeTen': return 'Parlay (10 Picks)';
			case 'betslip.combination.sizeTens': return '10 Pick Round Robin';
			case 'betslip.combination.sizeThirtheen': return 'Parlay (13 Picks)';
			case 'betslip.combination.sizeThirty': return 'Thirtyfold';
			case 'betslip.combination.sizeThirtyEight': return 'Thirtyeightfold';
			case 'betslip.combination.sizeThirtyFive': return 'Thirtyfivefold';
			case 'betslip.combination.sizeThirtyFour': return 'Thirtyfourfold';
			case 'betslip.combination.sizeThirtyNine': return 'Thirtyninefold';
			case 'betslip.combination.sizeThirtyOne': return 'Thirtyonefold';
			case 'betslip.combination.sizeThirtySeven': return 'Thirtysevenfold';
			case 'betslip.combination.sizeThirtySix': return 'Thirtysixfold';
			case 'betslip.combination.sizeThirtyThree': return 'Thirtythreefold';
			case 'betslip.combination.sizeThirtyTwo': return 'Thirtytwofold';
			case 'betslip.combination.sizeTriple': return 'Parlay (3 Picks)';
			case 'betslip.combination.sizeTriples': return '3 Pick Round Robin';
			case 'betslip.combination.sizeTwelve': return 'Parlay (12 Picks)';
			case 'betslip.combination.sizeTwelves': return '12 Pick Round Robin';
			case 'betslip.combination.sizeTwenty': return 'Twentyfold';
			case 'betslip.combination.sizeTwentyEight': return 'Twentyeightfold';
			case 'betslip.combination.sizeTwentyFive': return 'Twentyfivefold';
			case 'betslip.combination.sizeTwentyFour': return 'Twentyfourfold';
			case 'betslip.combination.sizeTwentyNine': return 'Twentyninefold';
			case 'betslip.combination.sizeTwentyOne': return 'Twentyonefold';
			case 'betslip.combination.sizeTwentySeven': return 'Twentysevenfold';
			case 'betslip.combination.sizeTwentySix': return 'Twentysixfold';
			case 'betslip.combination.sizeTwentyThree': return 'Twentythreefold';
			case 'betslip.combination.sizeTwentyTwo': return 'Twentytwofold';
			case 'betslip.systems.betPackage.canadian': return 'Canadian';
			case 'betslip.systems.betPackage.heinz': return 'Heinz';
			case 'betslip.systems.betPackage.lucky15': return 'Lucky 15';
			case 'betslip.systems.betPackage.lucky31': return 'Lucky 31';
			case 'betslip.systems.betPackage.lucky63': return 'Lucky 63';
			case 'betslip.systems.betPackage.patent': return 'Patent';
			case 'betslip.systems.betPackage.superheinz': return 'Super Heinz';
			case 'betslip.systems.betPackage.trixie': return 'Trixie';
			case 'betslip.systems.betPackage.yankee': return 'Yankee';
			case 'betslip.systems.bets': return 'Bets';
			case 'betslipErrors.eachWayChangeApprove': return 'Approve E/W terms change?';
			case 'betslipErrors.liveBettingNotAvailable': return 'Live betting not available in your region due to current regulations.';
			case 'betslipErrors.maxCombinationSizeRestrictionForBOG': return 'Please note that you will not get Best Odds Guaranteed payouts for parlays larger than a {0}.';
			case 'betslipErrors.maximumOutcomes': return 'A maximum of {0} outcomes are allowed on the betslip';
			case 'betslipErrors.maximumOutcomesHeader': return 'Max Picks';
			case 'betslipErrors.maximumOutcomesInBetslip': return 'You have exceeded the Maximum allowed outcomes on your betslip';
			case 'betslipErrors.maximumOutcomesTitle': return 'Max Picks';
			case 'betslipErrors.mixedBestOddsAndOtherReward': return 'Please note that Best Odds Guaranteed will not be applied when other rewards are used on the coupon.';
			case 'betslipErrors.notCombinableAny': return 'One of the added bets can\'t be combined with one or several of the other bets.';
			case 'betslipErrors.notCombinable': return 'Please note that some of the outcomes are related and cannot be combined. Parlays including the related outcomes have been removed.';
			case 'betslipErrors.notCombinableOutcomesNotRemoved': return 'Sorry, the selected outcomes cannot be combined or you have exceeded the max number of outcomes';
			case 'betslipErrors.oddsAndEachWayChangeApprove': return 'Approve E/W terms and odds change?';
			case 'betslipErrors.oddsChangeApprove': return 'Approve odds change';
			case 'betslipErrors.potentialPayoutHigherThanMaxExtraWinnings': return 'The potential payout exceeds the maximum allowed winnings for the reward you selected.';
			case 'betslipErrors.prematchAndLiveEventsMixed': return 'Sorry, currently it is not possible to combine live and non-live bets.';
			case 'betslipErrors.stakeHigherThanMaxStake': return 'The stake you added exceeds the maximum allowed stake for the reward you selected.';
			case 'betslipErrors.stakeTooLowForToWin': return 'Your to win amount requires a stake that is too low.';
			default: return null;
		}
	}
}

