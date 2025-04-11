import hilog from '@ohos.hilog'
export class Mod2 {
  name: string = '';
  static {
    hilog.info(0x0000, 'testTag', 'executeModule mod2');
  }
}
hilog.info(0x0000, 'testTag', 'executeModule export 顶层语句');