import 'package:mobx/mobx.dart';
import 'dart:async';
part 'cronos.store.g.dart';

class CronosStore = _CronosStore with _$CronosStore;

enum TipoIntervalo { DISPARAR, DESCANSO }

abstract class _CronosStore with Store {
  @observable
  bool iniciado = false;

  @observable
  int minutos = 0;

  @observable
  int segundos = 0;

  @observable
  int dispararTempo = 0;

  @observable
  int tempoDescanso = 0;

  @action
  TipoIntervalo tipoIntervalo = TipoIntervalo.DISPARAR;

  Timer? cronometro;

  @action
  void iniciar() {
    iniciado = true;
    cronometro = Timer.periodic(Duration(seconds: 1), (timer) {
      if (minutos == 0 && segundos == 0) {
        _trocarTipoIntervalo();
      } else if (segundos == 0) {
        segundos = 59;
        minutos--;
      } else {
        segundos--;
      }
    });
  }

  @action
  void parar() {
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void reiniciar() {
    parar();
    minutos = disparar() ? dispararTempo : tempoDescanso;
    segundos = 0;
  }

  @action
  void incrementarDispararTempo() {
    if (dispararTempo > 1) {
      dispararTempo--;
      if (disparar()) {
        reiniciar();
      }
    }
  }

  @action
  void decrementarDispararTempo() {
    dispararTempo++;
    if (disparar()) {
      reiniciar();
    }
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
    if (descansando()) {
      reiniciar();
    }
  }

  @action
  void decrementartempoDescanso() {
    if (tempoDescanso > 1) {
      tempoDescanso--;
      if (descansando()) {
        reiniciar();
      }
    }
  }

  bool disparar() {
    return tipoIntervalo == TipoIntervalo.DISPARAR;
  }

  bool descansando() {
    return tipoIntervalo == TipoIntervalo.DESCANSO;
  }

  void _trocarTipoIntervalo() {
    if (disparar()) {
      tipoIntervalo = TipoIntervalo.DESCANSO;
      minutos = tempoDescanso;
    } else {
      tipoIntervalo = TipoIntervalo.DISPARAR;
      minutos = dispararTempo;
    }
    segundos = 0;
  }
}
