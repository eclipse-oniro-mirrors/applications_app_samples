@ObservedV2
export default class SettingModel {
  @Trace clearClipboard: boolean = true;
  @Trace privacyMode: boolean = true;
  @Trace simpleKeyboard: boolean = true;
  @Trace allowDeveloperMode: boolean = false;
  @Trace allowEmulator: boolean = false;
  @Trace screenRecord: boolean = false;
}
