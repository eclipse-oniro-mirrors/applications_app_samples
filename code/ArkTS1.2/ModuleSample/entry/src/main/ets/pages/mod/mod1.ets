import hilog from '@ohos.hilog'
export class Mod1 {
  nna: string = '';
  static {
    hilog.info(0x0000, 'testTag', 'executeModule mod mod1');
  }
}
hilog.info(0x0000, 'testTag', 'executeModule import 顶层语句');