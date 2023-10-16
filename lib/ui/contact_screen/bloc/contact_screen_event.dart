import 'package:equatable/equatable.dart';
import '../../../infrastucture/model/generate_key_model.dart';

abstract class ContactsScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class QrCodeCheck extends ContactsScreenEvent {
  final bool isQrCode;
  final GenerateKeyModel? keyList;

  QrCodeCheck({required this.isQrCode, this.keyList});

  @override
  List<Object?> get props => [isQrCode, keyList];
}

class KeyGenerate extends ContactsScreenEvent {
  final bool isGenerateKey;

  KeyGenerate({required this.isGenerateKey});

  @override
  List<Object?> get props => [isGenerateKey];
}

class IsLoading extends ContactsScreenEvent {
  final bool isLoading;

  IsLoading({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class SliderValue extends ContactsScreenEvent {
  final double currentSliderValue;

  SliderValue({required this.currentSliderValue});

  @override
  List<Object?> get props => [currentSliderValue];
}

class EncryptionDownUp extends ContactsScreenEvent {
  final bool isEncrDown;

  EncryptionDownUp({required this.isEncrDown});

  @override
  List<Object?> get props => [isEncrDown];
}

class DecryptionDownUp extends ContactsScreenEvent {
  final bool isDecDown;

  DecryptionDownUp({required this.isDecDown});

  @override
  List<Object?> get props => [isDecDown];
}

class EncryptionSigningDown extends ContactsScreenEvent {
  final bool isSigningDown;

  EncryptionSigningDown({required this.isSigningDown});

  @override
  List<Object?> get props => [isSigningDown];
}

class DecryptionSigningDown extends ContactsScreenEvent {
  final bool isDecrypDown;

  DecryptionSigningDown({required this.isDecrypDown});

  @override
  List<Object?> get props => [isDecrypDown];
}

class EncryptionShowKeyList extends ContactsScreenEvent {
  final bool showKeyList;

  EncryptionShowKeyList({required this.showKeyList});

  @override
  List<Object?> get props => [showKeyList];
}

class DecryptionShowKeyList extends ContactsScreenEvent {
  final bool showKeyListDecry;

  DecryptionShowKeyList({required this.showKeyListDecry});

  @override
  List<Object?> get props => [showKeyListDecry];
}

class EncryptionButtonShow extends ContactsScreenEvent {
  final bool buttonShowEnc;

  EncryptionButtonShow({required this.buttonShowEnc});

  @override
  List<Object?> get props => [buttonShowEnc];
}

class DecryptionButtonShow extends ContactsScreenEvent {
  final bool buttonShowDec;

  DecryptionButtonShow({required this.buttonShowDec});

  @override
  List<Object?> get props => [buttonShowDec];
}

class GenerateKeyPair extends ContactsScreenEvent {


  GenerateKeyPair();

  @override
  List<Object?> get props => [];
}
