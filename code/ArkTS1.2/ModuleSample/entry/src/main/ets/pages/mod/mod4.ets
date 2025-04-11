import hilog from '@ohos.hilog'
export class ExportSmallClassTest {
  static exportTime: double = 0;
  static isExportOtherClass = false;
  static {
    ExportSmallClassTest.exportTime = Date.now();
    hilog.info(0x0000, 'testTag', 'executeModule mod4 smallclass');
  }
  static na = 'zhangsan';
}