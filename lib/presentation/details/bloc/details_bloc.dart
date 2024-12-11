import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investify/data/remote/models/final_generated_portfolio/final_generated_portfolio.dart';
import 'package:investify/data/remote/models/generate_portfolio/generate_portfolio.dart';
import 'package:investify/domain/remote_repositories/portfolio_repository.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final PortfolioRepository portfolioRepository;
  DetailsBloc(this.portfolioRepository) : super(DetailsInitial()) {
    on<GeneratePortfolioEvent>((event, emit) async {
      await _onGeneratePortfolio(emit, event);
    });
  }

  Future<void> _onGeneratePortfolio(
      Emitter<DetailsState> emit, GeneratePortfolioEvent event) async {
    emit(PortfolioLoading());
    try {
      // FIXME: LOGIC FOR DEVELOPMENT
      // await Future.delayed(const Duration(seconds: 1));
      // final testPortfolio = FinalGeneratePortfolio(
      //     userPreferences: UserPreferences(
      //         strategy: 'Сбалансированный',
      //         allocationPreferences: [],
      //         preferredInstruments: []),
      //     generatedPortfolio: GeneratedPortfolio(
      //         allocation: [
      //           Allocation(
      //               category: 'Акции',
      //               instruments: ['GAZP', 'SBER', 'LKOH', 'YNDX', 'MGNT'],
      //               percentage: 40),
      //           Allocation(
      //               category: 'Облигации',
      //               instruments: [
      //                 'Российские государственные облигации',
      //                 'Российские копроративные облигации'
      //               ],
      //               percentage: 40),
      //           Allocation(
      //               category: 'Валюта',
      //               instruments: ['USD/RUB'],
      //               percentage: 10),
      //           Allocation(
      //               category: 'Золото',
      //               instruments: ['"Gold ETFs"'],
      //               percentage: 10),
      //           Allocation(
      //               category: 'Нефть',
      //               instruments: ['Роснефть', 'Лукойл'],
      //               percentage: 10)
      //         ],
      //         rationale:
      //             'Учитывая сбалансированную стратегию, портфель распределен между акциями, облигациями, валютой, золотом и нефтью для диверсификации и умеренного риска. Приоритет отдается российским инструментам.',
      //         strategy: 'Сбалансированный'));
      // emit(PortfolioLoaded(portfolio: testPortfolio));
      // return;
      // FIXME: END OF DEV

      // ignore: dead_code
      final endDate = DateTime.now().add(Duration(days: event.days));
      final generatePortfolio = GeneratePortfolio(
          moneyAmount: event.moneyAmount,
          endDate: endDate,
          volatility: event.volatility / 100,
          desiredInstrumentsCategories: event.desiredInstrumentsCategories);
      final portfolio =
          await portfolioRepository.generatePortfolio(generatePortfolio);
      emit(PortfolioLoaded(portfolio: portfolio));
    } catch (e) {
      emit(PortfolioError());
    }
  }
}
