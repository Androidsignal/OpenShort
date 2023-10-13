import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:openpgp/openpgp.dart';
import 'contact_screen_event.dart';
import 'contact_screen_state.dart';


class ContactsScreenBloc extends Bloc<ContactsScreenEvent,ContactsScreenState>{
  ContactsScreenBloc() : super(const ContactsScreenState()){
    on<QrCodeCheck>(_onQrCodeCheck);
    on<KeyGenerate>(_onKeyGenerate);
    on<IsLoading>(_onIsLoading);
    on<SliderValue>(_onSliderValue);
    on<EncryptionDownUp>(_onEncryptionDownUp);
    on<DecryptionDownUp>(_onDecryptionDownUp);
    on<EncryptionSigningDown>(_onEncryptionSigningDown);
    on<DecryptionSigningDown>(_onDecryptionSigningDown);
    on<EncryptionShowKeyList>(_onEncryptionShowKeyList);
    on<DecryptionShowKeyList>(_onDecryptionShowKeyList);
    on<EncryptionButtonShow>(_onEncryptionButtonShow);
    on<DecryptionButtonShow>(_onDecryptionButtonShow);
     on<GenerateKeyPair>(_onGetKeyPair);
  }


  FutureOr<void> _onQrCodeCheck(QrCodeCheck event, Emitter<ContactsScreenState> emit) {
    emit(state.copyWith(isQrCode: event.isQrCode, keyList: event.keyList));
  }


  FutureOr<void> _onKeyGenerate(KeyGenerate event, Emitter<ContactsScreenState> emit) {
    emit(state.copyWith(isGenerateKey:  event.isGenerateKey));
  }

  FutureOr<void> _onIsLoading(IsLoading event, Emitter<ContactsScreenState> emit) {
    emit(state.copyWith(isLoading:   event.isLoading));
  }

  FutureOr<void> _onSliderValue(SliderValue event, Emitter<ContactsScreenState> emit) {
    emit(state.copyWith(currentSliderValue: event.currentSliderValue));
  }

  FutureOr<void> _onEncryptionDownUp(EncryptionDownUp event, Emitter<ContactsScreenState> emit) {
    emit(state.copyWith(isEncrDown: !event.isEncrDown));
  }

  FutureOr<void> _onDecryptionDownUp(DecryptionDownUp event, Emitter<ContactsScreenState> emit) {
    emit(state.copyWith(isDecDown:  !event.isDecDown));
  }


  FutureOr<void> _onEncryptionSigningDown(EncryptionSigningDown event, Emitter<ContactsScreenState> emit) {
    emit(state.copyWith(isSigningDown: !event.isSigningDown));
  }

  FutureOr<void> _onDecryptionSigningDown(DecryptionSigningDown event, Emitter<ContactsScreenState> emit) {
    emit(state.copyWith(isDecrypDown: !event.isDecrypDown));
  }

  FutureOr<void> _onEncryptionShowKeyList(EncryptionShowKeyList event, Emitter<ContactsScreenState> emit) {
    emit(state.copyWith(showKeyList:  event.showKeyList));
  }

  FutureOr<void> _onDecryptionShowKeyList(DecryptionShowKeyList event, Emitter<ContactsScreenState> emit) {
    emit(state.copyWith(showKeyListDecry:   event.showKeyListDecry));
  }


  FutureOr<void> _onEncryptionButtonShow(EncryptionButtonShow event, Emitter<ContactsScreenState> emit) {
    emit(state.copyWith(buttonShowEnc: event.buttonShowEnc));
  }


  FutureOr<void> _onDecryptionButtonShow(DecryptionButtonShow event, Emitter<ContactsScreenState> emit) {
    emit(state.copyWith(buttonShowDec: event.buttonShowDec));
  }

  FutureOr<void> _onGetKeyPair(GenerateKeyPair event, Emitter<ContactsScreenState> emit) async {

    var keyOptions = KeyOptions()..rsaBits = 2048;
    KeyPair keyPair =  await OpenPGP.generate(
      options: Options()
        ..name = 'test'
        ..email = 'test@test.com'
        ..passphrase = 'Nilesh@9401'
        ..keyOptions = keyOptions,
    );
    emit(state.copyWith(keyPair: keyPair,keyOptions: keyOptions));
  }









}