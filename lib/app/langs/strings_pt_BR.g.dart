///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsPtBr extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPtBr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ptBr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt-BR>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsPtBr _root = this; // ignore: unused_field

	@override 
	TranslationsPtBr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPtBr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppPtBr app = _TranslationsAppPtBr._(_root);
	@override Map<String, String> get bottomNav => {
		'casino': 'Cassino',
		'live_casino': 'Cassino Ao Vivo',
		'crash_games': 'Crash Games',
		'promotions': 'Promoções',
		'sports': 'Esportes',
		'live': 'Ao Vivo',
		'coming_soon': 'Em Breve',
		'betting': 'Apostas',
		'explore': 'Explorar',
	};
	@override Map<String, String> get locales => {
		'en-US': 'English (US)',
		'pt-BR': 'Português (Brasil)',
	};
	@override late final _TranslationsSportsPtBr sports = _TranslationsSportsPtBr._(_root);
	@override late final _TranslationsBetslipPtBr betslip = _TranslationsBetslipPtBr._(_root);
	@override late final _TranslationsBetslipErrorsPtBr betslipErrors = _TranslationsBetslipErrorsPtBr._(_root);
}

// Path: app
class _TranslationsAppPtBr extends TranslationsAppEnUs {
	_TranslationsAppPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'KTO';
	@override String get login => 'Entrar';
	@override String get register => 'Registrar';
	@override String get or => 'ou';
}

// Path: sports
class _TranslationsSportsPtBr extends TranslationsSportsEnUs {
	_TranslationsSportsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get startTimePrefix => 'Horário de início: ';
	@override String get today => 'Hoje';
	@override String get tomorrow => 'Amanhã';
	@override String get dayAfterTomorrow => 'Depois de amanhã';
}

// Path: betslip
class _TranslationsBetslipPtBr extends TranslationsBetslipEnUs {
	_TranslationsBetslipPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override Map<String, String> get combination => {
		'sizeCombination': 'Combinação',
		'sizeDouble': 'Dupla',
		'sizeDoubles': 'Duplas',
		'sizeEight': 'Óctupla',
		'sizeEighteen': 'Dezoito seleções',
		'sizeEights': 'Óctupla',
		'sizeEleven': 'Undécupla',
		'sizeElevens': 'Undécupla',
		'sizeFifteen': 'Quinze seleções',
		'sizeFifty': 'Cinquenta seleções',
		'sizeFive': 'Quintupla',
		'sizeFives': 'Quintupla',
		'sizeForty': 'Quarenta seleções',
		'sizeFortyEight': 'Quarenta e oito seleções',
		'sizeFortyFive': 'Quarenta e cinco seleções',
		'sizeFortyFour': 'Quarenta e quatro seleções',
		'sizeFortyNine': 'Quarenta e nove seleções',
		'sizeFortyOne': 'Quarenta e uma seleções',
		'sizeFortySeven': 'Quarenta e sete seleções',
		'sizeFortySix': 'Quarenta e seis seleções',
		'sizeFortyThree': 'Quarenta e três seleções',
		'sizeFortyTwo': 'Quarenta e duas seleções',
		'sizeFour': 'Quadrupla',
		'sizeFours': 'Quadrupla',
		'sizeFourteen': 'Quatorze seleções',
		'sizeNine': 'Nónupla',
		'sizeNines': 'Nónupla',
		'sizeNineteen': 'Dezenove seleções',
		'sizeSeven': 'Séptupla',
		'sizeSevens': 'Séptupla',
		'sizeSeventeen': 'Dezessete seleções',
		'sizeSingle': 'Simples',
		'sizeSingles': 'Simples',
		'sizeSix': 'Sêxtupla',
		'sizeSixs': 'Sêxtupla',
		'sizeSixteen': 'Dezesseis seleções',
		'sizeSystem': 'Sistema',
		'sizeTen': 'Décupla',
		'sizeTens': 'Décupla',
		'sizeThirtheen': 'Treze seleções',
		'sizeThirty': 'Trinta seleções',
		'sizeThirtyEight': 'Trinta e oito seleções',
		'sizeThirtyFive': 'Trinta e cinco seleções',
		'sizeThirtyFour': 'Trinta e quatro seleções',
		'sizeThirtyNine': 'Trinta e nove seleções',
		'sizeThirtyOne': 'Trinta e uma seleções',
		'sizeThirtySeven': 'Trinta e sete seleções',
		'sizeThirtySix': 'Trinta e seis seleções',
		'sizeThirtyThree': 'Trinta e três seleções',
		'sizeThirtyTwo': 'Trinta e duas seleções',
		'sizeTriple': 'Tripla',
		'sizeTriples': 'Triplas',
		'sizeTwelve': 'Duodécupla',
		'sizeTwelves': 'Duodécupla',
		'sizeTwenty': 'Vinte seleções',
		'sizeTwentyEight': 'Vinte e oito seleções',
		'sizeTwentyFive': 'Vinte e cinco seleções',
		'sizeTwentyFour': 'Vinte e quatro seleções',
		'sizeTwentyNine': 'Vinte e nove seleções',
		'sizeTwentyOne': 'Vinte e uma seleções',
		'sizeTwentySeven': 'Vinte e sete seleções',
		'sizeTwentySix': 'Vinte e seis seleções',
		'sizeTwentyThree': 'Vinte e três seleções',
		'sizeTwentyTwo': 'Vinte e duas seleções',
	};
	@override late final _TranslationsBetslipSystemsPtBr systems = _TranslationsBetslipSystemsPtBr._(_root);
}

// Path: betslipErrors
class _TranslationsBetslipErrorsPtBr extends TranslationsBetslipErrorsEnUs {
	_TranslationsBetslipErrorsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get eachWayChangeApprove => 'Você quer aprovar a alteração das condições Each Way?';
	@override String get liveBettingNotAvailable => 'Aposta ao vivo não está disponível na sua região devido a regulamentos atuais.';
	@override String get maxCombinationSizeRestrictionForBOG => 'Observe que não é possível receber pagamentos de melhores odds garantidos referente a combinações maiores do que {0}.';
	@override String get maximumOutcomes => 'É permitido um máximo de {0} resultados no bilhete de aposta';
	@override String get maximumOutcomesHeader => 'Máximo de escolhas';
	@override String get maximumOutcomesInBetslip => 'Você excedeu o máximo de resultados permitidos no seu cupom de apostas';
	@override String get maximumOutcomesTitle => 'Máximo de Escolhas';
	@override String get mixedBestOddsAndOtherReward => 'Observe que não é possível obter os melhores odds garantidos quando qualquer outro prêmio é usado no cupom de apostas.';
	@override String get notCombinableAny => 'Uma das apostas adicionadas não pode ser combinada com uma ou mais das outras apostas.';
	@override String get notCombinable => 'Nota importante: alguns dos resultados estão relacionados e não podem ser combinados. As combinações, incluindo os resultados relacionados, foram retiradas.';
	@override String get notCombinableOutcomesNotRemoved => 'Infelizmente, os resultados selecionados não podem ser combinados ou excederam o número máximo de resultados';
	@override String get oddsAndEachWayChangeApprove => 'Você quer aprovar a alteração das condições Each-Way e dos odds?';
	@override String get oddsChangeApprove => 'Aprovar a alteração de odds';
	@override String get potentialPayoutHigherThanMaxExtraWinnings => 'O pagamento potencial excede os ganhos máximos permitidos pela recompensa que você selecionou.';
	@override String get prematchAndLiveEventsMixed => 'Infelizmente, neste momento não é possível combinar apostas ao vivo e não-vivo.';
	@override String get stakeHigherThanMaxStake => 'A aposta que você adicionou excede os ganhos máximos permitidos pela aposta que você selecionou.';
	@override String get stakeTooLowForToWin => 'O valor do seu ganho exige um aposta que está abaixo do permitido.';
}

// Path: betslip.systems
class _TranslationsBetslipSystemsPtBr extends TranslationsBetslipSystemsEnUs {
	_TranslationsBetslipSystemsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override Map<String, String> get betPackage => {
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
	@override String get bets => 'Apostas';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsPtBr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app.title': return 'KTO';
			case 'app.login': return 'Entrar';
			case 'app.register': return 'Registrar';
			case 'app.or': return 'ou';
			case 'bottomNav.casino': return 'Cassino';
			case 'bottomNav.live_casino': return 'Cassino Ao Vivo';
			case 'bottomNav.crash_games': return 'Crash Games';
			case 'bottomNav.promotions': return 'Promoções';
			case 'bottomNav.sports': return 'Esportes';
			case 'bottomNav.live': return 'Ao Vivo';
			case 'bottomNav.coming_soon': return 'Em Breve';
			case 'bottomNav.betting': return 'Apostas';
			case 'bottomNav.explore': return 'Explorar';
			case 'locales.en-US': return 'English (US)';
			case 'locales.pt-BR': return 'Português (Brasil)';
			case 'sports.startTimePrefix': return 'Horário de início: ';
			case 'sports.today': return 'Hoje';
			case 'sports.tomorrow': return 'Amanhã';
			case 'sports.dayAfterTomorrow': return 'Depois de amanhã';
			case 'betslip.combination.sizeCombination': return 'Combinação';
			case 'betslip.combination.sizeDouble': return 'Dupla';
			case 'betslip.combination.sizeDoubles': return 'Duplas';
			case 'betslip.combination.sizeEight': return 'Óctupla';
			case 'betslip.combination.sizeEighteen': return 'Dezoito seleções';
			case 'betslip.combination.sizeEights': return 'Óctupla';
			case 'betslip.combination.sizeEleven': return 'Undécupla';
			case 'betslip.combination.sizeElevens': return 'Undécupla';
			case 'betslip.combination.sizeFifteen': return 'Quinze seleções';
			case 'betslip.combination.sizeFifty': return 'Cinquenta seleções';
			case 'betslip.combination.sizeFive': return 'Quintupla';
			case 'betslip.combination.sizeFives': return 'Quintupla';
			case 'betslip.combination.sizeForty': return 'Quarenta seleções';
			case 'betslip.combination.sizeFortyEight': return 'Quarenta e oito seleções';
			case 'betslip.combination.sizeFortyFive': return 'Quarenta e cinco seleções';
			case 'betslip.combination.sizeFortyFour': return 'Quarenta e quatro seleções';
			case 'betslip.combination.sizeFortyNine': return 'Quarenta e nove seleções';
			case 'betslip.combination.sizeFortyOne': return 'Quarenta e uma seleções';
			case 'betslip.combination.sizeFortySeven': return 'Quarenta e sete seleções';
			case 'betslip.combination.sizeFortySix': return 'Quarenta e seis seleções';
			case 'betslip.combination.sizeFortyThree': return 'Quarenta e três seleções';
			case 'betslip.combination.sizeFortyTwo': return 'Quarenta e duas seleções';
			case 'betslip.combination.sizeFour': return 'Quadrupla';
			case 'betslip.combination.sizeFours': return 'Quadrupla';
			case 'betslip.combination.sizeFourteen': return 'Quatorze seleções';
			case 'betslip.combination.sizeNine': return 'Nónupla';
			case 'betslip.combination.sizeNines': return 'Nónupla';
			case 'betslip.combination.sizeNineteen': return 'Dezenove seleções';
			case 'betslip.combination.sizeSeven': return 'Séptupla';
			case 'betslip.combination.sizeSevens': return 'Séptupla';
			case 'betslip.combination.sizeSeventeen': return 'Dezessete seleções';
			case 'betslip.combination.sizeSingle': return 'Simples';
			case 'betslip.combination.sizeSingles': return 'Simples';
			case 'betslip.combination.sizeSix': return 'Sêxtupla';
			case 'betslip.combination.sizeSixs': return 'Sêxtupla';
			case 'betslip.combination.sizeSixteen': return 'Dezesseis seleções';
			case 'betslip.combination.sizeSystem': return 'Sistema';
			case 'betslip.combination.sizeTen': return 'Décupla';
			case 'betslip.combination.sizeTens': return 'Décupla';
			case 'betslip.combination.sizeThirtheen': return 'Treze seleções';
			case 'betslip.combination.sizeThirty': return 'Trinta seleções';
			case 'betslip.combination.sizeThirtyEight': return 'Trinta e oito seleções';
			case 'betslip.combination.sizeThirtyFive': return 'Trinta e cinco seleções';
			case 'betslip.combination.sizeThirtyFour': return 'Trinta e quatro seleções';
			case 'betslip.combination.sizeThirtyNine': return 'Trinta e nove seleções';
			case 'betslip.combination.sizeThirtyOne': return 'Trinta e uma seleções';
			case 'betslip.combination.sizeThirtySeven': return 'Trinta e sete seleções';
			case 'betslip.combination.sizeThirtySix': return 'Trinta e seis seleções';
			case 'betslip.combination.sizeThirtyThree': return 'Trinta e três seleções';
			case 'betslip.combination.sizeThirtyTwo': return 'Trinta e duas seleções';
			case 'betslip.combination.sizeTriple': return 'Tripla';
			case 'betslip.combination.sizeTriples': return 'Triplas';
			case 'betslip.combination.sizeTwelve': return 'Duodécupla';
			case 'betslip.combination.sizeTwelves': return 'Duodécupla';
			case 'betslip.combination.sizeTwenty': return 'Vinte seleções';
			case 'betslip.combination.sizeTwentyEight': return 'Vinte e oito seleções';
			case 'betslip.combination.sizeTwentyFive': return 'Vinte e cinco seleções';
			case 'betslip.combination.sizeTwentyFour': return 'Vinte e quatro seleções';
			case 'betslip.combination.sizeTwentyNine': return 'Vinte e nove seleções';
			case 'betslip.combination.sizeTwentyOne': return 'Vinte e uma seleções';
			case 'betslip.combination.sizeTwentySeven': return 'Vinte e sete seleções';
			case 'betslip.combination.sizeTwentySix': return 'Vinte e seis seleções';
			case 'betslip.combination.sizeTwentyThree': return 'Vinte e três seleções';
			case 'betslip.combination.sizeTwentyTwo': return 'Vinte e duas seleções';
			case 'betslip.systems.betPackage.canadian': return 'Canadian';
			case 'betslip.systems.betPackage.heinz': return 'Heinz';
			case 'betslip.systems.betPackage.lucky15': return 'Lucky 15';
			case 'betslip.systems.betPackage.lucky31': return 'Lucky 31';
			case 'betslip.systems.betPackage.lucky63': return 'Lucky 63';
			case 'betslip.systems.betPackage.patent': return 'Patent';
			case 'betslip.systems.betPackage.superheinz': return 'Super Heinz';
			case 'betslip.systems.betPackage.trixie': return 'Trixie';
			case 'betslip.systems.betPackage.yankee': return 'Yankee';
			case 'betslip.systems.bets': return 'Apostas';
			case 'betslipErrors.eachWayChangeApprove': return 'Você quer aprovar a alteração das condições Each Way?';
			case 'betslipErrors.liveBettingNotAvailable': return 'Aposta ao vivo não está disponível na sua região devido a regulamentos atuais.';
			case 'betslipErrors.maxCombinationSizeRestrictionForBOG': return 'Observe que não é possível receber pagamentos de melhores odds garantidos referente a combinações maiores do que {0}.';
			case 'betslipErrors.maximumOutcomes': return 'É permitido um máximo de {0} resultados no bilhete de aposta';
			case 'betslipErrors.maximumOutcomesHeader': return 'Máximo de escolhas';
			case 'betslipErrors.maximumOutcomesInBetslip': return 'Você excedeu o máximo de resultados permitidos no seu cupom de apostas';
			case 'betslipErrors.maximumOutcomesTitle': return 'Máximo de Escolhas';
			case 'betslipErrors.mixedBestOddsAndOtherReward': return 'Observe que não é possível obter os melhores odds garantidos quando qualquer outro prêmio é usado no cupom de apostas.';
			case 'betslipErrors.notCombinableAny': return 'Uma das apostas adicionadas não pode ser combinada com uma ou mais das outras apostas.';
			case 'betslipErrors.notCombinable': return 'Nota importante: alguns dos resultados estão relacionados e não podem ser combinados. As combinações, incluindo os resultados relacionados, foram retiradas.';
			case 'betslipErrors.notCombinableOutcomesNotRemoved': return 'Infelizmente, os resultados selecionados não podem ser combinados ou excederam o número máximo de resultados';
			case 'betslipErrors.oddsAndEachWayChangeApprove': return 'Você quer aprovar a alteração das condições Each-Way e dos odds?';
			case 'betslipErrors.oddsChangeApprove': return 'Aprovar a alteração de odds';
			case 'betslipErrors.potentialPayoutHigherThanMaxExtraWinnings': return 'O pagamento potencial excede os ganhos máximos permitidos pela recompensa que você selecionou.';
			case 'betslipErrors.prematchAndLiveEventsMixed': return 'Infelizmente, neste momento não é possível combinar apostas ao vivo e não-vivo.';
			case 'betslipErrors.stakeHigherThanMaxStake': return 'A aposta que você adicionou excede os ganhos máximos permitidos pela aposta que você selecionou.';
			case 'betslipErrors.stakeTooLowForToWin': return 'O valor do seu ganho exige um aposta que está abaixo do permitido.';
			default: return null;
		}
	}
}

