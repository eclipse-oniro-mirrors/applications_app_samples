import { describe, it, expect } from '@ohos/hypium';

/**
 * 本地单元测试占位：本工程被测逻辑依赖 ArkUI 弹窗类型与系统 API，
 * 完整测试见 entry/src/ohosTest/ets/test/（需在设备上执行）
 */
export default function localUnitTest() {
  describe('localUnitTest', () => {
    it('assertEqual', 0, () => {
      expect(1 + 1).assertEqual(2);
    });
  });
}
