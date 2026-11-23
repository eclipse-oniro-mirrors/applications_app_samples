@ObservedV2
export default class SettingModel {
  @Trace public clearClipboard: boolean = true;
  @Trace public privacyMode: boolean = true;
  @Trace public simpleKeyboard: boolean = true;
  @Trace public allowDeveloperMode: boolean = false;
  @Trace public allowEmulator: boolean = false;
  @Trace public screenRecord: boolean = false;
}
