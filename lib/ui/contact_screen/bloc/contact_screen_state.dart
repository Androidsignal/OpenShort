import 'package:equatable/equatable.dart';
import 'package:openpgp/openpgp.dart';

import '../../../infrastucture/model/generate_key_model.dart';

class ContactsScreenState extends Equatable {
  final bool isQrCode;
  final bool isGenerateKey;
  final bool isLoading;
  final double currentSliderValue;
  final GenerateKeyModel? keyList;
  final bool isEncrDown;
  final bool isDecDown;
  final bool isSigningDown;
  final bool isDecrypDown;
  final bool showKeyList;
  final bool showKeyListDecry;
  final bool buttonShowEnc;
  final bool buttonShowDec;
  final KeyPair? keyPair;
  final KeyOptions? keyOptions;

  const ContactsScreenState({
    this.isQrCode = false,
    this.isGenerateKey = false,
    this.isLoading = false,
    this.currentSliderValue = 2048,
    this.keyList,
    this.isEncrDown = true,
    this.isDecDown = true,
    this.isSigningDown = true,
    this.isDecrypDown = true,
    this.showKeyList = false,
    this.showKeyListDecry = false,
    this.buttonShowEnc = false,
    this.buttonShowDec = false,
    this.keyPair,
    this.keyOptions,
  });

  ContactsScreenState copyWith({
    bool? isQrCode,
    bool? isGenerateKey,
    bool? isLoading,
    double? currentSliderValue,
    GenerateKeyModel? keyList,
    bool? isEncrDown,
    bool? isDecDown,
    bool? isSigningDown,
    bool? isDecrypDown,
    bool? showKeyList,
    bool? showKeyListDecry,
    bool? buttonShowEnc,
    bool? buttonShowDec,
    KeyPair? keyPair,
    KeyOptions? keyOptions,
  }) {
    return ContactsScreenState(
      isQrCode: isQrCode ?? this.isQrCode,
      isGenerateKey: isGenerateKey ?? this.isGenerateKey,
      isLoading: isLoading ?? this.isLoading,
      currentSliderValue: currentSliderValue ?? this.currentSliderValue,
      keyList: keyList ?? this.keyList,
      isEncrDown: isEncrDown ?? this.isEncrDown,
      isDecDown: isDecDown ?? this.isDecDown,
      isSigningDown: isSigningDown ?? this.isSigningDown,
      isDecrypDown: isDecrypDown ?? this.isDecrypDown,
      showKeyList: showKeyList ?? this.showKeyList,
      showKeyListDecry: showKeyListDecry ?? this.showKeyListDecry,
      buttonShowEnc: buttonShowEnc ?? this.buttonShowEnc,
      buttonShowDec: buttonShowDec ?? this.buttonShowDec,
      keyPair: keyPair ?? this.keyPair,
      keyOptions: keyOptions ?? this.keyOptions,
    );
  }

  @override
  List<Object?> get props => [
        isQrCode,
        isGenerateKey,
        isLoading,
        currentSliderValue,
        keyList,
        isEncrDown,
        isDecDown,
        isSigningDown,
        isDecrypDown,
        showKeyList,
        showKeyListDecry,
        buttonShowEnc,
        buttonShowDec,
        keyPair,
        keyOptions,
      ];
}
